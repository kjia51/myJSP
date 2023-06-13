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
<!-- 폼태그 : 폼태그 안에 있는 요소들을 파라메터로 가져감, 페이지를 요청 http 통신 요청 -->

	<% 
	// name 속성의 값을 매개값으로 넘겨주면 value 속성의 값을 반환합니다.
	String id = request.getParameter("userid"); // 파라메터는 폼의 요소 name 속성
	String pw = request.getParameter("userpw");
	// 아이디 저장 체크박스
	String saveYN = request.getParameter("save_check");
	out.print("saveYN : "+saveYN + "<br>");
	
	// 아이디 저장하기 체크박스에 체크가 되었다면 쿠키에 아이디 저장
	if("Y".equals(saveYN)){
		// userID, 사용자아이디
		//CookieManager를 이용하여 쿠키를 생성 후 응답객체에 담아줌
		CookieManager.makeCookie(response, "userid", id, 3600);
	}
	
	if("abc".equals(id) && "123".equals(pw)){
		out.print(id+"님 환영합니다.");
		//response.sendRedirect("login.jsp?name="+id);
		// html을 출력하고 싶으면
		//% >
		//<h1>로그인 성공</h1>
		//< % 
	} else if("abc".equals(id)){
		out.print("비밀번호를 다시 입력해주세요");
	} else{
		out.print("아이디와 비밀번호를 다시 입력해주세요");
	}
	%>
</body>
</html>