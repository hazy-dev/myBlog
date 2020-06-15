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
             <h1>MENU</h1>
             <span class="subheading">menu controll...</span>
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
					<h2>메뉴 관리</h2>
				</div>
				<br />
				<table class="table table-hover" id="auth_list_table">
					<colgroup>
						<col width="10%">
						<col width="18%">
						<col width="18%">
						<col width="18%">
						<col width="16%">
						<col width="10%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr>
							<th>#</th>
							<th>Menu</th>
							<th>Move</th>
							<th>Admin</th>
							<th>Auth</th>
							<th>Sequence</th>
							<th>Hide</th>
						</tr>
					</thead>
					<tbody>
					 	
					</tbody>
				</table>
				<div class="admin_div">
				  <div style="text-align: right;">
				    <button type="button" onclick="add_menu()" class="btn btn-default">add Menu</button>
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

	list_update();			
	function list_update(){
	
		$.ajax({
			type: 'post',
			url: '/menu_list',
			contentType: "application/x-www-form-urlencoded;charset=UTF-8",
			dataType: "json",
			success: function(result){
	
				$("#auth_list_table tbody tr").remove();
				console.log(result);
				var list_html = "";
				
				for( var i= 0 ; i<result.list.length; i++ ){
					list_html += '<tr>';
					list_html += '<th scope="row">#</th>';
					list_html += '<td>' + result.list[i].menu + '</td>';
					list_html += '<td>' + result.list[i].move + '</td>';
					list_html += '<td>' + result.list[i].name + '</td>';
					
					list_html += '<td><select class="form-control" onchange="auth_change('+ result.list[i].idx +',this.value);" >';
					if( result.list[i].menuAuth == '0' ){
						list_html += '<option selected value="0">최고 관리자</option>';
						list_html += '<option value="1">관리자</option>';
						list_html += '<option value="2">게스트</option></select></td>';
					}else if( result.list[i].menuAuth == '1' ){
						list_html += '<option value="0">최고 관리자</option>';
						list_html += '<option selected value="1">관리자</option>';
						list_html += '<option value="2">게스트</option></select></td>';
					}else{
						list_html += '<option value="0">최고 관리자</option>';
						list_html += '<option value="1">관리자</option>';
						list_html += '<option selected value="2">게스트</option></select></td>';
					}
					
					list_html += '<td><select class="form-control" onchange="seq_change('+ result.list[i].idx +',this.value);" >';
					for( var j = 0; j <= result.max_seq; j++ ){
						list_html += '<option ';
						if( result.list[i].seq == j ) list_html += 'selected';
						list_html += ' value="' + j + '">' + j + '</option>';
					}
					list_html += '</select></td>';
					
					list_html += '<td><select class="form-control" onchange="hide_change('+ result.list[i].idx +',this.value);" >';
					if( result.list[i].hide == 'Y' ){
						list_html += '<option selected value="Y">Y</option>';
						list_html += '<option value="N">N</option></select></td>';
					}else{
						list_html += '<option value="Y">Y</option>';
						list_html += '<option selected value="N">N</option></select></td>';
					}
					
					list_html += '</tr>';
				}
	
				$("#auth_list_table tbody").append(list_html);
				
			},
			error: function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	
	function auth_change(num,value){
		var menu_auth =  value;
		console.log(menu_auth + "  :::   " +num);
		
		var admin_name = "게스트";
		if( menu_auth == 0 ) admin_name = "최고 관리자";    
		if( menu_auth == 1 ) admin_name = "관리자";
		
		if( !confirm( admin_name + "로 권한을 변경하시겠습니까?") ){
			return false;
		}
		
		$.ajax({
			type: 'post',
			url: '/menu_auth_update?menu_auth=' + menu_auth  + '&idx=' + num,
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
	
	function seq_change(num,value){
		var seq =  value;
		console.log(seq + "  :::   " +num);
		
		if( !confirm( '메뉴 순서을 변경하시겠습니까?' )){
			return false;
		}
		
		$.ajax({
			type: 'post',
			url: '/menu_seq_update?seq=' + seq  + '&idx=' + num,
			contentType: "application/x-www-form-urlencoded;charset=UTF-8",
			dataType: "json",
			success: function(result){

				alert('수정되었습니다.');
				reload();
			},
			error: function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	
	function hide_change(num,value){
		var hide =  value;
		console.log(hide + "  :::   " +num);
		
		var hide_type = "게스트";
		if( hide == 'Y' ) hide_type = "숨기시겠습니까?";    
		if( hide == 'N' ) hide_type = "보이시겠습니까?";
		
		if( !confirm( "해당 메뉴를 " + hide_type ) ){
			return false;
		}
		
		$.ajax({
			type: 'post',
			url: '/menu_hide_update?hide=' + hide  + '&idx=' + num,
			contentType: "application/x-www-form-urlencoded;charset=UTF-8",
			dataType: "json",
			success: function(result){
				console.log(result);
				alert('수정되었습니다.');
				reload();
			},
			error: function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	
	function reload(){
		location.href = "/menu"
	}
	
	function add_menu(){
		location.href = "/menu_add"
	}
	
</script>

</html>
