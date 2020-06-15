<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 주제 -->
<div class="detail_subject">
	<span class="glyphicon glyphicon-tags" aria-hidden="true"></span>
	<h2>VIAS 차량 관제 시스템 개발 </h2>
</div>
<br /><br />
 
<!-- 부주제 -->
<div class="detail_sub_subject">
	<span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span>
	<h4> 1. 개발 환경 </h4>
</div>
 
<!-- 내용 -->
<div class="detail_div">
	<div style="width : 100%;">
		<div style="width : 25%; float : left;">
			1) 개발 언어 및 환경 : 
		</div>
		<div style="width : 75%; float : left;">
			< JDK 1.7 > , < Tomcat 7 > , < Linux > , < Oracla > , < java > , < jsp > 
			< jquery >, < javascript > , < ajax > , < mybatis >
		</div>	
	</div>
	<div style="width : 100%;">
		<div style="width : 15%; float : left;">
			2) 개발 툴 :
		</div>
		<div style="width : 85%; float : left;">
			< eclipse > , < SQLGate > , < svn >
		</div>
	</div>
	 
	<div style="width : 100%;">
		<div style="width : 15%; float : left;">
			3) API :
		</div>
		<div style="width : 85%; float : left;">
			< Google Chart > , < Naver Map >  
		</div>
	</div>
	<div>
	4) VIAS 관제센터 구축 및 분석/통계 추출 모듈 개발<br />
	- VIAS 운영 및 상태 모니터링 <br />
	- BIC DATA 기반 분석/통계 추출 모듈 개발 <br />
	- VIAS 관제 센터 구축 <br />
	<!-- 4) 이유는 모르지만 개발은 요청 받은대로 모델1 방식으로 진행함. 기획과 설계는 대부분 되어있는 상태였고 개발은 대부분 혼자 진행하였음.
	개발기간은 2개월정도 소요되었지만 실제 개발시간보다 데이터 정합성 확인과 기획변경으로 인한 개발내용 변경에 시간이 많이 소요됨. --> <br />
	
	</div>
</div>

<!-- 부주제 -->
<div class="detail_sub_subject">
	<span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span>
	<h4> 2. 개발 내용</h4>
</div>
 
<!-- 내용 -->
<div class="detail_div">

	1) 프로젝트 구성
	<img class="detail_img" src="../images/vias_composition.png" />
	전체 프로젝트 구성을 간략히 나타냄.
	
	<br /><hr />
	
	2) 메인화면
	<img class="detail_img" src="../images/vias_login.png" />
	기본적인 로그인 기능.
	<img class="detail_img" src="../images/vias_main.png" />
	차량 유형별 주행거리를 pie차트로 보여주며, 차량 유형별 운행대수를 표기함. <br />
	차종별 평균연비와 전체 주행거리를 포기함.
	
	<br /><hr />
	
	3) 관제현황
	<img class="detail_img" src="../images/vias_location1.png" />
	조건에 맞는 차량의 단말ID를 검색할 수 있으며, 단말ID를 선택하여 차량의 가장 최근 위치를 지도에서 확인 할 수 있음. 검색된 차량의 마커를 클릭하여 
	주행정보( 차량유형,차량번호,차종,코드 등.. )를 확인 가능함. 또한, 해당 날짜의 트립정보를 리스트 형태로 확인 할 수 있음. <br />
	차량유형과 차종, 날짜(일별)로 검색 할 수 있음.
	<img class="detail_img" src="../images/vias_location2.png" />
	조건에 맞는 차량의 단말ID를 검색할 수 있으며, 단말ID를 선택하여 차량의 해당 기간의 차량의 경로를 확인 할 수 있음. 또한, 해당 기간의 트립정보를 리스트 형태로 확인 할 수 있음. <br />
	차량유형과 차종, 날짜(최대7일)로 검색 할 수 있음.
	<br /><hr />
	
	3) 운행일지
	<img class="detail_img" src="../images/vias_run1.png" />
	차량유형, 차종, 기간을 이용하여 단말ID를 검색하고, 검색된 단말ID들을 체크하고 검색 하여 해당 기간에 대한 차량의 운행정보를 확인 할 수 있음.
	리스트의 단말 ID를 클릭하면 해당 단말ID의 트립정보와 주행정보를 볼 수 있음.
	<img class="detail_img" src="../images/vias_run2.png" />
	하나의 단말ID를 검색했을 경우 그래프 버튼이 나타남.
	그래프 버튼을 통하여 그래프 형태로 데이터를 볼 수 있음.
	<img class="detail_img" src="../images/vias_run3.png" />
	단말ID가 시험단이나 시험차량일 경우 선택한 ROW의 트립정보를 리스트로 보여줌.
	해당 리스트의 주행일자를 클릭하면 더 자세한 정보를 볼 수 있음.
	<img class="detail_img" src="../images/vias_run4.png" />
	단말ID가 시험단이나 시험차량일 경우 선택한 ROW의 주행정보를 리스트로 보여줌.
	해당 리스트의 Trip No를 클릭하면 더 자세한 정보를 볼 수 있음.
	<img class="detail_img" src="../images/vias_run5.png" />
	단말ID가 카쉐어링인 경우 선택한 ROW의 주행정보를 리스트로 보여줌.
	해당 리스트의 주행일자를 클릭하면 더 자세한 정보를 볼 수 있음.
	
	<br /><hr />
	
	4) 날씨
	<img class="detail_img" src="../images/vias_weather.png" />
	공공데이터포터털(https://www.data.go.kr/main.jsp) API와 연동하여 하루에 한번 BATCH 프로그램(Cron Tab)을 이용하여 전국 252개 구/군에 대한 날씨 데이터를 받아와 리스트 형식으로 보여줌
	
	<br /><hr />
	
	5) 통계
	<img class="detail_img" src="../images/vias_stats1.png" />
	<img class="detail_img" src="../images/vias_stats2.png" />
	<img class="detail_img" src="../images/vias_stats3.png" />
	<img class="detail_img" src="../images/vias_stats4.png" />
	<img class="detail_img" src="../images/vias_stats5.png" />
	성별, 연령별 , 사용자별, 차종별, 유종별로 인원수,주행거리, 연비를 그래프로 보여줌.
	구분( 인원수, 주행거리, 연비 ), 차량유형, 성별, 기간을 조건으로  그래프와 리스트를 갱신 할 수 있음.
	
	<br /><hr />
	
	6) 공통
	<img class="detail_img" src="../images/vias_excel.png" />
	모든 리스트형식의 데이터는 EXCEL 버튼을 통해 데이터를 EXCEL 파일로 다운받을 수 있음.
	
</div>

<!-- 이미지 -->
<!-- <img class="detail_img" src="../images/TJS.PNG" /> -->