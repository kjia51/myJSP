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
jsp  include : 외부파일 현재 파일에 포함
	 forward : 다른페이지로 요청 넘김
	 param : 매개변수 전달!
 -->
 
 <%
 pageContext.setAttribute("pAttr", "동명왕");
 request.setAttribute("rAttr", "온조왕");
 %>
 
 <h2>지시어와 액션태그 동작방식 비교</h2>
 
 <h3>지시어 방식</h3>
 <%@include file="inc/OuterPage1.jsp" %>
 <p>외부파일에 선언한 변수 : <%=newVar1 %></p>
 <h3>액션태그 방식</h3>
 <!-- 페이지 영역이 공유되지 않고 외부 파일에서 생성된 변수가 공유되지 않음
  -->
 <jsp:include page="inc/OuterPage2.jsp"/>
  <p>외부파일에 선언한 변수 : <%--=newVar2 --%></p>
</body>
</html>