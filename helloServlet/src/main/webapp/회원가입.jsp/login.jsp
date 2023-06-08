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
	String id = request.getParameter("id");
	String pw = request.getParameter("password");
	request.setAttribute("id", id);
	request.setAttribute("pw", pw);

	if(id =="gil" && pw =="1234" ){
		
	}

	// request스코프에 값 저장하기.

	
	//포워드방식으로 페이지 이동하기.
	//pageContext.forward("result.jsp");


	//redirect방식
	response.sendRedirect("result.jsp");
	%>

	
</body>
</html>