<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>Insert title here</title>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
%>
	<h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
	<ul>
	<li>데이터 전송방식 : <%= request.getMethod() %></li>
	<li>URL : <%= request.getRequestURL()%></li>
	<li>URI : <%= request.getRequestURI()%></li>
	<li>프로토콜 : <%= request.getProtocol()%></li>
	<li>서버명 : <%= request.getServerName()%></li>
	<li>서버포트 : <%= request.getServerPort()%></li>
	<li>클라이언트 IP 주소 : <%= request.getRemoteAddr()%></li>
	<li>쿼리스트링 : <%= request.getQueryString()%></li>
	<!-- 
	<input type='text' name='id' value='123'>
	?id=123
	request.getParameter("id"); 123
	value 속성값  = request.getParameter("name속성값") -->
	<li>전송된 값 1 : <%= request.getParameter("eng")%></li>
	<li>전송된 값 2 : <%= request.getParameter("han")%></li>
	<!-- post 방식으로 받아올 때 한글이 깨지는 상황 발생 -->
	</ul>
            
</body>
</html>