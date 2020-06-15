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
              <h1> MENU ADD </h1>
              <span class="subheading"> menu add... </span>
            </div>
          </div>
        </div>
      </div>
    </header>

	<!-- Main Content -->
	<div class="container" style="height : 600px;">
      <div class="row" style="height : 100%;" >
        <div class="admin_loginform">
			<div class="admin_h3div">
				<h2>메뉴 추가</h2>
			</div>
			<br />
			<form class="form-horizontal" id="menuAdd_frm" method="post" action="/menu_insert" >
				<div>
					<div class="admin_div">
					  <div class="admin_inputid">
					    <input id="menu" name="menu" type="text" class="form-control" placeholder="menu ( 신규 메뉴 )" >
					  </div>
					</div>
					<div class="admin_div">
					  <div class="admin_inputid">
					    <input id="move" name="move" type="text" class="form-control" placeholder="move ( 메뉴 경로 )" >
					  </div>
					</div>
					<div class="admin_div">
					  <div class="admin_iputpassword">
					    <select class="form-control" id="admin_selectbox" name="admin_selectbox">
						    <option value="">관리자</option>
						</select>
					  </div>
					</div>
					<div class="admin_div">
					  <div class="admin_iputpassword">
					    <select class="form-control" id="menu_auth_selectbox" name="menu_auth_selectbox">
						    <option value="">접근 권한</option>
							<option value="0">최고 관리자</option>
							<option value="1">관리자</option>
							<option value="2">게스트</option>
						</select>
					  </div>
					</div>
					<div class="admin_div">
					  <div class="admin_iputpassword">
					    <select class="form-control" id="hide_selectbox" name="hide_selectbox">
						    <option value="">공개여부</option>
							<option value="Y">비공개</option>
							<option value="N">공개</option>
						</select>
					  </div>
					</div>
					<div class="admin_div" style="margin-top : 20px;">
					  <div class="admin_btn">
					    <button type="button" onclick="menu_add()" class="btn btn-default">Sign in</button>
					  </div>
					  <div class="admin_btn">
					    <button type="button" onclick="back()" class="btn btn-default">back</button>
					  </div>
					</div>
				</div>
			</form>
        </div>
      </div>
    </div>

    <hr>

    <!-- Footer -->
    <jsp:include page="../include/footer.jsp" flush="flase" />	

 </body>
 
<script type="text/javascript">

	$(document).ready(function() {
		select_user();
	  	$("#menu").focus();
	});
	
	function select_user(){
		$.ajax({
			type: 'post',
			url: '/menu_user_select',
			contentType: "application/x-www-form-urlencoded;charset=UTF-8",
			dataType: "json",
			success: function(result){
				
				var select_html = "";
				
				for( var i = 0; i<result.list.length; i++ ){
					select_html += '<option value="' + result.list[i].auth + '">' + result.list[i].name + '</option>';
				}
				
				$("#admin_selectbox").append(select_html);
				
			},
			error: function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	
	function menu_add(){
		var menu = $("#menu").val();
		var move = $("#move").val();
		var admin_selectbox = $("#admin_selectbox").val();
		var menu_auth_selectbox = $("#menu_auth_selectbox").val();
		var hide_selectbox = $("#hide_selectbox").val();
		
		console.log(menu);
		console.log(move);
		console.log(admin_selectbox);
		console.log(menu_auth_selectbox);
		console.log(hide_selectbox);
		
		if( menu == "" ){
			alert("메뉴를 입력하세요.");
			$("#menu").focus()
		}else if( move == "" ){
			alert("경로를 입력하세요.");
			$("#move").focus()
		}else if( admin_selectbox == "" ){
			alert("관리자를 선택하세요.");
			$("#admin_selectbox").focus()
		}else if( menu_auth_selectbox == "" ){
			alert("접근 권한을 선택하세요.");
			$("#menu_auth_selectbox").focus()
		}else if( hide_selectbox == "" ){
			alert("공개 여부를 선택하세요.");
			$("#hide_selectbox").focus()
		}else{
			menu_check();
		}
		
	}
	
	function menu_check(){
		
		var menu = $("#menu").val();
		
		console.log(menu);
		
		$.ajax({
			type: 'post',
			url: '/menu_check?menu=' + menu,
			contentType: "application/x-www-form-urlencoded;charset=UTF-8",
			dataType: "json",
			success: function(result){
				if( result.data > 0 ){
					alert("메뉴가 중복됩니다.");
				}else{
					move_check();					
				}
			},
			error: function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	
	function move_check(){
		
		var move = $("#move").val();
		
		$.ajax({
			type: 'post',
			url: '/menu_move_check?move=' + move,
			contentType: "application/x-www-form-urlencoded;charset=UTF-8",
			dataType: "json",
			success: function(result){
				if( result.data > 0 ){
					alert("경로가 중복됩니다.");
				}else{
					go_insert_menu();					
				}
			},
			error: function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
		
	}
	
	function go_insert_menu(){
		var menuAdd_frm = $("#menuAdd_frm");
		menuAdd_frm.submit();
		
		/* var menu_serialize = $("#menuAdd_frm").serialize();
		
		$.ajax({
			type: 'get',
			url: '/menu_insert',
			contentType: "application/x-www-form-urlencoded;charset=UTF-8",
			dataType: "json",
			data : menu_serialize,
			success: function(result){
				
			},
			error: function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});	 */	
		
		
	}
	
	function back(){
		window.history.back();
	}

</script>

</html>
