<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>1. 클라리언트와 서버의 환경정보 읽기</h2>
	<!-- method를 지정하지 않은 경우는 모두 get 방식으로 호출 
	아무런 설정을 하지 않으면 기본 방식이 get-->
	
	<!-- 404 : 페이지를 찾을 수 없음
	서버에 파일이 없는 경우, 또는 경로가 일치하지 않는 경우
	URL경로를 확인해봥함!! 
	
	url로 호출 : 무조건 get 방식으로 호출
	<url>
	http			: 프로토콜 = 통신규약
	www.naver.com 	: 도메인(ip,port) 웹 서버를 찾아갑니다 - > 톰켓 was 서버 
	경로 				: 파일 경로, 매핑정보
	web server 와 was 서버 차이 : 동적 정적 차이
	
	-->
	
	<a href='requestWebInfo.jsp?eng=hello&han=안녕'>Get방식요청!</a><br>
	
	<h2>2. 클라이언트의 요청 매개변수 읽기</h2>
	<form action="requestWebInfo.jsp" method="post">
		영어 : <input type="text" name= "eng" value="bye"><br> 
		한글 : <input type="text" name= "han" value="잘가"><br> 
			  <input type="submit" value="post전송"><br><br>
	</form>
	<form method="post" action="requestParameter.jsp">
		아이디 : <input type="text" name='id' required><br> 
		성별 :  <input type="radio" name='gender' value='M'>남자
              <input type="radio" name='gender' value='F'>여자<br> 
        관심사항 : 
              <input type="checkbox" name ='hobby' value='공부'> 공부
              <input type="checkbox" name ='hobby' value='등산'> 등산
              <input type="checkbox" name ='hobby' value='게임'> 게임
              <input type="checkbox" name ='hobby' value='낚시'> 낚시
              <input type="checkbox" name ='hobby' value='쇼핑' > 쇼핑<br> 
        자기소개 : <br>
        	<textarea cols='60' rows='6' name='intro'>자기소개를 100자 이내로 입력하세요</textarea><br>  
			<input type="submit" value="post전송"><br><br>	
	</form>
	
	<h2>3. HTTP 요청 헤더 정보 읽기</h2>
	<a href="RequestHeader.jsp">요청 헤더정보 읽기</a>
	
	
	
	
	
	
	
	
</body>
</html>