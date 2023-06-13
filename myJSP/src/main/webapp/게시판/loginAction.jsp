
<%@page import="utils.CookieManager"%>
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
	String saveYN = request.getParameter("save_check");
	MemberDao dao = new MemberDao();
	Member member = dao.login(id, pw);
	
	if("Y".equals(saveYN)){
		// userID, 사용자아이디
		//CookieManager를 이용하여 쿠키를 생성 후 응답객체에 담아줌
		CookieManager.makeCookie(response, "userid", id, 3600);
	}

	
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