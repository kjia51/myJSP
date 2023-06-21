<%@page import="utils.CookieManager"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	/*
		쿠키나 헤더 값을 읽을 수 있는 내장 객체 제공
		cookie : 쿠키 읽을 때
		header : 헤더정보를 읽을 때
		initParam : web.xml 에 설정한 컨텍스트 초기화 매개변수 읽을 때
		pageContext : jsp 의 pageContext 객체와 동일한 역할
	*/
	%>
	
	<%
	CookieManager.makeCookie(response, "ELCookie", "EL좋아요", 10);
	%>
	
	<h3>쿠키 값 읽기</h3>
	<ul>
	<li>${cookie.ELCookie.value}</li>
	</ul>
	
	<h3>HTTP 헤더 읽기</h3>
	<ul>
		<li>host : ${header.host}</li>
		<li>user-agent : ${header['user-agent']}</li>
		<li>cookie : ${header.cookie }</li>
	</ul>
	<h3>컨텍스트 초기화 매개변수</h3>
	<ul>
		<li>${initParam.INIT_PARAM}</li>
		<li>${initParam.OracleDriver}</li>
	</ul>
	
	<h3>컨텍스트 루트 경로 읽기</h3>
	<ul>
		<li>${pageContext.request.contextPath}</li>
	</ul>
</body>
</html>