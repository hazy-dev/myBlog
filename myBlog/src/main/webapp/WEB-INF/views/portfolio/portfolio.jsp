<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">

 <jsp:include page="../include/head.jsp" flush="flase" />	

<body>

   <!-- Navigation -->
   <jsp:include page="../include/navigation.jsp" flush="flase" />	

   <!-- Page Header -->
   <header class="masthead" style="background-image: url('images/about-bg.jpg')">
     <div class="overlay"></div>
     <div class="container">
       <div class="row">
         <div class="col-lg-8 col-md-10 mx-auto">
           <div class="page-heading">
             <h1>PROTFOLIO</h1>
             <!-- <span class="subheading">I make.</span> -->
           </div>
         </div>
       </div>
     </div>
   </header>

   <!-- Main Content -->
   <div class="container">
     <div class="row">
       <div class="col-lg-8 col-md-10 mx-auto">
         
         <div id="portfolio_list_div" ></div>
        <!-- Pager -->
        <div class="clearfix" id="portfolio_list_paging">
            <a class="btn btn-primary float-right" onclick = "fn_paging();">더보기 &nbsp; &rarr;</a>
        </div>
         
       </div>
     </div>
   </div>

   <hr>

   <!-- Footer -->
   <jsp:include page="../include/footer.jsp" flush="flase" />

</body>
  
<script type="text/javascript">

	$(document).ready(function() {
		portfolio_list(1);
	});
	
	var page_idx = 1;
	
	function fn_paging() {
		// 더보기를 눌렀을 떄 page값 증가
		page_idx ++ ;
		console.log(page_idx);
		portfolio_list(page_idx);
	}
	
	function portfolio_list(curPage){
	
		$.ajax({
			type: 'post',
			url: '/portfolio_list?page=' + curPage,
			contentType: "application/x-www-form-urlencoded;charset=UTF-8",
			dataType: "json",
			success: function(result){
				
				var page_idx = result.page * 5;
				console.log(page_idx + " :::: " + result.listCnt );
				if( result.listCnt <= page_idx ){
					$("#portfolio_list_paging").hide();
				}
				
				var list_html = "";
				
				for( var i= 0 ; i<result.list.length; i++ ){
					list_html += '<div class="post-preview"><a onclick="portfolio_detail(' + "'"+ result.list[i].filename +"'" + ')"><h2 class="post-title">' + result.list[i].subject + '</h2>';
					list_html += '<h4 class="post-subtitle">' + result.list[i].memo +  '</h4></a>';
					list_html += '<p class="post-meta">' + result.list[i].uploadDate + '</p></div><hr>';
				}
				
				if( result.list.length == 0 ){
					list_html += '<div class="post-preview"><a><h2 class="post-title">포트폴리오가 준비되지 않았습니다.</h2>';
					list_html += '<h4 class="post-subtitle">준비되면 업로드 하겠습니다.</h4></a>';
					list_html += '<p class="post-meta"></p></div><hr>';
				}
	
				$("#portfolio_list_div").append(list_html);
				
				
			},
			error: function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	
	function portfolio_detail(item){
		location.href="/portfolio_detail?item=" + item;
	}

</script>

</html>
