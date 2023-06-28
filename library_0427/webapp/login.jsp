<%@page import="com.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="css/style.css">

</head>
<body>
<aside id='rightside'>
<div class='side1'>
	<form action="./login/LoginAction.do" method="post">
		<%
			String error = request.getParameter("error");
			if(error != null 
					 && "Y".equals(error)) {
				out.print("아이디 비밀번호를 확인해주세요!!");
			}
			String userId = CookieManager.readCookie(request, "userId");
		%>
	  
	    <div class='loginbox'>
	        <div id='login'>
	            <input type="text" name="userid" id="userpw" 
	            		placeholder='ID를 입력해주세요.' value="admin"> <%--=userId%--%>
	            <input type="password" name="userpw" id="userpw" placeholder='PW를 입력해주세요.' value="1234">
	        </div>
	        <div id='button'>
	        <input type="submit" value="로그인">
	        </div>
	    </div>
	    <div id='info'>
	    	<input type="checkbox" name="saveCheck" value="Y"
	    			<%=!("").equals(userId) ? "checked" : "" %>>
	    	아이디 저장하기<br> 
	        <a href="">회원가입</a>
	        <a href="">ID찾기</a>
	        <a href="">PW찾기</a>
	    </div>
	    
	</form>
</div>
</aside>
                
</body>
</html>