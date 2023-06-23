<%@page import="java.awt.geom.Path2D"%>
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
/*
	표현언어 EL
	변수의 값을 출력할때 사용하는 스크립트 언어
	4가지 영역에 저장된 값을 출력
	서블릿에서 처리된 결과는 영역을 통해 전달되고 표현언어로 접근하여 쉽게 출력할 수 있음
	JSP 내장객체의 영역에 담긴 속성 사용
	산술연산, 논리연산, 비교연산이 가능/ 자바 메서드를 호출할 수 있음
	기본 사용법  ${영역.속성}
	페이지 영역 : pageScope
	요청영역 : requestScope
	세션영역 : sessionScope
	어플리케이션영역 : applicationScope
	param.매개변수 / param["매개변수명"] / param['매개변수명']
			-> 한글이나 특수문자가 입력된 경우 대괄호 사용
*/

%>

<%
	pageContext.setAttribute("scopeValue", "페이지 영역");
	request.setAttribute("scopeValue", "리퀘스트 영역");
	session.setAttribute("scopeValue", "세션영역");
	application.setAttribute("scopeValue", "어플리케이션 영역");
%>
<h2>각 영역에 저장된 속성읽기</h2>
<ul>
	<li>페이지 영역 :
		${pageScope.scopeValue}
	</li>
	<li>리퀘스트 영역 :
		${requestScope.scopeValue}
	</li>
	<li>세션 영역 :
		${sessionScope.scopeValue}
	</li>
	<li>어플리케이션 영역 :
		${applicationScope.scopeValue}
	</li>	
</ul>
<h2>영역 지정없이 속성 읽기</h2>
<ul>
<li>${scopeValue}</li>
</ul>
<!-- 기존 출력은 무시되고 페이지를 이동합니다. 
foward 발생 시 page영역은 공유가 되지 않음 null 표시대신 빈칸으로 표시  -->

<jsp:forward page="1ImplicitForwardResult.jsp"></jsp:forward>
</body>
</html>