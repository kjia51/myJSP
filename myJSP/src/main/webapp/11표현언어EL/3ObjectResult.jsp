<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>영역을 통해 전달된 객체 읽기</h2>
	<%
	/* 표현언어EL을 이용하면 형변환이 필요없이 파라메터를 읽어올 수 있씁니다
	   별도의 NULL 처리를 하지 않아도 됨 현재 페이지 리로드 시 오류 발생 안함
	   객체 사용시 IMPORT 만 해주면 됨
	*/
	%>
	<ul>
		<li>Person 객체
			<p>아이디 : ${personObj.id}, 이름 : ${personObj.name}</p>
		</li>
		<li>String 객체
			<p>${stringObj}</p>
		</li>
		<li>Integer 객체
			<p>${integerObj}</p>
		</li>
	</ul>
	
	<h2>매개변수로 전달된 값</h2>
	<ul>
	<li>${param.firstNum}, ${param.secondNum}</li>
	<!-- 중괄호 안에서 연산 가능 -->
	<li>${param.firstNum + param.secondNum}</li>
	<li>${param.firstNum} + ${param.secondNum}</li>
	<li>${param['firstNum']} </li>
	<li>${param["secondNum"]} </li>
	
	
	</ul>
</body>
</html>