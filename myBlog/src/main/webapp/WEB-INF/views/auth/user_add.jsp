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
              <h1> USER ADD </h1>
              <span class="subheading"> user add... </span>
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
				<h2>유저 추가</h2>
			</div>
			<br />
			<form class="form-horizontal" id="userAdd_frm" method="post" action="/auth_user_insert" >
				<div>
					<div class="admin_div">
					  <div class="admin_inputid">
					    <input id="user_id" name="user_id" type="text" class="form-control" placeholder="id ( 아이디 )" >
					  </div>
					</div>
					<div class="admin_div">
					  <div class="admin_inputid">
					    <input id="user_password" name="user_password" type="password" class="form-control" placeholder="password ( 패스워드 )" >
					  </div>
					</div>
					<div class="admin_div">
					  <div class="admin_inputid">
					    <input id="user_password_ok" name="user_password_ok" type="password" class="form-control" placeholder="password ( 패스워드 확인 )" >
					  </div>
					</div>
					<div class="admin_div">
					  <div class="admin_inputid">
					    <input id="nickname" name="nickname" type="text" class="form-control" placeholder="nickname ( 닉네임 )" >
					  </div>
					</div>
					<div class="admin_div">
					  <div class="admin_iputpassword">
					    <select class="form-control" id="user_auth_selectbox" name="user_auth_selectbox">
						    <option value="">접근 권한</option>
							<option value="0">최고 관리자</option>
							<option value="1">관리자</option>
							<option value="2">게스트</option>
						</select>
					  </div>
					</div>
					<div class="admin_div" style="margin-top : 20px;">
					  <div class="admin_btn">
					    <button type="button" onclick="user_add()" class="btn btn-default">Sign in</button>
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
	  	$("#user_id").focus();
	});
	
	function user_add(){
		var user_id = $("#user_id").val();
		var user_password = $("#user_password").val();
		var user_password_ok = $("#user_password_ok").val();
		var nickname = $("#nickname").val();
		var user_auth_selectbox = $("#user_auth_selectbox").val();

		
		// 숫자 + 대소문자 정규식
		var idType = /^[a-zA-Z0-9]+$/;
		
		if( user_id == "" ){
			alert("아이디를 입력하세요.");
			$("#user_id").focus()
		}else if( !idType.test(user_id) ){
			alert("아이디는 숫자와 대소문자만 가능합니다.");
			$("#user_password").focus()
		}else if( user_password == "" ){
			alert("패스워드를 입력하세요.");
			$("#user_password").focus()
		}else if( !idType.test(user_password) ){
			alert("비밀번호는 숫자와 대소문자만 가능합니다.");
			$("#user_password").focus()
		}else if( user_password_ok == "" ){
			alert("패스워드를 한번 더 입력하세요.");
			$("#user_password_ok").focus()
		}else if( user_password != user_password_ok ){
			alert("패스워드가 서로 다릅니다.");
			$("#user_password_ok").focus()
		}else if( nickname == "" ){
			alert("닉네임을 입력하세요.");
			$("#nickname").focus()
		}else if( user_auth_selectbox == "" ){
			alert("접근 권한를 선택하세요.");
			$("#menu_auth_selectbox").focus()
		}else{
			user_check();
		}
	}
	
	function user_check(){
		
		var user = $("#user_id").val();
		
		$.ajax({
			type: 'post',
			url: '/auth_user_check?user=' + user,
			contentType: "application/x-www-form-urlencoded;charset=UTF-8",
			dataType: "json",
			success: function(result){
				if( result.data > 0 ){
					alert("ID가 중복됩니다.");
				}else{
					go_insert_user();					
				}
			},
			error: function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	
	function go_insert_user(){
		var userAdd_frm = $("#userAdd_frm");
		userAdd_frm.submit();
		
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
