<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 주제 -->
<div class="detail_subject">
<span class="glyphicon glyphicon-tags" aria-hidden="true"></span>
<h2> ERP 개발 프로젝트 </h2>
</div>
<br /><br />
 
<!-- 부주제 -->
<div class="detail_sub_subject">
	<span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span>
	<h4> 1. 개발 환경</h4>
</div>
 
<!-- 내용 -->
<div class="detail_div">

	<div style="width : 100%;">
		<div style="width : 15%; float : left;">
			1) 개발 환경 : 
		</div>
		<div style="width : 85%; float : left;">
			Linux, Tomcat7, jdk1.7
		</div>	
	</div>
	<div style="width : 100%;">
		<div style="width : 15%; float : left;">
			2) 개발 언어 :
		</div>
		<div style="width : 85%; float : left;">
			JAVA, JAVASCRIPT, ORACLE , JSP 
		</div>
	</div>
	<div style="width : 100%;">
		<div style="width : 15%; float : left;">
			3) 개발 도구 :
		</div>
		<div style="width : 85%; float : left;">
			Eclipse, HeidiSQL
		</div>
	</div>
	<div>
	4) 사내에서 사용하기 위하여 개발하게 된 erp 시스템. 회사의 팀내에서 발생하는 업무나 타 팀에 요청하는 업무들을 테이터화 시켜 업무의 효율성을 높힘.
	또한, 사내의 구비물품들을 데이터화하여 물품의 관리를 용이하게 함. 고객사와 외주사의 관리와 한 해의 실적을 확인할 수 있음.
	</div>
</div>

<!-- 부주제 -->
<div class="detail_sub_subject">
	<span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span>
	<h4> 2. 개발 내용</h4>
</div>
 
<!-- 내용 -->
<div class="detail_div">

erp 시스템에서의 모든 메뉴는 로그인하는 유저(직원)의 권한 등급에 따라 달라지며 그 하위 카테고리 역시 권한 등급에 따라 메뉴의 구성이 달라진다.
<br />

<div style="width : 100%;">
　
</div>
1) 자원

<img class="detail_img" src="../images/clex_1.PNG" /><br />
<div style="width : 100%;">
	<div style="width : 12%; float : left;">
		- 직원 : 
	</div>
	<div style="width : 88%; float : left;">
		 직원들의 정보들은 관리함. 유저의 권한에 따라 보여지는 리스트가 달라짐. ( 사원 : 본인 , 팀장 : 팀원 , 본부장 : 본부인원, 관리자 : 전체 등 )
	</div>	
</div>
<div style="width : 100%;">
	<div style="width : 12%; float : left;">
		- 인사발령 : 
	</div>
	<div style="width : 88%; float : left;">
		 직원의 진급이나 팀이동 등의 인사에 관련된 일을 처리함.
	</div>	
</div>
<div style="width : 100%;">
	<div style="width : 12%; float : left;">
		- 부서관리 : 
	</div>
	<div style="width : 88%; float : left;">
		 신설부서의 추가나 삭제 혹은 부서이동 등의 일을 처리함.
	</div>	
</div>
<div style="width : 100%;">
	<div style="width : 12%; float : left;">
		- 자산관리 : 
	</div>
	<div style="width : 88%; float : left;">
		 회사가 관리하는 모든 물품들을 관리함. 종류별, 사용자별 등으로 검색하여 해당 물품이 사용중인지 아닌지 혹은 누가 사용중인지 확인 할 수 있음.
		 또한 물품을 교체하거나 퇴사자가 발생하면 시스템 상에서 회수하여 해당 물품들을 재고로 남겨둠.
	</div>	
</div>
<div style="width : 100%;">
	<div style="width : 12%; float : left;">
		- 자산집계 : 
	</div>
	<div style="width : 88%; float : left;">
		 회사가 관리하는 모든 물품들의 집계.( ex = 컴퓨터 : xx대  , 모니터 : xx대 ... )
	</div>	
</div>
<div style="width : 100%;">
　
</div>
<hr />


2) 상품

<img class="detail_img" src="../images/clex_3.PNG" /><br />
<div style="width : 100%;">
	<div style="width : 15%; float : left;">
		- 사업자정보 : 
	</div>
	<div style="width : 85%; float : left;">
		 광고주가 속해힜는 회사의 사업자정보.
	</div>	
</div>
<div style="width : 100%;">
	<div style="width : 15%; float : left;">
		- 매체사 : 
	</div>
	<div style="width : 85%; float : left;">
		 광고를 할 수 있는 플랫폼을 가진 회사의 정보. ( 리얼클릭 , 네이버 , 페이스북 등.. )
	</div>	
</div>
<div style="width : 100%;">
	<div style="width : 15%; float : left;">
		- 외주사 : 
	</div>
	<div style="width : 85%; float : left;">
		 외주를 맡길 회사의 정보.
	</div>	
</div>
<div style="width : 100%;">
	<div style="width : 15%; float : left;">
		- 광고상품 : 
	</div>
	<div style="width : 85%; float : left;">
		회사가 판매하는 상품들을 관리. ( 페이스북 광고 , 블로그 광고 등.. )
	</div>	
</div>
<div style="width : 100%;">
　
</div>
<hr />

3) 고객

<img class="detail_img" src="../images/clex_4.PNG" /><br />
<div style="width : 100%;">
	<div style="width : 15%; float : left;">
		- 계약광고주 : 
	</div>
	<div style="width : 85%; float : left;">
		 광고주의 정보. ( 회사이름 , 직급, 핸드폰번호 등.. )
	</div>	
</div>
<div style="width : 100%;">
	<div style="width : 15%; float : left;">
		- 광고계정 : 
	</div>
	<div style="width : 85%; float : left;">
		 광고주의 광고를 진행하기 위한 접속계정. ( 리얼클릭 , 네이버 , 페이스북 등.. )
	</div>	
</div>
<div style="width : 100%;">
	<div style="width : 15%; float : left;">
		- 계약서 : 
	</div>
	<div style="width : 85%; float : left;">
		 계약서 사본업로드.
	</div>	
</div>
<div style="width : 100%;">
　
</div>
<hr />

4) 운영

<img class="detail_img" src="../images/clex_5.PNG" /><br />
<div style="width : 100%;">
	<div style="width : 15%; float : left;">
		- 업무요청 : 
	</div>
	<div style="width : 85%; float : left;">
		 타 부서에 요청할 업무을 등록.
	</div>	
</div>
<div style="width : 100%;">
	<div style="width : 15%; float : left;">
		- 업무처리 : 
	</div>
	<div style="width : 85%; float : left;">
		 타 부서에서 요청한 업무를 확인. 처리중, 반려, 처리완료 등으로 요청업무를 처리할 수 있음.
	</div>	
</div>
<div style="width : 100%;">
	<div style="width : 15%; float : left;">
		- 업무유형관리 : 
	</div>
	<div style="width : 85%; float : left;">
		 관리자의 메뉴로 업무요청의 카테고리에 없는 일을 요청할 때 사용함. 새로운 유형의 업무 카테고리를 구성.
	</div>	
</div>
<div style="width : 100%;">
	<div style="width : 15%; float : left;">
		- 광고비관리 : 
	</div>
	<div style="width : 85%; float : left;">
		광고비의 입 출금 내역을 기록.
	</div>	
</div>
<div style="width : 100%;">
	<div style="width : 15%; float : left;">
		- 광고비현황 : 
	</div>
	<div style="width : 85%; float : left;">
		광고비관리의 데이터를 기반으로 광고비의 잔액 및 사용처를 확인.
	</div>	
</div>
<div style="width : 100%;">
	<div style="width : 15%; float : left;">
		- 세금계산서 : 
	</div>
	<div style="width : 85%; float : left;">
		국세청에서 발행한 세금계선서를 이용하여 해당 건마 세금발행 내용을 확인. 타회사에서 발행해주는 세금 계산서는 직접 입력.
	</div>	
</div>
<div style="width : 100%;">
　
</div>
<hr />

5) 실적

<img class="detail_img" src="../images/clex_6.PNG" /><br />
<div style="width : 100%;">
	<div style="width : 15%; float : left;">
		- 실적 : 
	</div>
	<div style="width : 85%; float : left;">
		 직원들의 일별 실적을 확인 할 수 있음.
	</div>	
</div>
<div style="width : 100%;">
	<div style="width : 15%; float : left;">
		- 대상별집계 : 
	</div>
	<div style="width : 85%; float : left;">
		 대상별 , 팀별 , 본부별로 실적을 확인 할 수 있음.
	</div>	
</div>
<div style="width : 100%;">
	<div style="width : 15%; float : left;">
		- 월별집계 : 
	</div>
	<div style="width : 85%; float : left;">
		 월별, 분기별 , 년별로 실적을 확인 할 수 있음.
	</div>	
</div>
<div style="width : 100%;">
	<div style="width : 15%; float : left;">
		- 업로드내역 : 
	</div>
	<div style="width : 85%; float : left;">
		실적내용을 업로드 한 내역을 확인. 업로드시 해당 로우에 에러가 발생하면 에러 카운트.
	</div>	
</div>
<div style="width : 100%;">
　
</div>
<hr />

6) 관리

<img class="detail_img" src="../images/clex_7.PNG" /><br />
<div style="width : 100%;">
	<div style="width : 15%; float : left;">
		- 권한관리 : 
	</div>
	<div style="width : 85%; float : left;">
		 직원들에 대한 메뉴권한을 적용시킴.
	</div>	
</div>
<div style="width : 100%;">
	<div style="width : 15%; float : left;">
		- 코드관리 : 
	</div>
	<div style="width : 85%; float : left;">
		 상품의 카테고리처럼 유니크한 코드가 필요한 경우에 사용. 
	</div>	
</div>
<div style="width : 100%;">
　
</div>
<hr />

<div style="width : 100%;">
	- 다음은 소스파일의 일부분이다.
</div>

- Controller
<img class="detail_img" src="../images/clex_c1.png" /><br />
<img class="detail_img" src="../images/clex_c2.png" /><br />
- Javascript
<img class="detail_img" src="../images/clex_j1.png" /><br />
- html ( 다이얼로그 )
<img class="detail_img" src="../images/clex_h1.png" /><br />
- Js ( 다이얼로그 데이터 파싱 )
<img class="detail_img" src="../images/clex_js.png" /><br />


</div>



<!-- 이미지 -->
<!-- <img class="detail_img" src="../images/TJS.PNG" /> -->