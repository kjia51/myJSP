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
		int num1=3;
		pageContext.setAttribute("num2", 4);
		pageContext.setAttribute("num3", "5");
		pageContext.setAttribute("num4", "8");
	%>
	<h3>변수 선언 및 할당</h3>
	<!-- num1은 4개의 영역에 저장되지 않았으므로 출력되지 않음 -->
		<p>스클립틀릿에서 선언한 변수 : ${num1} </p>
		<p>페이지 영역에 저장된 변수 : ${num2}</p>
	<!-- 3.0 버전부터 대입 연산자(=) 사용하여 값 대입할 수 있다 -->
	<!-- 값을 대입 후 출력 -->
	<p>변수 할당 및 즉시 출력 : ${num1= 7}</p>
	
	<!-- 값을 대입하고 출력하지 않음 -->
	<p>변수 할당 및 별도 출력: ${num2=8; ''}=>${num2}</p>
	num1=${num1 }, num2=${num2 }, num3=${num3 }, num4=${num4}
	
	<h3>산술 연산자</h3>
	num1+num2=${num1+num2 }<br>
	num1-num2=${num1-num2 }<br>
	num1*num2=${num1*num2 }<br>
	num1/num2=${num1/num2 }<br>
	<!-- 표현언어(el)을 이용하면 산술연산시 자동 숫자 변환 -->
	<!-- div : 나누기(문자 형태의 연산자) -->
	num3/num4=${num3/num4 }<br>
	num3 div num4 : ${num3 div num4 }	<br>	
	<!-- mod : 나머지(문자 형태의 연산자) -->
	num3 % num4 : ${num3 % num4} <br>
	num3 mod num4 : ${num3 mod num4 }		
	
	<h3>+연산자는 덧셈만 가능</h3>
	<!-- 숫자의 연산만 가능! -->
	num1 + "34" : ${num1+"34"} <br>
	num2 + "이십" : \${num2+"이십"} <br>
	
	<h3>비교연산자</h3>
	<!-- 문자 형태의 연산자 -->
	num4 > num3 : ${num4 gt num3 }<br />
	num1 < num3 : ${num4 lt num3 }<br />
	num2 >= num4 : ${num4 ge num3 }<br />
	<!-- 문자형태의 연산자를 사용해서 코드를 좀 더 직관적으로 작성할 수 있다. -->
	num4 == num1 : ${num4 eq num3 }
	
	<h3>논리 연산자</h3>
	num3 <= num4 && num3 ==num4 : ${num3 <= num4 && num3 ==num4} <br /> 
	num3 >= num4 || num3 !=num4 : ${num3 >= num4 || num3 !=num4} 
</body>
</html>