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
				<h2>파일 업로드</h2>
			</div>
			<br />
			<form class="form-horizontal" id="upload_frm" enctype="multipart/form-data" method="post" action="/admin_start_upload"  >
				<div>
					<div class="admin_div">
					  <div class="admin_inputid">
					    <input id="subject" name="subject" type="text" class="form-control" placeholder="subject" >
					  </div>
					</div>
					<div class="admin_div">
					  <div class="admin_iputpassword">
					    <select class="form-control" id="upload_selectbox" name="upload_selectbox">
						    <option value="">category</option>
							<option value="1">포트폴리오</option>
							<option value="2">포스트</option>
						</select>
					  </div>
					</div>
					<div class="admin_div">
					  <div class="admin_iputpassword">
					    <select class="form-control" id="auth_selectbox" name="auth_selectbox">
						    <option value="">공개여부</option>
							<option value="1">비공개</option>
							<option value="2">공개</option>
						</select>
					  </div>
					</div>
					<div class="admin_div">
					  <div class="admin_inputid">
					    <textarea class="form-control" placeholder="memo" rows="5" id="upload_textarea" name="upload_textarea"></textarea>
					  </div>
					</div>
					<div class="admin_div">
						<input type="file" id="uploadfile" name="uploadfile">
					</div>
					<div class="admin_div" style="margin-top : 20px;">
					  <div class="admin_btn">
					    <button type="button" onclick="file_upload()" class="btn btn-default">Sign in</button>
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
	  	$("#subject").focus()
	});
	
	function file_upload(){
		var subject = $("#subject").val();
		var upload_selectbox = $("#upload_selectbox").val();
		var upload_textarea = $("#upload_textarea").val();
		var uploadfile = $("#uploadfile").val();
		
		console.log(subject);
		console.log(upload_selectbox);
		console.log(upload_textarea);
		console.log(uploadfile);
		
		if( subject == "" ){
			alert("제목을 입력하세요.");
			$("#subject").focus()
		}else if( upload_selectbox == "" ){
			alert("키테고리를 선택하세요.");
			$("#upload_selectbox").focus()
		}else if( upload_textarea == "" ){
			alert("메모를 입력하세요.");
			$("#upload_textarea").focus()
		}else if( uploadfile == "" ){
			alert("파일를 선택하세요.");
			$("#uploadfile").focus()
		}else{
			go_upload();
		}
		
	}
	
	function go_upload(){
		var upload_form = $("#upload_frm");
		upload_form.submit();
		
		
		/* console.log(string);
		$.ajax({
			type: 'post',
			url: '/start_upload',
			contentType: "application/x-www-form-urlencoded;charset=UTF-8",
			data: string,
			dataType: "json",
			success: function(result){
				
			},
			error: function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		}); */
	}
	
	function back(){
		window.history.back();
	}

</script>

</html>
