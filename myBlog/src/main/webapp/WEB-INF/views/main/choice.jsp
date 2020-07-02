<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">

<jsp:include page="../include/head.jsp" flush="flase" />	

<body>

    <!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand" href="/">나의 블로그</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <!-- <ul class="navbar-nav ml-auto" style="float:right;">
            <li class="nav-item">
              <a class="nav-link" href="/home">홈</a>
            </li>
          </ul> -->
        </div>
      </div>
    </nav>	

    <!-- Page Header -->
    <header class="masthead" style="background-image: url('images/home-bg.jpg')">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <div class="site-heading">
              <h1>  </h1>
              <span class="subheading"> <!-- login? guest? --> </span>
            </div>
          </div>
        </div>
      </div>
    </header>

	<!-- Main Content -->
	<div class="container" style="height : 300px;">
      <div class="row" style="height : 100%;" >
        <div class="admin_loginform">
			<div class="admin_h3div">
				<h2>로그인</h2>
			</div>
			<br />
			<form class="form-horizontal" id="login_frm" >
				<div>
					<div class="admin_div">
					  <div class="admin_inputid">
					    <input id="admin_id" name="id" type="text" class="form-control"  placeholder="id" onkeydown="on_enter(event)" >
					  </div>
					</div>
					<div class="admin_div">
					  <div class="admin_iputpassword">
					    <input id="admin_pwd" name="pw" type="password" class="form-control"  placeholder="Password" onkeydown="on_enter(event)" >
					  </div>
					</div>
					<div class="admin_div">
					  <div class="admin_btn">
					    <button type="button" onclick="blog_login()" class="btn btn-default">Sign in</button>
					  </div>
					  <!-- <div class="admin_btn">
					    <button type="button" onclick="guest()" class="btn btn-default">Guest</button>
					  </div> -->
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
	  	
	  	
	  	var filter = "win16|win32|win64|mac|macintel"; 
	  	if ( navigator.platform ) {
	  		if ( filter.indexOf( navigator.platform.toLowerCase() ) < 0 ) { 
	  			
	  			//mobile 
	  			
	  			} else {
	  				
  				//pc
  				
  				} 
	  		}

	  	
	});
	
	function on_enter(event){
		if( event.keyCode == 13 ){
			blog_login();
		}
	}
	
	function blog_login(){
		var id = $("#admin_id").val();
		var pwd = $("#admin_pwd").val();

		// 숫자 + 대소문자 정규식
		var idType = /^[a-zA-Z0-9]+$/;

		console.log(id);
		console.log(pwd);
		
		if( id == "" ){
			alert("아이디를 입력하세요.");
			$("#admin_id").focus()
		}else if( !idType.test(id) ){
			alert("아이디는 숫자와 대소문자만 가능합니다.");
			$("#admin_id").focus()
		}else{
			if( pwd == "" ){
				alert("비밀번호를 입력하세요");
				$("#admin_pwd").focus();
			}else if( !idType.test(pwd) ){
				alert("비밀번호는 숫자와 대소문자만 가능합니다.");
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
					location.href= "/home"
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
		$.ajax({
			type: 'post',
			url: '/admin_guest_login',
			contentType: "application/x-www-form-urlencoded;charset=UTF-8",
			dataType: "json",
			success: function(result){

				var login_result = result.data;
				
				if( login_result == 1 ){
					location.href= "/home"
				}else{
					alert("너님은 게스트로 들어올 수 없음.");
					location.href= "/admin"
				}
				
			},
			error: function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}

</script>

</html>
