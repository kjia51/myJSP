<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 - forward</title>
</head>
<body>
	<h2>액션태그를 이용한 포워딩</h2>
	<!-- 새로운 페이지로 forward
	page 영역은 공유되지 않고
	request 영역은 공유됩니다.
	 -->
	 
	<%
		pageContext.setAttribute("pAttr", "페이지영역");
	 	request.setAttribute("rAttr", "요청영역");
	%>
	<jsp:forward page="ForwardSub2.jsp">
		<jsp:param value="<%=(String)pageContext.getAttribute("pAttr")%>" name="pAttr"/>
	</jsp:forward>
</body>
</html>