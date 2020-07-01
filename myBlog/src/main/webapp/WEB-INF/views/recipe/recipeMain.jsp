<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">

 <jsp:include page="../include/head.jsp" flush="flase" />	

<body>

   <!-- Navigation -->
   <%-- <jsp:include page="../include/navigation.jsp" flush="flase" />	 --%>
	<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand" href="/">레시피 ??</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        	<i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto" style="float:right;">
          	<li class="nav-item">
              <a class="nav-link" href="/home">메뉴1</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/home">메뉴2</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/home">메뉴3</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/home">메뉴4</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/home">메뉴5</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/home">메뉴6</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
   <!-- Page Header -->
   <header class="masthead" style="background-image: url('images/about-bg.jpg')">
     <div class="overlay"></div>
     <div class="container">
       <div class="row">
         <div class="col-lg-8 col-md-10 mx-auto">
           <div class="page-heading">
             <h1></h1>
             <!-- <span class="subheading">wellcom.</span> -->
           </div>
         </div>
       </div>
     </div>
   </header>

   <!-- Main Content -->
   <div class="container">
     
     <div style="
	    height:  240px;
	    margin-bottom: 40px;
	">
     	<div style="float:left;"><h1>타이틀</h1></div>
     	<div style="float:right;">
     		<a href="#" class="media_area" target="_blank"
     		style="    font-size: 12px;
					    line-height: 20px;
					    display: inline-block;
					    width: 285px;
					    vertical-align: top;
					    text-decoration: none;	
					    margin: 5px 8px 5px 8px;"
     		>
				<div class="media_thumb" style="position: relative;
				    display: block;
				    overflow: hidden;">
					<img src="../../images/test.png" width="285" height="190" >
				</div>
				<div class="media_info" style="display: block;
    					padding-top: 12px;">
					<div class="info_box" style="overflow: hidden;">
						<strong class="title">내용입니다.</strong>
					</div>
				</div>
			</a>
     		<a href="#" class="media_area" target="_blank"
     		style="    font-size: 12px;
					    line-height: 20px;
					    display: inline-block;
					    width: 285px;
					    vertical-align: top;
					    text-decoration: none;
					     margin: 5px 8px 5px 8px;"
     		>
				<div class="media_thumb" style="position: relative;
				    display: block;
				    overflow: hidden;">
					<img src="../../images/test.png" width="285" height="190">
				</div>
				<div class="media_info" style="display: block;
    					padding-top: 12px;">
					<div class="info_box" style="overflow: hidden;">
						<strong class="title">내용입니다.</strong>
					</div>
				</div>
			</a>
			<a href="#" class="media_area" target="_blank"
     		style="    font-size: 12px;
					    line-height: 20px;
					    display: inline-block;
					    width: 285px;
					    vertical-align: top;
					    text-decoration: none;
					    margin: 5px 8px 5px 8px;"
     		>
				<div class="media_thumb" style="position: relative;
				    display: block;
				    overflow: hidden;">
					<img src="../../images/test.png" width="285" height="190" >
				</div>
				<div class="media_info" style="display: block; padding-top: 12px;">
					<div class="info_box" style="overflow: hidden;">
						<strong class="title">내용입니다.</strong>
					</div>
				</div>
			</a>
     	</div>
     </div>
     <div style="height:800px; margin-bottom:40px;">
     	<div style="
		    width: 800px;
		    margin: auto;
		">
     		<div style="width:  400px;height: 400px;float: left;background-color: red;"></div>
     		<div style="width:  400px;height: 400px;float: left;background-color: palegoldenrod;"></div>
     	</div>
     	<div style="
		    width: 800px;
		    margin: auto;
		">
     		<div style="width:  400px;height: 400px;background-color: aqua;float: left;"></div>
     		<div style="width:  400px;height: 400px;background-color: bisque;float: left;"></div>
     	</div>
     </div>
     <div style="margin-bottom : 80px;">
		<div style="border-top: 1px inset red; text-align: center;border-bottom: 1px inset red; margin-bottom : 20px;">
			<h1> 텍스트 </h1>
		</div>
		<div>
			<a href="#" class="media_area" target="_blank"
     		style="    font-size: 12px;
					    line-height: 20px;
					    display: inline-block;
					    width: 258px;
					    vertical-align: top;
					    text-decoration: none;
					    margin: 5px 8px 5px 8px;"	
     		>
				<div class="media_thumb" style="position: relative;
				    display: block;
				    overflow: hidden;">
					<img src="../../images/test.png"width="258" height="300" >
				</div>
				<div class="media_info" style="display: block; padding-top: 12px;">
					<div class="info_box" style="overflow: hidden;">
						<strong class="title" style=" font-size: 18px; ">타이블</strong>
					</div>
					<div class="info_box" style="overflow: hidden;">
						<strong class="title">내용</strong>
					</div>
					<div class="info_box" style="overflow: hidden;">
						<strong class="title" style="font-size: 9px;">더보기 ></strong>
					</div>
				</div>
			</a>
			<a href="#" class="media_area" target="_blank"
     		style="    font-size: 12px;
					    line-height: 20px;
					    display: inline-block;
					    width: 258px;
					    vertical-align: top;
					    text-decoration: none;
					    margin: 5px 8px 5px 8px;"
     		>
				<div class="media_thumb" style="position: relative;
				    display: block;
				    overflow: hidden;">
					<img src="../../images/test.png"width="258" height="300" >
				</div>
				<div class="media_info" style="display: block; padding-top: 12px;">
					<div class="info_box" style="overflow: hidden;">
						<strong class="title" style=" font-size: 18px; ">타이블</strong>
					</div>
					<div class="info_box" style="overflow: hidden;">
						<strong class="title">내용</strong>
					</div>
					<div class="info_box" style="overflow: hidden;">
						<strong class="title" style="font-size: 9px;">더보기 ></strong>
					</div>
				</div>
			</a>
			<a href="#" class="media_area" target="_blank"
     		style="    font-size: 12px;
					    line-height: 20px;
					    display: inline-block;
					    width: 258px;
					    vertical-align: top;
					    text-decoration: none;
					    margin: 5px 8px 5px 8px;"
     		>
				<div class="media_thumb" style="position: relative;
				    display: block;
				    overflow: hidden;">
					<img src="../../images/test.png"width="258" height="300" >
				</div>
				<div class="media_info" style="display: block; padding-top: 12px;">
					<div class="info_box" style="overflow: hidden;">
						<strong class="title" style=" font-size: 18px; ">타이블</strong>
					</div>
					<div class="info_box" style="overflow: hidden;">
						<strong class="title">내용</strong>
					</div>
					<div class="info_box" style="overflow: hidden;">
						<strong class="title" style="font-size: 9px;">더보기 ></strong>
					</div>
				</div>
			</a>
			<a href="#" class="media_area" target="_blank"
     		style="    font-size: 12px;
					    line-height: 20px;
					    display: inline-block;
					    width: 258px;
					    vertical-align: top;
					    text-decoration: none;
					    margin: 5px 8px 5px 8px;"
     		>
				<div class="media_thumb" style="position: relative;
				    display: block;
				    overflow: hidden;">
					<img src="../../images/test.png"width="258" height="300" >
				</div>
				<div class="media_info" style="display: block; padding-top: 12px;">
					<div class="info_box" style="overflow: hidden;">
						<strong class="title" style=" font-size: 18px; ">타이블</strong>
					</div>
					<div class="info_box" style="overflow: hidden;">
						<strong class="title">내용</strong>
					</div>
					<div class="info_box" style="overflow: hidden;">
						<strong class="title" style="font-size: 9px;">더보기 ></strong>
					</div>
				</div>
			</a>
		</div>
     </div>
     <div style="border : 1px dashed #bcbcbc;">
     	<div style="float:left; width : 25%; margin-top:40px; ">
     		<div>
     			<h1>공지사항</h1>
     			<ul>
     				<li>리스트</li>
     				<li>리스트</li>
     				<li>리스트</li>
     			</ul>
     		</div>
     		<div>
     			<h1>최근 포스트</h1>
     			<ul>
     				<li>리스트</li>
     				<li>리스트</li>
     				<li>리스트</li>
     			</ul>
     		</div>
     	</div>
     	<div style="float:left;  width : 50%; margin-top:40px; ">
     		<h1>태그</h1>
     		<p><a>#aaa</a><a>#aaa</a><a>#aaa</a><a>#aaa</a><a>#aaa</a></p>
     	</div>
     	<div style="float:left;  width : 25%; margin-top:40px; ">
     		<div>
     			<h1>검색</h1>
     			<input type="text" />
     		</div>
     		<div>
     			<h1>전체 방문자</h1>
     			<strong>1111</strong>
     			<div>오늘 : 44</div>
     			<div>어제 : 33</div>
     		</div>
     	</div>
     </div>
     
   </div>

   <hr>

   <!-- Footer -->
   <jsp:include page="../include/footer.jsp" flush="flase" />

</body>
  
<script type="text/javascript">



</script>

</html>
