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

	String id = request.getParameter("userid");	
	String pw = request.getParameter("userpw");

	// 아이디 저장 체크박스
	String saveYN = request.getParameter("save_check");

	
	// 체크박스가 선택되었을 경우 아이디를 쿠키에 저장합니다.
	if("Y".equals(saveYN)){
		// userID, 사용자아이디
		//CookieManager를 이용하여 쿠키를 생성 후 응답객체에 담아줌
		CookieManager.makeCookie(response, "userid", id, 60*60*24*7);
	}
	
	
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