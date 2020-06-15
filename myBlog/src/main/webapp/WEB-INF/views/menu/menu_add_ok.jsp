<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<form name="upload_result_form">
<input type="hidden" name="menu_result" value="${data}">
</form>
<script type="text/javascript">

location_next();
function location_next(){
	
	var next = document.upload_result_form.menu_result.value;

	if( next == 0 ){
		alert("메뉴 등록에 실패하였습니다.");
		location.href = "/menu_add";
	}else{
		alert("정상적으로 등록되었습니다.");
		location.href= "/menu";
	}
	
}

</script>
