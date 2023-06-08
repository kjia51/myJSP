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

	String id = request.getParameter("userid");	
	String pw = request.getParameter("userpw");

	out.print("id : "+id+"<br>");
	out.print("pw : "+pw+"<br>");
	
	// id != null && id.equals("abc")
	if("abc".equals(id) && "123".equals(pw)){
		//로그인 성공
		
		//세션에 저장
		session.setAttribute("id",id);
		
		response.sendRedirect("gogreen.jsp?rightside=id님 환영합니다.");

	} else{	
		response.sendRedirect("gogreen.jsp?loginErr=Y");
	}
%>
</body>
</html>