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
             <h1>AUTH</h1>
             <span class="subheading">auth controll...</span>
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
					<h2>권한 관리</h2>
				</div>
				<br />
				<table class="table table-hover" id="auth_list_table">
					<colgroup>
						<col width="10%">
						<col width="30%">
						<col width="30%">
						<col width="20%">
					</colgroup>
					<thead>
						<tr>
							<th>#</th>
							<th>Id</th>
							<th>Name</th>
							<th>Auth</th>
						</tr>
					</thead>
					<tbody>
					 	
					</tbody>
				</table>
				<div class="admin_div">
				  <div style="text-align: right;">
				    <button type="button" onclick="add_user()" class="btn btn-default">add User</button>
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
		//list_update();
	});
	
	list_update();
	function list_update(){
	
		$.ajax({
			type: 'post',
			url: '/auth_list',
			contentType: "application/x-www-form-urlencoded;charset=UTF-8",
			dataType: "json",
			success: function(result){
	
				$("#auth_list_table tbody tr").remove();
				console.log(result);
				var list_html = "";
				
				for( var i= 0 ; i<result.list.length; i++ ){
					list_html += '<tr>';
					list_html += '<th scope="row">0</th>';
					list_html += '<td>' + result.list[i].id + '</td>';
					list_html += '<td>' + result.list[i].name + '</td>';
					
					list_html += '<td><select class="form-control" id="auth_selectbox" name="auth_selectbox" onchange="auth_change('+ result.list[i].idx +',this.value);" >';
					if( result.list[i].authGroup == '0' ){
						list_html += '<option selected value="0">최고 관리자</option>';
						list_html += '<option value="1">관리자</option>';
						list_html += '<option value="2">게스트</option></select></td>';
					}else if( result.list[i].authGroup == '1' ){
						list_html += '<option value="0">최고 관리자</option>';
						list_html += '<option selected value="1">관리자</option>';
						list_html += '<option value="2">게스트</option></select></td>';
					}else{
						list_html += '<option value="0">최고 관리자</option>';
						list_html += '<option value="1">관리자</option>';
						list_html += '<option selected value="2">게스트</option></select></td>';
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
		var auth_group =  value;
		console.log(auth_group + "  :::   " +num);
		
		var admin_name = "게스트";
		if( auth_group == 0 ) admin_name = "최고 관리자";    
		if( auth_group == 1 ) admin_name = "관리자";
		
		if( !confirm( admin_name + " 로 권한을 변경하시겠습니까?") ){
			return false;
		}
		
		$.ajax({
			type: 'post',
			url: '/auth_update?auth_group=' + auth_group  + '&idx=' + num,
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
	
	function add_user(){
		location.href = "/auth_add"
	}
	
</script>

</html>
