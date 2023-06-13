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
	//회원인증정보 속성 삭제
	session.removeAttribute("user_id");
	session.removeAttribute("member");
	
	response.sendRedirect("LoginForm.jsp");

%>
		<!--  
		//세션무효화
		session.invalidate();
		
		//세션아이디 새로 발급
		request.getSession(true);
		response.sendRedirect("LoginForm.jsp");
		-->
</body>
</html>