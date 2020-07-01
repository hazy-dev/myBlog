<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">

<jsp:include page="./include/head.jsp" flush="flase" />	

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
              <h1> Choice </h1>
              <span class="subheading"> <!-- login? guest? --> </span>
            </div>
          </div>
        </div>
      </div>
    </header>

	<!-- Main Content -->
	<div class="container" style="height : 600px;">
      <div class="row" style="height : 55%;" >
        <div class="admin_loginform">
			<!-- <div class="admin_h3div">
				<h2>로그인</h2>
			</div>
			<br /> -->
			<form class="form-horizontal" id="login_frm" >
				<div>
					<!-- <div class="admin_div">
					  <div class="admin_inputid">
					    <input id="admin_id" name="id" type="text" class="form-control"  placeholder="id" onkeydown="on_enter(event)" >
					  </div>
					</div>
					<div class="admin_div">
					  <div class="admin_iputpassword">
					    <input id="admin_pwd" name="pw" type="password" class="form-control"  placeholder="Password" onkeydown="on_enter(event)" >
					  </div>
					</div> -->
					<div class="admin_div">
					  <div class="admin_btn">
					    <button type="button" onclick="goRecipe()" class="btn btn-default">Recipe</button>
					  </div>
					  <div class="admin_btn">
					    <button type="button" onclick="goBlog()" class="btn btn-default">Blog</button>
					  </div>
				   </div>
				</div>
			</form>
        </div>
      </div>
    </div>

    <hr>

    <!-- Footer -->
    <jsp:include page="./include/footer.jsp" flush="flase" />	
            
 </body>
 
<script type="text/javascript">

	function goRecipe(){
		
		location.href = "/goRecipe";
		
	}
	
	function goBlog(){

		location.href = "/goBlog";
		
	}
	

</script>

</html>
