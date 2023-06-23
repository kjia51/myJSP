<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 변수선언 -->
	<c:set var="ScopeVar" value="Page Value"/>
	<c:set var="ScopeVar" value="Request Value" scope="request"/>
	<c:set var="ScopeVar" value="Session Value" scope="session"/>
	<c:set var="ScopeVar" value="Application Value" scope="application"/>

	<h4>출력하기</h4>
		<ul>
		<li>ScopeVar: ${ScopeVar }</li>
		<li>requestScope.ScopeVar: ${requestScope.ScopeVar }</li>
		<li>sessionScope.ScopeVar: ${sessionScope.ScopeVar }</li>
		<li>applicationScope.ScopeVar: ${applicationScope.ScopeVar }</li>
		</ul>


	<h4>session 영역에서 삭제하기</h4>
		<c:remove var="ScopeVar" scope="session"/>
		<ul>
		<li>ScopeVar: ${ScopeVar }</li>
		<li>requestScope.ScopeVar: ${requestScope.ScopeVar }</li>
		<li>sessionScope.ScopeVar: ${sessionScope.ScopeVar }</li>
		<li>applicationScope.ScopeVar: ${applicationScope.ScopeVar }</li>
		</ul>
		
	<h4>영역 지정없이 삭제</h4>
	<!-- 모든 영역에서 변수 삭제 -->
		<c:remove var="ScopeVar"/>
		<ul>
		<li>ScopeVar: ${ScopeVar }</li>
		<li>requestScope.ScopeVar: ${requestScope.ScopeVar }</li>
		<li>sessionScope.ScopeVar: ${sessionScope.ScopeVar }</li>
		<li>applicationScope.ScopeVar: ${applicationScope.ScopeVar }</li>
		</ul>
</body>
</html>