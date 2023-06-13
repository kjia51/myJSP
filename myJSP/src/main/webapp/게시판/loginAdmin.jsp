

<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
	list-style: none;
	line-height: 1.5em;
	font-size: 1.1em;
	}
	h2{
	font-size: 1.3em;	
	}
	li{
	border: 1px solid black;
	width : 60%;
	background: url('./images/book-icon.png') no-repeat;
	padding-left: 50px;
	}
	ul{
	padding-left: 0px;
	
	}
	button{
	float:right;
	}
</style>
</head>
<body>

	<button onclick="location.href='logout.jsp'">로그아웃</button>
<h2>========관리자 메뉴========</h2>

	<ul>
		<li>Ⅰ.  도서등록</li>
		
		<li>Ⅱ. 도서삭제</li>
		<li>Ⅲ. 관리자등록</li>
		<li>Ⅳ. 관리자삭제</li>
	</ul>


</body>
</html>