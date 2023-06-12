
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
	String id = request.getParameter("userid"); 
	String pw = request.getParameter("userpw");
	
	MemberDao dao = new MemberDao();
	Member member = dao.login(id, pw);
	


	
	if(member!=null && !member.getId().equals("")){

		 
		if(member.getId().equalsIgnoreCase("admin")){
			%>
			<script>
			alert("관리자님 환영합니다");
			location.href="loginAdmin.jsp";
			</script>
	
			<% 
			
		} else {
			%>
			<script>
			alert("<%=member.getName()%>님 환영합니다~!");
			location.href="loginMember.jsp";
			</script>
			<% 
		}
		} else {
			response.sendRedirect("login.jsp?loginErr=Y");
		}
  		
	%>
</body>
</html>