<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  액션태그는 태그의 형태를 지니고 있어 소스의 이질감이 줄어들고
jsp코드보다 훨씬 짧은 코드로 동일 기능 구현 -->
	<jsp:useBean id="person" class="dto.Person" scope="request"></jsp:useBean>
	<jsp:getProperty property="name" name="person"/>
	<jsp:getProperty property="age" name="person"/>
	<h2>forward 된 페이지에서 매개변수 확인</h2>
	<%= request.getParameter("param1")%><br>
	<%= request.getParameter("param2")%><br>
	<%= request.getParameter("param3")%><br>
	
	<!-- 
		jps:include 액션태그를 이용해 다른페이지를 불러올때 
		jsp:param 액션태그를 이용 시 파라메터 전달 가능
	 -->
	 
	 <h2>jsp:include 페이지에 파라메터 넘기기</h2>
	 <jsp:include page="inc/ParamInclude.jsp">
	 	<jsp:param value="서로 구로구" name="Loc1"/>
	 	<jsp:param value="개봉동" name="Loc2"/>
</body>
</html>