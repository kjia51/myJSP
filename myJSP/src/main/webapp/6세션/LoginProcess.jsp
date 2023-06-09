<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
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
String id = request.getParameter("user_id");
String pw = request.getParameter("user_pw");

MemberDao dao = new MemberDao();
Member member = dao.login(id, pw);

if(member!=null){
	//로그인 성공 -> 세션에 member 객체 저장
	session.setAttribute("user_id", member.getId());
	session.setAttribute("member", member);
	
	response.sendRedirect("LoginForm.jsp");
	
} else{
	//로그인 실패 -> loginform페이지로 이동, 오류 메세지 출력
	request.setAttribute("LoginErrMsg", "아이디, 비밀번호가 일치하지 않습니다.");
	
	// LoginForm.jsp로 이동
	// request 영역을 공유하기 위해 forward 사용
	request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
}
%>
<h2>목록보기</h2>
<table>
<tr><>
</table>
</body>
</html>