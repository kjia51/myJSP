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
	// response 내장 객체로부터 에러코드를 확인
	int status = response.getStatus();
		// 에러코드에 맞게 적절한 메세지를 출력
		if(status==404){
			out.print("ERROR CODE : 404 <br>");
			out.print("파일경로 확인");
		} else if(status==405){
			out.print("ERROR CODE : 405 <br>");
			out.print("요청방식(method) 확인");
		} else if(status==500){
			out.print("ERROR CODE : 500 <br>");
			out.print("관리자 확인");
		}
%>
</body>
</html>