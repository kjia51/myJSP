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
	request.setCharacterEncoding("utf-8");	
	%>
	<h2>액션태그로 폼의 값을 한번에 받기</h2>
	<jsp:useBean id="person" class="dto.Person"/>
	<!-- 와일드 카드를 사용하면 모든 폼의 값을 한번에 자바빈즈를 입력 -->
	<jsp:setProperty property="*" name="person"/>
	
	<ul>
		<li>이름 : <jsp:getProperty property="name" name="person"/> </li>
		<li>나이 : <jsp:getProperty property="age" name="person"/></li>
	</ul>
</body>
</html>