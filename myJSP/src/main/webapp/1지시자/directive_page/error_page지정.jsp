<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    errorPage = "ErrorPage.jsp"
    trimDirectiveWhitespaces="false"%>
    <!-- ErrorPage : 오류가 발생 시 보여줄 페이지를 지정 -->
    <!-- trimDirectiveWhitespaces : 지시어로 생성된 불필요한 공백 제거 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//사용자의 요청을 담고 있는 객체
	int age = Integer.parseInt(request.getParameter("age"));
	//화면 출력	
	out.print("당신의 나이는"+age+"입니다.");
		
		
		
		
	%>
</body>
</html>
