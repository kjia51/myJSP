<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage = "ErrorPage.jsp"%>
<%@ page buffer="1kb" autoFlush="true" %>

<!-- 버퍼오버플로우 해결방법 1.버퍼를 충분히 크게 지정 2.autoFlush를 true로 변환 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 
버퍼
		응답 결과를 웹 브라주저로 즉시 연장하지 않고,
		출력할 내용을 버터에 저장해두었다가 일정량이 차면 클라이언트로 전송
		(CPU나 메모리에 비해 IO(입출력) 속도가 느리므로 응답결과를 버퍼에 저장해두었다가 전송
		buffer="none" 으로 지정시 포워드 에러페이지 등의 기능을 사용 못함
		크기를 줄일경우 JSP의 기능을 온전히 사용하지 못하므로 값을 변경하는 경우가 많음
버퍼를 사용하는 이유 
	- 성능향상
	- JSP 실행도중 버퍼를 비우고 새로운 내용을 전송 가능
	- 버퍼가 다 차기 전에, 응답 헤더를 변경 가능
	
autoFlush
	true : 버퍼가 차면, 자동전송
	false : 버퍼가 차면, 예외 Exception발생으로 실행 중지
 -->
 
 <%
 	for(int i=0; i<100; i++){
 		out.println("abcde12345");
 	}
 		out.println(out.getBufferSize());
 		out.println(out.isAutoFlush());
 %>
</body>
</html>