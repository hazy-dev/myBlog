<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 주제 -->
<div class="detail_subject">
<span class="glyphicon glyphicon-tags" aria-hidden="true"></span>
<h2>cafe24 웹 호스팅 방법 ( tomcat 호스팅 ) </h2>
</div>
<br /><br />
 
<!-- 부주제 -->
<div class="detail_sub_subject">
<span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span>
<h4> 1. 서버 구매 </h4>
</div>
 
<!-- 내용 -->
<div class="detail_div">
cafe24 홈페이지에 보면 여러가지 호스팅 종류가 있다.
<img class="detail_img" src="../images/cafe_menu.png" />
위와 같이 많은 호스팅 종류가 있는데 여기서는 tomcat 호스팅을 해볼 것이다. 
tomcat 호스팅을 선택하고 들어가면 서비스명에 따라서 서버의 스팩이 다른데, 자신이 서버를 어떻게 사용할 것인가를 생각하고 선택하길 바란다.
( 고급형일 수록 너무 비싸다.. )
<img class="detail_img" src="../images/cafe_service.png" />
자신이 신청하고자 하는 서비스를 선택하면 관리자 정보를 입력하도록 되어있다. 빨간 박스 부분인 FTP,Telnet,DB 비밀번호와 약관에 체크를 하면 된다.
비밀번호는 DB연동이나 서비스 등록시 필요하므로 자신이 기억하기 쉬운 비밀번호를 사용하거나 꼭 메모하길 바란다.
<img class="detail_img" src="../images/cafe_admininfo.png" />
다음은 결제정보와 서버 환경, 도메인 등을 확인할 수 있다.
사용기간은 1개월부터 3년까지 할 수 있으며 시간에 따라 할인율이 다르다. 연습용으로 사용할 것이라면 1~6개월만 선택하면 될 것이다.
tomcat 호스팅의 환경설정은 선택할 게 없다. ( 웹 호스팅의 경우는 php버전부터 db, 인코딩까지 선택할 수 있다. )
도메인은 기본적으로  - 나의cafe24아이디.cafe24.com - 으로 설정이되며 개인적으로 도메인을 가지고 있거나 신규도메인으로 신청해도 된다.
보유한 도메인으로 사용할 경우는 모르지만 신규도메인을 등록할 경우 1~2만원 정도 금액이 들어간다.
모든 설정이 완료되면 결제를 진행하면 된다.
<img class="detail_img" src="../images/cafe_buy.png" />
</div>
<br /><br />
<!-- 부주제 -->
<div class="detail_sub_subject">
<span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span>
<h4> 2. 서버에 프로젝트 올리기 ( spring-framework ) </h4>
</div>

<!-- 내용 -->
<div class="detail_div">
( 프로젝트가 로컬에서 db접속 및 파일 업로드 테스트가 완료됬다고 가정하고 진행하겠다. ) <br />
프로젝트를 cafe24 서버에 올리기 위해서는 서버에 올릴 프로젝트의 설정을 cafe24 서버에 맞게 변경해주어야 한다.
로컬에서는 어떤 db를 사용했는지 모르지만 tomcat 호스팅에서는 mariadb를 사용하기 때문에 이에 대한 설정이 필요하다.
따라서 pom.xml에 mariadb jdbc connector dependency를 추가한다.
<br /><br />
<textarea rows="7" cols="50" style="resize: none;">
<!-- maria -->
<dependency>
    <groupId>org.mariadb.jdbc</groupId>
    <artifactId>mariadb-java-client</artifactId>
    <version>1.5.7</version>
</dependency>
</textarea>
<br />
dependency를 추가했다면 자신이 db관련 설정을 한 xml에서 설정을 mariadb에 맞게 변경해 주어야 한다.
<br /><br />
<textarea rows="7" cols="90" style="resize: none;">
<bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
    <property name="driverClassName" value="org.mariadb.jdbc.Driver"></property>
    <property name="url" value="jdbc:mariadb://localhost/cafe24아이디"></property>
    <property name="username" value="cafe24아이디"></property>
    <property name="password" value="관리자 정보에서 입력한 비밀번호"></property>
</bean>
</textarea>
<br />

서버에 올리는 프로젝에는 컴파일 된 java파일인 .class 파일이 필요하다.
파일의 위치와 필요한 파일을 정확히 안다면 상관없지만, 그렇지 않다면  WEB-INF안에 classes폴더를 만들고 그 안에 class파일들을 저장하는게 편하다. 
( filezilla를 통한 업로드 떄 한번에..!! )
먼저 WEB-INF에 classes폴더를 생성하고 경로를 지정한다.
<img class="detail_img" src="../images/cafe_class_path.png" />
위에서 보이는 Output folder를 더블 클릭하면 경로를 지정해줄 수 있다. 
<br />

여기까지 했다면 WEB-INF를 그대로 서버에 옮기면 끝나지만 파일 업로드 기능을 사용할 것이라면 cafe24 서버의 경로를 알고 있어야한다.
경로는  /cafe아이디/tomcat/webapps/ROOT/WEB-INF/... 으로 구성되어있으며 원하는 경로에 폴더를 만들고 path를 지정하면 된다.
<br />
모든  준비가 끝났다면 filezilla를 다운받고 사이트 관리자에 정보를 입력해야한다.
<img class="detail_img" src="../images/cafe_filezila_info.png" />
db및 ftp 접속정보는  cafe24홈페이지의  나의서비스관리 > 서비스 접속정보에서 확인 할 수 있다.
호스트와 사용자의 아이디,비번을 입력하고 접속을 하면 아래와 같은 경로가 나오게 된다.
<img class="detail_img" src="../images/cafe_filezila_root.png" />
ROOT폴더 밑에 프로젝트의 WEB-INF를 복사해 붙어넣으면 프로젝트가 정상적을 동작을 할 것이다.
프로젝트를 war파일로 export하고 압축을 풀면 ( 프로젝트.war의 확장자를 zip로 바꾼다. ) WEB-INF안에 class파일과 xml, jsp 파일들이 잘 들어가 있을 것이다.
<br /><br />

filezllia에서 프로젝를을 업로드 했다면 서버를 재시작 해보자.<br />
아래와 같이 putty에 호스트와 포트를 입력하고 서버에 접속한다. 
<img class="detail_img" src="../images/cafe_putty_info.png" />
<br />
서버내리기.
<img class="detail_img" src="../images/cafe_putty_shutdown.png" />
<br />
서버올리기.
<img class="detail_img" src="../images/cafe_putty_startup.png" />
<br /><br />

이제 정상적으로 홈페이지가 열리는지 테스트 해보자.
<br /><br />

추가로 cafe24의 db를 외부에서 접속하기 위해서는 외부접속 허용을 해주어야한다. <br />
나의서비스관리 > 서비스 사용현황 에서 mysql 외부 ip 접근설정이라는 메뉴가 있다. 이를 클릭하고 허용하길 원하는 ip를 입력하면 
외부에서도 db를 접근할 수 있다. 패키지마다 허용갯수는 차이가 있다.
<br /><br />
외부접속이 아닌 홈페이지에서도 db에 접근 할 수 있다. <br />
나의서비스관리 > mysql웹어드민 메뉴를 들어가면 접속하기 버튼이 있다.
아이디와 비밀번호를 입력하고 들어가면 자신의 db에 접근하여 사용할 수 있다.

</div>


















