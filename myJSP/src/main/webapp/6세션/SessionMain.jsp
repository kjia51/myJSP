<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
		세션의 유지기간
		유지시간을 설정하지 않으면 기본 30분(1800초)이며,
		유지시간이 만료되기전 새로운 요청이 들어오면 유지시간이 연장됩니다
		
		클라이언트가 유지 시간 내 요청이 없는 경우 해당 세션은 서버에서 제거
		
		클라이언트에서 JSESSION 쿠키를 제거할 경우 세션 아이디도 함께 제거되므로 서버는 새로운 세션 아이디 발급
		 
		 web.xml : 유지시간을 분 단위로 설정/ 설정 후 웹 브라우저를 닫았다가 다시 열어야 확인 가능
		 session.setMaxInactiveInterval()  : 유지시간 초 단위로 설정
		 -->
<%

	session.setMaxInactiveInterval(10);
	SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss"); // 날짜 표시 
	long creationTime = session.getCreationTime(); // 최초 요청시각
	String creationTimeStr = sdf.format(new Date(creationTime));
	
	//마지막 요청 시각
	long lastTime = session.getLastAccessedTime();
	String lastTimeStr = sdf.format(new Date(lastTime));
%>

	<h2>Session 설정 확인</h2>
	<ul>
		<li>최초 요청 시각: <%=creationTimeStr%></li>
		<li>마지막 요청 시각 : <%=lastTimeStr %></li>
		<li>세션아이디 : <%=session.getId() %></li>
		<li>세션 유지 시간 : <%=session.getMaxInactiveInterval() %></li>
</ul>


</body>
</html>