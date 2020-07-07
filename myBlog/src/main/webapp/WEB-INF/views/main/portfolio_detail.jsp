<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">

<jsp:include page="../include/head.jsp" flush="flase" />	
<%

	//String content = "../../html/" + request.getParameter("item");	

%>
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
              <h1></h1>
              <h2 class="subheading"></h2>
            </div>
          </div>
        </div>
      </div>
    </header>

    <!-- Post Content -->
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
			<!--  -->
			<jsp:include page="/WEB-INF/views/html/${item}" flush="flase" />
	
		</div>
      </div>
    </div>

    <hr>

    <!-- Footer -->
    <jsp:include page="../include/footer.jsp" flush="flase" />
		
</body>

<script type="text/javascript">

	$(document).ready(function() {
		
	});

</script>

</html>