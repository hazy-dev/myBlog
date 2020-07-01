<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <script type="text/javascript">
	$(document).ready(function() {

		<%
			String name;
			int auth ;
			int auth_group;
		
			if( session.getAttribute("name") != null || session.getAttribute("auth") != null  ){
				name = (String) session.getAttribute("name");
				auth = session.getAttribute("auth") != null ? Integer.parseInt(session.getAttribute("auth").toString()) : 2;
				auth_group = session.getAttribute("auth_group") != null ? Integer.parseInt(session.getAttribute("auth_group").toString()) : -1 ;
			
		%>

				create_navigation('<%=name%>','<%=auth%>','<%=auth_group%>');
		
		
		<% }else{ %>
		
			$.ajax({
				type: 'post',
				url: '/main_logout',
				contentType: "application/x-www-form-urlencoded;charset=UTF-8",
				dataType: "json",
				success: function(result){
				
					if(result.result == 1){
						alert('세션이 만료되서 로그아웃 되었습니다.');
						location.href = "/";
					}else{
						alert('알수없는 에러');	
					}
					
				},
				error: function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
				//create_navigation('',null,null);
		
		<% }%>
	});
	
	function create_navigation(name,auth,auth_group){
		
		$("#navbarResponsive ul li").remove();
		var menu_html = '<li class="nav-item"><a class="nav-link" href="/home">홈</a></li>';
		
		if( name != '' ){
			$.ajax({
				type: 'post',
				url: '/main_create_menu?name='+name +'&auth='+auth + '&auth_group=' + auth_group,
				contentType: "application/x-www-form-urlencoded;charset=UTF-8",
				dataType: "json",
				success: function(result){
				
					var menu = result.menu;
					
					for( var i = 0; i < menu.length; i++ ){
						menu_html += ' <li class="nav-item">';
						menu_html += '<a class="nav-link" href="'+ menu[i].move +'">'+ menu[i].menu +'</a></li>';
					}
					
					menu_html += '<li class="nav-item"><a class="nav-link">'+ name +' 님 </a></li>';
					menu_html += '<li class="nav-item"><button style="margin-top:7px" onclick="logout();" >로그아웃</button></li>';
					
					$("#navbarResponsive ul").append(menu_html);
					
				},
				error: function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}else{
			$("#navbarResponsive ul").append(menu_html);
		}
	}
	
	function logout(){
		
		if( confirm('로그아웃하시겠습니까?') ){
			$.ajax({
				type: 'post',
				url: '/main_logout',
				contentType: "application/x-www-form-urlencoded;charset=UTF-8",
				dataType: "json",
				success: function(result){
				
					if(result.result == 1){
						alert('로그아웃되었습니다.');
						location.href = "/";
					}else{
						alert('알수없는 에러');	
					}
					
				},
				error: function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}
		
	}
	
</script> --%>
<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand" href="/">나의 블로그</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto" style="float:right;">
            <li class="nav-item">
              <a class="nav-link" href="/home">홈</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>