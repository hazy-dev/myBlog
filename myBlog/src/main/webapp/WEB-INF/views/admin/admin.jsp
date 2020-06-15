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
        <div class="admin_loginform">
			<div class="admin_h3div">
				<h2>관리자 로그인</h2>
			</div>
			<br />
			<form class="form-horizontal" id="login_frm" >
				<div>
					<div class="admin_div">
					  <div class="admin_inputid">
					    <input id="admin_id" name="id" type="text" class="form-control"  placeholder="id" onkeydown="on_enter(event)" value="${param.id }">
					  </div>
					</div>
					<div class="admin_div">
					  <div class="admin_iputpassword">
					    <input id="admin_pwd" name="pw" type="password" class="form-control"  placeholder="Password" onkeydown="on_enter(event)" value="${param.pw }" >
					  </div>
					</div>
					<div class="admin_div">
					  <div class="admin_btn">
					    <button type="button" onclick="login()" class="btn btn-default">Sign in</button>
					  </div>
					  <div class="admin_btn">
					    <button type="button" onclick="guest()" class="btn btn-default">Guest</button>
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
	  	$("#admin_id").focus()
	});
	
	function on_enter(event){
		if( event.keyCode == 13 ){
			login();
		}
	}
	
	function login(){
		var id = $("#admin_id").val();
		var pwd = $("#admin_pwd").val();
		console.log(id);
		console.log(pwd);
		if( id == "" ){
			alert("아이디를 입력하세요.");
			$("#admin_id").focus()
		}else{
			if( pwd == "" ){
				alert("비밀번호를 입력하세요");
				$("#admin_pwd").focus();
			}else{
				go_login();
			}
		}
		
	}
	
	function go_login(){
		var string = $("#login_frm").serialize();
		console.log(string);
		$.ajax({
			type: 'post',
			url: '/admin_login',
			contentType: "application/x-www-form-urlencoded;charset=UTF-8",
			data: string,
			dataType: "json",
			success: function(result){

				var login_result = result.data;
				
				if( login_result == 1 ){
					location.href= "/go_adminlist"
				}else{
					alert("아이디 또는 비밀번호가 틀립니다.");
					location.href= "/admin"
				}
				
			},
			error: function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	
	function guest(){
		alert("guest");
	}

</script>

</html>
