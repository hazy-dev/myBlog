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
				<h2>상세보기</h2>
			</div>
			<div class="cover-wide-panel">
				<div class="bg" style="background-image:url(https://t1.daumcdn.net/cfile/tistory/99BF20415BC4BB9D01);"></div>
				<div class="box">
					<span class="category">음식 카테고리 ( 양식, 중식, 일식, 한식... )</span>
					<h2>요리 이름</h2>
					<p>요리 간단 설명 및 재료 소개</p>
					<a href="#" class="btn view">더보기</a>
					<!-- 더보기를 누르면 상세 설명 추가 -->
				</div>
				<div>
					네이버 스마트 에디터 내용 들어가는 부분!!
				</div>
			</div>
		</article>
		
	</section>
	<hr>
	<footer id="footer">
		<p class="copyright">DESIGN BY <a href="#">TISTORY</a> <a href="#" class="admin">관리자</a></p>
	</footer>
</div>
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
    })
</script>            
</body>
</html>


