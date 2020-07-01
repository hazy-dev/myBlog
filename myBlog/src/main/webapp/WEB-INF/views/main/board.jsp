<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<table class="table table-hover">
	<colgroup>
		<col style="width:20%">
		<col style="width:60%">
		<col style="width:20%">	
	</colgroup>
	<thead>
		<tr>
			<td>Category</td>
			<td>Subject</td>
			<td>Date</td>
		</tr> 
	</thead>
	<tbody>
		<c:forEach var="data" varStatus="status" items="${list}">
			<tr>
				<td>${data.category == 1 ? '포트폴리오' : '포스트'}</td>
				<td><a onclick="board_detail('${data.filename}')">${data.subject}</a></td>
				<td>${data.uploadDate}</td>
			</tr> 
		</c:forEach>
	</tbody>
</table>
<div style="text-align: center;">
	${pagination}
</div>

