<%@page import="dto.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 - UseBean</title>
</head>
<body>
	<h2>userBean 태그</h2>
	<h3>자바빈스 생성하기</h3>
	
	<!-- 
	id : 자바빈즈
	class : 패키지명을 포함한 클래스명
	scope : 저장될 영역
	 
	 dto 패키지의 Person객체를 생성 후 request 영역에 저장
	 액션태그를 이용해서 자바빈을 생성 시 기본 생성자 이용
	값을 세팅하기 위해서는 jsp:setPorperty태그를 이용
	 -->
	
	<jsp:useBean id="Person" class="dto.Person" scope="request"></jsp:useBean>
	
	<h3>setProperty 액션 태그로 자바빈스 속성 지정 하기 </h3>
	
	<!-- 
		name : 자바빈즈 이름
		property : 필드명
		value : 필드값
	 -->
	<jsp:setProperty property="name" name="person" value="하니"/>
	<jsp:setProperty property="age" name="person" value="20"/>

	<h3>getProperty 액션 태그로 자바빈스 속성 읽기 </h3>
	<ul>
	<li>이름 : <jsp:getProperty property="name" name="person"/></li>
	<li>나이  :<jsp:getProperty property="name" name="age"/></li>
	</ul>

	<h3>request 객체를 이용하여 자바빈즈 속성읽기</h3>
	<%
		Person p = (Person)request.getAttribute("person");
	%>
	이름 : <%=p.getName() %><br>
	나이 : <%=p.getAge() %>
</body>
</html>