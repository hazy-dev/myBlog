<html lang="ko">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- head -->
<%@ include file="../recipe_common/head.jsp"%>
<body id="tt-body-index" class="layout-wide color-bright post-type-text paging-view-more">
<link rel="stylesheet" type="text/css" href="https://t1.daumcdn.net/tistory_admin/static/manage/font/notosans.css" >
<script type="text/javascript">
	(function() {
		if (!window.T) {
			window.T = {}
		}
		window.T.config = {"TOP_SSL_URL":"https:\/\/www.tistory.com","PREVIEW":false,"ROLE":"guest","PREV_PAGE":"","NEXT_PAGE":"","BLOG":{"isDormancy":false,"title":"Beverages"},"NEED_COMMENT_LOGIN":false,"COMMENT_LOGIN_CONFIRM_MESSAGE":"","LOGIN_URL":"https:\/\/www.tistory.com\/auth\/login\/?redirectUrl=http%3A%2F%2Fskin-demo-497e6.tistory.com%2F","DEFAULT_URL":"https:\/\/skin-demo-497e6.tistory.com","USER":{"name":null,"homepage":null},"ROLE_GROUP":"visitor","SUBSCRIPTION":{"status":"none","isConnected":false,"isProcessing":false,"isPending":false,"isWait":false,"isNone":true},"IS_LOGIN":false,"HAS_BLOG":false,"TOP_URL":"http:\/\/www.tistory.com"};
		window.appInfo = {"domain":"tistory.com","topUrl":"https:\/\/www.tistory.com","loginUrl":"https:\/\/www.tistory.com\/auth\/login","logoutUrl":"https:\/\/www.tistory.com\/auth\/logout"};

        window.initData = {};
        
	})();
</script>

<script type="text/javascript" src="https://t1.daumcdn.net/tistory_admin/assets/blog/1b34c740563adb6d06695c0ad6795b9e552120f8/blogs/script/blog/common.js?_version_=1b34c740563adb6d06695c0ad6795b9e552120f8"></script>
<script type="text/javascript" src="../../smart2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<div style="margin:0; padding:0; border:none; background:none; float:none; clear:none; z-index:0"></div>
<div id="acc-nav">
	<a href="#content">본문 바로가기</a>
</div>
<div id="wrap">
	<!-- header -->
	<jsp:include page="../recipe_common/header.jsp" flush="flase" />	
	<hr>
	<section class="container headerMargin">
		<article id="content">
			<!-- coverSlider -->
			<%-- <jsp:include page="../recipe_common/coverSlider.jsp" flush="flase" /> --%>
		
			<div class="cover-thumbnail-list-2">
				<h2>레시피 등록하기</h2>
			</div>
			<div class="cover-wide-panel">
			
				<!-- 
					- 필요 내용
					
					1. 카테고리 ( 양식, 중식, 한식, 일식, ..., 기타 )
					2. 제목 ( 요리의 이름 )
					3. 설명 ( 요리에 대한 설명 )
					4. 재료 ( 필수재료 , 있으면 좋은 재료 )
					5. 내용 ( 이미지를 포함한 요리의 전반적인 레시피 )
									
				 -->
				<textarea name="recipeSmartEdit" id="recipeSmartEdit" style="display:none;"  ></textarea>
			
			</div>
		</article>
		
	</section>
	<hr>
	<!-- <footer id="footer">
		<p class="copyright">DESIGN BY <a href="#">TISTORY</a> <a href="#" class="admin">관리자</a></p>
	</footer> -->
</div>

<script>

/*  네이버 스마트 에디터  */
$(document).ready(function(){
	document.onkeydown = function(){
		if(event.srcElement.type != "text" && event.srcElement.type != "textarea"){
			if(event.keyCode == 116){
				event.keyCode = 2;
				return false;
			} else if(event.ctrlKey && (event.keyCode == 78 || event.keyCode == 82)){
				return false;
			}else if(event.keyCode == 8){
				return false;
			}else if( event.ctrlKey && (event.keyCode == 85) ){
				return false;
			}
		}
	}
	document.ondragstart = function(){
		if(event.srcElement.type != "text" && event.srcElement.type != "textarea"){
			return false;
		}
	}
	document.onselectstart = function(){
		if(event.srcElement.type != "text" && event.srcElement.type != "textarea"){
			return false;
		}
	}
	document.oncontextmenu = function(){
		if(event.srcElement.type != "text" && event.srcElement.type != "textarea"){
			return false;
		}
	}
});


var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
 oAppRef: oEditors,
 elPlaceHolder: "recipeSmartEdit",
 sSkinURI: "../../smart2/SmartEditor2Skin.html",
 htParams : {
     // 툴바 사용 여부
     bUseToolbar : true,
     // 입력창 크기 조절바 사용 여부
     bUseVerticalResizer : true,
     // 모드 탭(Editor | HTML | TEXT) 사용 여부
     bUseModeChanger : true,
 }
});

function insertFn(){
		oEditors.getById["recipeSmartEdit"].exec("UPDATE_CONTENTS_FIELD", []);
	
  	/* $("#regiForm").ajaxForm({	
		url:"/noti_insert",
		processData: false,
        contentType: false,
        dataType: "json",
        beforeSubmit:function(){
        	//확장자체크
        },
        success: function (result) {
        	
        	console.log(result);
        	
        	if(result.data == 1){
  				alert("정상적으로 등록되었습니다.");
  				goListFn();
  			}else if(result.data == 2){
  				alert("지정된 파일 형식이 아닙니다.");
  			}else{
  				alert("등록에 실패하였습니다.");
  			}
        },

        error: function () {
        	alert("에러가 발생했습니다.");
        }
        	
	}).submit(); */
}

</script>

<script src="https://tistory1.daumcdn.net/tistory/2948280/skin/images/script.js"></script>
<script src="//search1.daumcdn.net/search/statics/common/js/g/search_dragselection.min.js"></script>

<script>
    lightbox.option({
		"fadeDuration": 200,
	    "resizeDuration": 200,
	    "wrapAround": false,
		"albumLabel": "%1 / %2",
		"fitImagesInViewport":true ,
		"stopEvent": false
    
</script>            
</body>
</html>


