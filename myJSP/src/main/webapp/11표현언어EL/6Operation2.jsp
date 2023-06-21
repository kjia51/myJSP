<%@page import="java.util.ArrayList"%>
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
		pageContext.setAttribute("num1", 9);
		pageContext.setAttribute("num2", "10");
	
		
		// empty 연산자
		// null, 빈 문자열, 길이가 0인 배열, 사이즈가 0인 컬렉션인 경우 true 반환
		pageContext.setAttribute("nullStr", null);
		pageContext.setAttribute("emptyStr", "");
		pageContext.setAttribute("lengthZero", new Integer[0]);
		pageContext.setAttribute("sizeZero", new ArrayList());
	%>
	<h2>empty 연산자</h2>
	<ul>
	<!--  주로 리스트 출력 시 리스트가 비었는지 확인하는 용도로 사용 -->
	<li>empty nullStr : ${empty nullStr}</li>
	<li>empty emptyStr : ${empty emptyStr}</li>
	<li>empty lengthZero : ${empty lengthZero}</li>
	<li>empty sizeZero : ${empty sizeZero }</li>
	<li>empty num1 : ${empty num1 }</li>
	</ul>
	
	<h3>삼항 연산자</h3>
	<!-- 조건? "true" : "false" -->
	${num1 gt num2  "num1이 크다" : "num2가 크다"}
	
	<h3>null 연산</h3>
	<!-- null이 연산에 사용될 경우 0으로 인식 -->
	${null + 20} <br>
	${nullStr + 20} <br>
	${param.noVar > 20} <br>
</body>
</html>