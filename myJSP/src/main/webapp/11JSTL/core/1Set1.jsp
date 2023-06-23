
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Member"%>
<%@page import="java.util.Date"%>
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
jstl : 스클립틀릿 대신 태그 사용하여 제어문 , 반복문 사용
확장태그이므로 별도의 라이브러리 사용 (메이븐리파지토리로 접근하여 jstl-1.2.jar파일 다운 후 lib에 추가)

jstl 종류 
	core 태그 : 변수 선언, 조건문/반복문, url 처리
	접두어 : c
	
	formatting 태그 : 숫자, 날짜, 시간 포맷 지정
	접두어 : fmt
	
	1.라이브러리 추가
	2.taglib 지시어 추가
 -->
 
 	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 
	<core 태그>
	set 변수선언 / remove 변수제거
	if 단일조건문 / choose 다중 조건문 / forEach 반복문
	forTokens 구분자로 분리된 토큰 처리
	import 외부 파일 삽입 / redirect 지정한 겨오로 이동
	url 경로 설정 / out 내용 출력 / catch 예외 처리
 -->
 
<!-- 
	1. 변수 선언
		var : 변수명
		value : 값
		scope : 저장 영역
 -->
  
  <c:set var="directVar" value="100"/>
  <c:set var="elVal" value="${directVar mod 5 }"/>
  <c:set var="expVal" value="<%=new Date()%>"/>
  <c:set var="betweenVar">변수값 설정</c:set>
  
  <h4>EL을 이용해 변수 출력</h4>
  	<ul>
  		<li>directVar : ${pageScope.directVar}</li>
  		<li>elVal : ${elVal}</li>
  		<li>expVal : ${expVal}</li>
  		<li>betweenVar : ${betweenVar}</li>
  	</ul>
  	
  <h4>자바빈즈 생성1 - 생성자 사용</h4>
  <c:set var="personVal1" value='<%=new Member("id","","하니","2023-06-20") %>' scope="request"/>
  <ul>
  	<li>${personVal1.id }</li>
  	<li>${personVal1.pass }</li>
  	<li>${personVal1.name }</li>
  	<li>${personVal1.regidate }</li>
  </ul>
  
  <h3>자바빈즈 생성 후 값을 변경하기</h3>
  <h4>자바빈즈 생성2 - target, property 사용</h4>
	<!-- 
	target : 자바빈즈 변수명
	property : 자바빈즈 속성명(멤버 변수명)
	value 값 지정
	 -->  
  <c:set var="personVal2" value='<%=new Member("hani","","하니","2023-06-20") %>' scope="request"/>
  
    <ul>
	  	<li>변경 전 이름 : ${personVal2.name }</li>
	  	<li>변경 전 아이디 : ${requestScope.personVal2.id }</li>
  	</ul>
  
  <c:set target="${personVal2}" property="id" value="hanigood"></c:set>
  <c:set target="${personVal2}" property="name" value="허니"></c:set>
    <ul>
	  	<li>변경 후 이름 : ${personVal2.name }</li>
	  	<li>변경 후 아이디 : ${requestScope.personVal2.id }</li>
  	</ul>
  	
  <h4>List 컬렉션 이용하기</h4>
  <%
  	ArrayList<Member> list = new ArrayList<Member>();
  	list.add(new Member("hani","","하니",""));
  	list.add(new Member("nani","","나니",""));
  %>
  <c:set var="pList" value="<%=list%>" scope="request"/>
  <ul>
  	<li>이름 : ${pList[0].name}</li>
  	<li>아이디 : ${requestScope.pList[0].id}</li>
  	<li>이름 : ${pList[1].name}</li>
  	<li>아이디 : ${requestScope.pList[1].id}</li>
  </ul>
  
   <h4>Map 컬렉션 이용하기</h4>
  <%
  	Map<String, Member> map = new HashMap<String, Member>();
  	map.put("pArgs1", new Member("1","","일번",""));
  	map.put("pArgs2", new Member("2","","이번",""));
  %>
   <c:set var="map" value="<%=map%>" scope="request"/>

    <ul>
  	<li>이름 : ${map.pArgs1.name}</li>
  	<li>아이디 : ${requestScope.map.pArgs1.id}</li>
  	<li>이름 : ${map.pArgs2.name}</li>
  	<li>아이디 : ${requestScope.map.pArgs2.id}</li>
 	 </ul>
  
</body>
</html>