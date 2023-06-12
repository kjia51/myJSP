<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="css/gogreen.css">
</head>
<body>
<h3><로그인></h3>
		<aside id='rightside'>
              <div class='side1'>
              <%
          		String id = CookieManager.readCookie(request, "userid");
              %>
                   <% 
	                    String loginErr = request.getParameter("loginErr");
					    if("Y".equals(loginErr)){
					    	out.print("<script>alert('아이디/비밀번호를 확인해주세요')</script>");
					    }
			    	%>
			    	<%
					    String name = "";
					    if(session.getAttribute("id")!=null){
					    	name = (String)session.getAttribute("id");
					    }
					    if(name!=null && !name.equals("")){
					    	//out.print(name+"님 환영합니다");
					    	%><%= name +"님 환영합니다" %>
					    	<button onclick="location.href='logout.jsp'">로그아웃</button>
					    	<% 
					    }else{
					    	%>
				
				<form action="./loginAction.jsp" method="post">
                    <div class='loginbox'>
                        <div id='login'>
                            <input type="text" name="userid" id="userid" placeholder='ID를 입력해주세요.'>
                            <input type="password" name="userpw" id="userpw" placeholder='PW를 입력해주세요.'>
                        </div>
                        <div id='button'>
                        <input type="submit" value="로그인">
                        </div>
                    </div>
                    <div id='info'>
                        <input type="checkbox" name="save_check" value="Y" <%= !id.equals("")?"checked":""%>>아이디 저장하기<br>
                        <a href="">회원가입</a>
                        <a href="">ID찾기</a>
                        <a href="">PW찾기</a>
                    </div>
                    </form>
                   <%}%>
                </div>
                </aside>
</body>
</html>