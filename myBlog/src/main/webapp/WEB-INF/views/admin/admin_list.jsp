<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">

<jsp:include page="../include/head.jsp" flush="flase" />	

<body>

    <!-- Navigation -->
	<jsp:include page="../include/navigation.jsp" flush="flase" />	

    <!-- Page Header -->
    <header class="masthead" style="background-image: url('images/home-bg.jpg')">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <div class="site-heading">
              <h1> ADMIN </h1>
              <span class="subheading"> upload item.. ( login need ) </span>
            </div>
          </div>
        </div>
      </div>
    </header>

	<!-- Main Content -->
	<div class="container" style="height : 600px;">
		<div class="row" style="height : 100%;" >
			<div class="admin_list">
				<div class="admin_h3div">
					<h2>페이지 관리</h2>
				</div>
				<br />
				<table class="table table-hover" id="admin_list_table">
					<colgroup>
						<col width="10%">
						<col width="15%">
						<col width="35%">
						<col width="20%">
						<col width="10%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr>
							<th>#</th>
							<th>Category</th>
							<th>Subject</th>
							<th>Filename</th>
							<th>Del_yn</th>
							<th>Table_auth</th>
						</tr>
					</thead>
					<tbody>
					 	
					</tbody>
				</table>
				
				<div class="admin_paging" id="admin_paging">
					
				<%-- <div>
                                             총 게시글 수 : ${pagination.listCnt } /    총 페이지 수 : ${pagination.pageCnt } / 현재 페이지 : ${pagination.curPage } / 현재 블럭 : ${pagination.curRange } / 총 블럭 수 : ${pagination.rangeCnt }
                </div>
                 --%>
				</div>
				<div class="admin_div">
				  <div style="text-align: right;">
				    <button type="button" onclick="add_list()" class="btn btn-default">add List</button>
				  </div>
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
		list_update(1);
	});
	
	function fn_paging(curPage) {
		list_update(curPage);
	}
	
	function list_update(curPage){

		$.ajax({
			type: 'post',
			url: '/admin_table_list?page=' + curPage,
			contentType: "application/x-www-form-urlencoded;charset=UTF-8",
			dataType: "json",
			success: function(result){

				$("#admin_list_table tbody tr").remove();
				console.log(result);
				var list_html = "";
				
				for( var i= 0 ; i<result.list.length; i++ ){
					list_html += '<tr>';
					list_html += '<th scope="row">0</th>';
					if( result.list[i].category == 1 ){
						list_html += '<td>포트폴리오</td>';
					}else if( result.list[i].category == 2 ){
						list_html += '<td>포스트</td>';
					}
					
					list_html += '<td>' + result.list[i].subject + '</td>';
					list_html += '<td>' + result.list[i].filename + '</td>';
					
					list_html += '<td><select class="form-control" id="delyn_selectbox" name="delyn_selectbox" onchange="delyn_change('+ result.list[i].idx +',this.value);">';
					if( result.list[i].delYn == 'Y' ){
						list_html += '<option selected value="Y">Y</option>';
						list_html += '<option value="N">N</option></select></td>';
					}else{
						list_html += '<option value="Y">Y</option>';
						list_html += '<option selected value="N">N</option></select></td>';
					}
					
					list_html += '<td><select class="form-control" id="auth_selectbox" name="auth_selectbox" onchange="auth_change('+ result.list[i].idx +',this.value);" >';
					if( result.list[i].tableAuth == '1' ){
						list_html += '<option selected value="1">1</option>';
						list_html += '<option value="2">2</option></select></td>';
					}else{
						list_html += '<option value="1">1</option>';
						list_html += '<option selected value="2">2</option></select></td>';
					}

					list_html += '</tr>';
				}

				$("#admin_list_table tbody").append(list_html);
				
				$("#admin_paging nav").remove();
				var paging_html = "";
				
				paging_html += '<nav aria-label="Page navigation example"><ul class="pagination justify-content-center">';
			   	if(result.pagination.curRange != 1){
			   		paging_html += '<li class="page-item">';
			   		paging_html += '<a class="page-link" onClick="fn_paging(1)" aria-label="Previous">';
			   		paging_html += '<span aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span>';
			   		paging_html += '</a>';
			   		paging_html += '</li>';
			   	}
			    if( result.pagination.curPage != 1 ){
				    paging_html += '<li class="page-item">';
				    paging_html += '<a class="page-link"  onClick="fn_paging(' + result.pagination.prevPage + ')"  aria-label="Previous">';
				    paging_html += '<span aria-hidden="true">&lt;</span>';
				    paging_html += '<span class="sr-only">Previous</span>';
				    paging_html += '</a>';
				    paging_html += '</li>';
			    }
			    
			    for( var i = result.pagination.startPage; i <= result.pagination.endPage; i++  ){
			    	console.log(i);
			    	if( i == result.pagination.curPage ){
			    		paging_html += '<li class="page-item"><span style="font-weight: bold;"><a class="page-link"  onClick="fn_paging(' + i + ')">' + i + '</a></span></li>';
			    	}else{
			    		paging_html += '<li class="page-item"><a class="page-link" onClick="fn_paging(' + i + ')">' + i + '</a></li>';
			    	}
			    }

			    if( result.pagination.curPage != result.pagination.pageCnt && result.pagination.pageCnt > 0 ){
			    	paging_html += '<li class="page-item">';
			    	paging_html += '<a class="page-link"  onClick="fn_paging(' + result.pagination.nextPage + ')"  aria-label="Next">';
			    	paging_html += '<span aria-hidden="true">&gt;</span>';
			    	paging_html += '<span class="sr-only">Previous</span>';
			    	paging_html += '</a>';
			    	paging_html += '</li>';
			    }
			    if( result.pagination.curRange != result.pagination.rangeCnt && result.pagination.rangeCnt > 0 ){
			    	paging_html += '<li class="page-item">';
					paging_html += '<a class="page-link" onClick="fn_paging(' + result.pagination.pageCnt + ')" aria-label="Next">';
					paging_html += '<span aria-hidden="true">&raquo;</span>';
					paging_html += '<span class="sr-only">Next</span>';
					paging_html += '</a>';
					paging_html += '</li>';
			    }
			    paging_html += '</ul>';
			    paging_html += '</nav>';
				
				$("#admin_paging").append(paging_html);	
				
			},
			error: function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	
	
	function add_list(){
		location.href = "/admin_upload_page";
	}
	
	function delyn_change(num,value){
		var del_yn =  value;
		console.log(del_yn + "  :::   " +num);
		$.ajax({
			type: 'post',
			url: '/admin_update_del_yn?del_yn=' + del_yn  + '&idx=' + num,
			contentType: "application/x-www-form-urlencoded;charset=UTF-8",
			dataType: "json",
			success: function(result){
				console.log(result);
				alert('수정되었습니다.');
			},
			error: function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	
	function auth_change(num,value){
		var table_auth =  value;
		console.log(table_auth + "  :::   " +num);
		$.ajax({
			type: 'post',
			url: '/admin_update_table_auth?table_auth=' + table_auth + '&idx=' + num,
			contentType: "application/x-www-form-urlencoded;charset=UTF-8",
			dataType: "json",
			success: function(result){
				console.log(result);
				alert('수정되었습니다.');
			},
			error: function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	

</script>

</html>
