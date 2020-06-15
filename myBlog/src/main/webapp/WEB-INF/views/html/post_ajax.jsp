<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 주제 -->
<div class="detail_subject">
<span class="glyphicon glyphicon-tags" aria-hidden="true"></span>
<h2>ajax 사용시 발생하는  에러 해결 방법  </h2>
</div>
<br /><br />
 
<!-- 부주제 -->
<div class="detail_sub_subject">
<span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span>
<h4> 1. code : 0 에러</h4>
</div>
 
<!-- 내용 -->
<div class="detail_div">
에러가 뜨는 경우는 크게 2가지다. <br /> <br />
첫번째 , 요청 url이 다른경우이다. <br />
ajax에는 Same Origin Policy라는 원칙이 있다. 간단하게 말하면 html 페이지에서 ajax의 요청 url을 localhost로 지정했는데, 크롬 브라우저에서는 127.0.0.1로 요청을 날려 에러가 발생하는 것이다.
이는 동일 출처 정책으로 크롬 브라우저에서 호스트가 동일하지 않다고 생각하는 것이다. 하지만 ie에서는 요청 url이 달라도 정삭적으로 동작한다. <br /><br />
두번째 , 어떠한 이유로 인하여 submit이 2번 일어나는 것이다. <br />
submit 타입을 가진 버튼이 있는데 버튼에 onclick 이벤트를 생성하여 ajax를 실행 시키는 경우나, jquery를 사용할 떄 href="" 와 같은 의미없는 값으로 인한 에러가 있다. <br />
다른 경우는 form안의 버튼에 onclick 이벤트를 주고 타입을 button으로 주지 않은 경우이다. 이유는 잘 모르지만 button속성을 주지 않으면 default가 submit 타입인 것 같다.
따라서 button태그의 타입을 button으로 바꾸꺼나 button태그를 input태그로 바꾸면 해결된다.
</div>

<!-- 이미지 -->
<!-- <img class="detail_img" src="../images/TJS.PNG" /> -->
