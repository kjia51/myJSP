<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
	TLD : JSP에서 사용되는 커스텀태그나 JSTL의 태그들에 대한 설정 파일
		  WEB-INF 하위에 위치 작성해야 인식 가능
	prefix : EL에서 사용할 접두어
	uri : tld 파일 경로
	 -->
	 
	<%@taglib prefix="mytag" uri="/WEB-INF/MyTagLib.tld" %>
	
	<h3>TLD 파일에 등록 후 정적 메서드 호출하기</h3>
	<ul>
		<li>${mytag:isNumber("100")}</li>
		<li>${mytag:isNumber("숫자백")}</li>
	</ul>
	
	<h3>TLD 파일에 등록 후 정적 메서드 호출하기</h3>
	<ul>
		<li>${mytag:makeCookie(response, "ELCookie", "EL좋아요", 10)}</li>

	</ul>
</body>
</html>