<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="dto.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
		// 리스트 생성 (object로 지정 -> 어떤 타입이든지 저장 가능)
		List<Object> aList = new ArrayList<Object>();
		aList.add("청해진");
		aList.add(new Member("test","","하니","2023-06-19"));
		
		//페이지 영역에 리스트 객체 저장
		pageContext.setAttribute("aList", aList);
	%>
	<h2>List 컬렉션</h2>
	<ul>
		<li>0번째 요소
		<!-- 영역을 지정하지 않았지만 페이지 영역에 저장된 aList의 값이 출력 -->
			<p>${aList[0]}</p>
		</li>
		<li>1번째 요소
		<!-- 객체의 주소값 -->
			<p>${aList[1]}</p>
			<p>${aList[1].id}</p>
			<p>${aList[1].name}</p>
			<p>${aList[1].regidate}</p>
		</li>
		<li>2번째 요소
		<!-- 예외가 발생하지 않고 출력되지 않음 -->
			<p>${aList[2]}</p>
		</li>
	</ul>
	
	<h2>Map 컬렉션</h2>
	<%
		Map<String, String> map = new HashMap<String, String>();
		// key, value
		map.put("한글", "훈민정음");
		map.put("Eng", "English");
		
		pageContext.setAttribute("map", map);
		
	%>
	<!-- map은 키값으로 접근 -->
	<ul>
		<li>
		<p> 한글 : ${map['한글']}</p>
		<p>한글 : <%=map.get("한글") %></p>
		<p>주석처리 : \${map.한글} (.으로 접근불가)</p>
		</li>
		<li>
		<p>Eng : 	${map['Eng']}
		</p>
		</li>
	</ul>
</body>
</html>