<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.library.service.MemberService" %>
<%@ page import="com.library.vo.Member" %>
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
	
	//java resources -> webapp/web-inf/lib
	MemberService service = new MemberService();
	//session.setAttribute("id", id);
	//session.setAttribute("pw", pw);
	Member member = service.login(id, pw);
	if(member!=null && ! member.getId().equals("")){
		session.setAttribute("member", member);
		
		//out.print(member.getId()+"님 welcome");
		 
		if( member.getId().equals("admin")){
			//관리자 페이지 호출
			%>
			<script>
			alert("관리자님 환영합니다");
			location.href="loginAdmin.jsp";
			</script>
	
			<% 
		} else {
			//사용자 페이지 호출
			%>
			<script>
			alert("<%=member.getId()%>님 환영합니다~!");
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