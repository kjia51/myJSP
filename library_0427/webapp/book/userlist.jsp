<%@page import="com.library.vo.User"%>
<%@page import="java.util.List"%>
<%@page import="com.library.dao.userdao"%>
<%@page import="com.library.vo.Criteria"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css">

</head>
<body>

<%@include file="../common/header.jsp" %>

<h2>사용자 목록</h2>
총 건수 : ${usermap.usertotalCnt }
<%@include file="../common/searchForm.jsp" %>
<table border="1" width="90%">
	<tr>
		<th width="5%"></th>
		<th width="20%">아이디</th>
		<th width="10%">이름</th>
		<th width="20%">관리자여부</th>
	</tr>
	<c:if test="${empty usermap.userlist }" var="res">
		<td colspan="5" class="center">
			등록된 게시물이 없습니다.
		</td>
	</c:if>
	<c:if test="${not res }">
		<c:forEach items="${list }" var="user" step="1">
		<tr>
			<td class="center">
				<input type="checkbox" name="delNo" value="${user.no }">
			</td>
			<td>${user.id }</td>
			<td>${user.name }</td>
			<td>${user.adminyn }</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="5" class="center">
				<!-- 페이지블록 -->
				<%@include file="PageNavi.jsp" %>
			</td>	
		</tr>
	</c:if>

</table>

</body>
</html>