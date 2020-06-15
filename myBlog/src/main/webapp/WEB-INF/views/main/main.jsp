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
             <h1>MAIN</h1>
             <!-- <span class="subheading">wellcom.</span> -->
           </div>
         </div>
       </div>
     </div>
   </header>

   <!-- Main Content -->
   <div class="container">
     <div class="row">
     	<div class="main_height">
	       	<div class="main_side_width">
				<div id="calendar" ></div>
				<hr/>
		       	<div id="counter">
			       	<dl>
			       		<dt>Total</dt>
			       		<dd class="total" id="counter_total"></dd>
			       		<dt class="today">Today</dt>
			       		<dd id="counter_today"></dd>
			       		<dt class="yesterday">Yesterday</dt>
			       		<dd id="counter_yesterday"></dd>
			       	</dl>
		       	</div>
	       	<!-- 시계 / 총 방문자 수 / 오늘 방문자 수 -->
	       	</div>
	       	<div class="main_center_width">
	       		<div class="main_center_width_inner" id="main_board_list">
	       		
	       		</div>
	       	</div>
	       	<div class="main_side_width">
	       		<canvas id="canvas" width="285" height="285" style="background-color:#333"></canvas>
	       		<div id="textTime" class="main_text_timer" ></div>
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
		
		var date = new Date().toISOString().slice(0,10);
		startCalendar("calendar",date);
		var callFunction = get_timer(); 
		getList('');
		var Getip = ip();
		counter(Getip);
		
	});
	
	var canvas = document.getElementById("canvas");
	var ctx = canvas.getContext("2d");
	var radius = canvas.height / 2;
	ctx.translate(radius, radius);
	radius = radius * 0.90
	drawClock();

	function drawClock() {
	  drawFace(ctx, radius);
	  drawNumbers(ctx, radius);
	  drawTime(ctx, radius);
	}
	
	var continu_time = function(){
		drawFace(ctx, radius);
		drawNumbers(ctx, radius);
		drawTime(ctx, radius);
	}
	
	setInterval(continu_time, 1000);

	function drawFace(ctx, radius) {
	  var grad;
	  ctx.beginPath();
	  ctx.arc(0, 0, radius, 0, 2*Math.PI);
	  ctx.fillStyle = 'white';
	  ctx.fill();
	  grad = ctx.createRadialGradient(0,0,radius*0.95, 0,0,radius*1.05);
	  grad.addColorStop(0, '#333');
	  grad.addColorStop(0.5, 'white');
	  grad.addColorStop(1, '#333');
	  ctx.strokeStyle = grad;
	  ctx.lineWidth = radius*0.1;
	  ctx.stroke();
	  ctx.beginPath();
	  ctx.arc(0, 0, radius*0.1, 0, 2*Math.PI);
	  ctx.fillStyle = '#333';
	  ctx.fill();
	}

	function drawNumbers(ctx, radius) {
	  var ang;
	  var num;
	  ctx.font = radius*0.15 + "px arial";
	  ctx.textBaseline="middle";
	  ctx.textAlign="center";
	  for(num = 1; num < 13; num++){
	    ang = num * Math.PI / 6;
	    ctx.rotate(ang);
	    ctx.translate(0, -radius*0.85);
	    ctx.rotate(-ang);
	    ctx.fillText(num.toString(), 0, 0);
	    ctx.rotate(ang);
	    ctx.translate(0, radius*0.85);
	    ctx.rotate(-ang);
	  }
	}
	
	function drawTime(ctx, radius){
	  var now = new Date();
	  var hour = now.getHours();
	  var minute = now.getMinutes();
	  var second = now.getSeconds();
	  //hour
	  hour = hour%12;
	  hour = (hour*Math.PI/6)+(minute*Math.PI/(6*60))+(second*Math.PI/(360*60));
	  drawHand(ctx, hour, radius*0.5, radius*0.07);
	  //minute
	  minute = (minute*Math.PI/30)+(second*Math.PI/(30*60));
	  drawHand(ctx, minute, radius*0.8, radius*0.07);
	  //second
	  second = (second*Math.PI/30);
	  drawHand(ctx, second, radius*0.9, radius*0.02);
	}

	function drawHand(ctx, pos, length, width) {
	  ctx.beginPath();
	  ctx.lineWidth = width;
	  ctx.lineCap = "round";
	  ctx.moveTo(0,0);
	  ctx.rotate(pos);
	  ctx.lineTo(0, -length);
	  ctx.stroke();
	  ctx.rotate(-pos);
	}
	
	function startCalendar(id,Cdate){
		
		$.ajax({
			type: 'post',
			url: '/main_calendar_date?date=' + Cdate,
			contentType: "application/x-www-form-urlencoded;charset=UTF-8",
			dataType: "json",
			success: function(result){

				var date = result.date;
				var result = result.result;
				
				kCalendar("calendar", date , result);
				
			},
			error: function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});		
		
		
	}
	
	function kCalendar(id, date, result) {
		var kCalendar = document.getElementById(id);
		console.log(date);
		if( typeof( date ) !== 'undefined' ) {
			date = date.split('-');
			date[1] = date[1] - 1;
			date = new Date(date[0], date[1], date[2]);
		} else {
			var date = new Date();
		}
		
		var currentYear = date.getFullYear();
		//년도를 구함

		var currentMonth = date.getMonth() + 1;
		//연을 구함. 월은 0부터 시작하므로 +1, 12월은 11을 출력

		var currentDate = date.getDate();
		//오늘 일자.

		date.setDate(1);
		
		var currentDay = date.getDay();
		//이번달 1일의 요일은 출력. 0은 일요일 6은 토요일

		var dateString = new Array('sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat');
		var lastDate = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
		
		if( (currentYear % 4 === 0 && currentYear % 100 !== 0) || currentYear % 400 === 0 ){
			lastDate[1] = 29;
			//각 달의 마지막 일을 계산, 윤년의 경우 년도가 4의 배수이고 100의 배수가 아닐 때 혹은 400의 배수일 때 2월달이 29일 임.
		}

		var currentLastDate = lastDate[currentMonth-1];
		var week = Math.ceil( ( currentDay + currentLastDate ) / 7 );
		//총 몇 주인지 구함.

		if(currentMonth != 1){
			var prevDate = currentYear + '-' + ( currentMonth - 1 ) + '-' + currentDate;
		}else{
			var prevDate = ( currentYear - 1 ) + '-' + 12 + '-' + currentDate;
			//만약 이번달이 1월이라면 1년 전 12월로 출력.
		}

		if(currentMonth != 12){ 
			var nextDate = currentYear + '-' + ( currentMonth + 1 ) + '-' + currentDate;
		}else{
			var nextDate = ( currentYear + 1 ) + '-' + 1 + '-' + currentDate;
			//만약 이번달이 12월이라면 1년 후 1월로 출력.
		}

		if( currentMonth < 10 ){

			var currentMonth = '0' + currentMonth;
			//10월 이하라면 앞에 0을 붙여준다.
		}

		var calendar = '';
		calendar += '<div id="header">';
		calendar += '			<span><a href="#" class="button left" onclick="startCalendar(\'' +  id + '\', \'' + prevDate + '\')"><</a></span>';
		calendar += '			<span id="date">' + currentYear + '년 ' + currentMonth + '월</span>';
		calendar += '			<span><a href="#" class="button right" onclick="startCalendar(\'' + id + '\', \'' + nextDate + '\')">></a></span>';
		calendar += '		</div>';
		calendar += '		<table border="0" cellspacing="0" cellpadding="0">';
		calendar += '			<caption>' + currentYear + '년 ' + currentMonth + '월 달력</caption>';
		calendar += '			<thead>';
		calendar += '				<tr>';
		calendar += '					<th class="sun" scope="row">일</th>';
		calendar += '					<th class="mon" scope="row">월</th>';
		calendar += '					<th class="tue" scope="row">화</th>';
		calendar += '					<th class="wed" scope="row">수</th>';
		calendar += '					<th class="thu" scope="row">목</th>';
		calendar += '					<th class="fri" scope="row">금</th>';
		calendar += '					<th class="sat" scope="row">토</th>';
		calendar += '				</tr>';
		calendar += '			</thead>';
		calendar += '			<tbody>';

		var dateNum = 1 - currentDay;
		

		for(var i = 0; i < week; i++) {
			calendar += '			<tr>';
			for(var j = 0; j < 7; j++, dateNum++) {
				if( dateNum < 1 || dateNum > currentLastDate ) {
					calendar += '				<td class="' + dateString[j] + '"> </td>';
					continue;
				}
				var flag = false;
				for( var k = 0; k<result.length; k++ ){
					var string = result[k].insDate;
					var array = string.split("-");
					if( array[0] == currentYear && array[1] == currentMonth && array[2] == dateNum && flag == false ){
						calendar += '				<td class="item"><a onclick="getList(\'' + string + '\')">' + dateNum + '</a></td>';
						flag = true;
					}
				}
				if( !flag ){
					calendar += '				<td class="' + dateString[j] + '">' + dateNum + '</td>';
				}
			}
			calendar += '			</tr>';
		}
		calendar += '			</tbody>';
		calendar += '		</table>';

		kCalendar.innerHTML = calendar;

	}
	
	function timer(){ 

		 var date = new Date(); 

		 // 그 지역의 날짜 (locale date). 
		 var dateString = date .toLocaleDateString(); 

		 // 그 지역의 시간 (locale time). 
		 var timeString = date .toLocaleTimeString(); 

		 var text = dateString + "<br />" + timeString; 

		 // 'text'만 저장하고, 이 함수 끝내기. 
		 return text; 
	} 


	function get_timer(){ 

		 // 함수값 불러와서, 태그 안에 집어넣기. 
		 document.getElementById( "textTime" ).innerHTML = timer(); 

		 // 1000 밀리초(=1초) 후에, 이 함수를 실행하기 (반복 실행 효과). 
		 setTimeout( "get_timer()", 1000 ); 
	}
	
	function getList( Cdate ){
		$.ajax({
			type: 'post',
			url: '/main_board_list?date=' + Cdate,
			contentType: "application/x-www-form-urlencoded;charset=UTF-8",
			dataType: "json",
			success: function(result){

				console.log(result);
				
				var table_html = "";
				var board = document.getElementById("main_board_list");
				
				for( var i= 0 ; i<result.list.length; i++ ){
					if( result.list[i].category == 1 ){
						table_html += '<div class="main_list_div"><a onclick="portfolio_detail(' + "'"+ result.list[i].filename +"'" + ')"><h4 class="main_list_title">' + result.list[i].subject + '</h4>';
					}else{
						table_html += '<div class="main_list_div"><a onclick="post_detail(' + "'"+ result.list[i].filename +"'" + ')"><h4 class="main_list_title">' + result.list[i].subject + '</h4>';
					}
					
					table_html += '<h4 class="main_list_memo">' + result.list[i].memo +  '</h4></a>';
					table_html += '<p class="main_list_date">' + result.list[i].uploadDate + '</p></div><hr>';
				}
				
				if( result.list.length == 0 ){
					table_html += '<div class="main_list_div"><a><h3 class="main_list_title">포스트가 준비되지 않았습니다.</h3>';
					table_html += '<h3 class="main_list_memo">준바되면 업로드 하겠습니다.</h3></a>';
					table_html += '<p class="main_list_date">1999.99.99</p></div><hr>';
				}
				
				board.innerHTML = table_html;
				
			},
			error: function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});		
	}	
	
	function post_detail(item){
		location.href="/post_detail?item=" + item;
	}
	
	function portfolio_detail(item){
		location.href="/portfolio_detail?item=" + item;
	}
	
	function counter(ip){
		// 게스트는 아이피와 접속날짜 비교 , 관리자는 아이디와 접속날짜 비교
		// 로그인 버튼 클릭시 아이피와 아이디로 해당 날짜에 접속한 이력이 있는지 확인
		// 없으면 로그찍고 방문자수를 증가시키고 있으면 증가안함.
		// 방문자수는 일별로 카운팅. 첫번째 방문자면 해당날짜가 있는지 검색하고 없으면 insert 있으면 update
		// 캐쉬를 사용하는 방법에 대하여 알아보자
		
		$.ajax({
			type: 'post',
			url: '/main_add_counter?ip=' + ip,
			contentType: "application/x-www-form-urlencoded;charset=UTF-8",
			dataType: "json",
			success: function(result){
				
				$("#counter_total").html(result.data[0].counter);
				$("#counter_yesterday").html(result.data[1].counter);
				$("#counter_today").html(result.data[2].counter);
				
			},
			error: function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});		
		
	}
		
</script>

</html>
