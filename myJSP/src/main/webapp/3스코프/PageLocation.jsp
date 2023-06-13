<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>페이지 이동 후 page 영역 속성값 읽어오기</h2>
	<%
		Object page_str = pageContext.getAttribute("page").toString();
		Object page_int = pageContext.getAttribute("page_int");
		Object pagePerson = pageContext.getAttribute("pagePerson");
	%>
	
	<ul>
		<li>int : <%=(page_int==null)?" 값 없음": page_int %></li>
		<li>String : <%=(page_str==null)?"값 없음": page_str %></li>
		<li>person : <%=(pagePerson==null)?"값 없음": pagePerson %></li>
	</ul>
</body>
</html>