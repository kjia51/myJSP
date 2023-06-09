<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/gogreen.css">

    

</head>
<body> 
    <div class="wrap">
<%@ include file="header.jsp" %>
        
        <main>
            <aside id='leftside'>

            </aside>
            <div id='maincontent'>
                <ul>
                    <li><img src="images/main_img1.jpg" alt="">나무를 심는 사람들</li>
                    <li><img src="images/main_img2.jpg" alt="">아이들에게 녹색 미래를..</li>
                    <li><img src="images/main_img3.jpg" alt="">설악산을 사리는 길</li>
                    <li><img src="images/main_img4.jpg" alt="">사라지는 북극곰들</li>
                </ul>
            </div>
                <!-- 로그인 실패시 메세지 처리
                로그인 성공 시 박스를 보여주지 않음  -->
            <aside id='rightside'>
                <div class='side1'>
                
   	            <%
	  	     	// 쿠키에 저장된 아이디가 있다면 아이디를 텍스트 필드에 value값을으로 출력
           		String id = CookieManager.readCookie(request, "userid");
                   
	  	     	
	  	     	String loginErr = request.getParameter("loginErr");
			    if("Y".equals(loginErr)){
			    	out.print("<script>alert('아이디/비밀번호를 확인해주세요')</script>");
			    }
			    %>
                <%
					    //String name = request.getParameter("name");
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
				
                <form action="./ResponseLogin.jsp" method="post">
                    <div class='loginbox'>
                        <div id='login'>
                            <input type="text" name="userid" id="userid" placeholder='ID를 입력해주세요.' value="<%=id%>">
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

                <div class='side2'>
                    <img src="images/right_img.jpg" alt="">
                </div>

                <div class='side3'>
                    <img src="images/me_chat.jpg" alt="">
                </div>
            </aside>
        </main>        
		<%@ include file="footer.jsp" %>
    </div>
</body>
</html>