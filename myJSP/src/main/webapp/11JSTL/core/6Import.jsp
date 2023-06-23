<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 외부파일을 현재 위치에 삽입
	url : 외부파일 파일 경로
	scope : 영역
	var : 변수명 / 변수명을 사용하면 선언과 삽입분리
	
	외부파일에 매개변수 넣기
	-url의 쿼리스트링으로 전달
	-c:param 태그 이용 -->
	
	<c:import url="../../6세션/Link.jsp" var="link">
		<c:param name="param1" value="헤더영역"></c:param>
	</c:import>
	
	<h4>다른 문서 삽입하기</h4>
	 ${link}
	 
	 <h4>iframe을 이용한 외부자원 삽입하기</h4>
	 <iframe src="../inc/GoldPage.jsp" style="width:100%; height:100px"></iframe>
	 
	 <c:set var="iTag">
	 	i태그는 <i>기울임</i>을 표현합니다.
	 </c:set>
	 
	 <h4>EL 출력</h4>
	 ${iTag } 
	 <h4>out태그 기본사용</h4>
	 <c:out value="${iTag }"></c:out>
	 
	 <h4>escapeXml 속성</h4>
	 <!-- HTML 태그를 해석하여 마크업이 적용된 상태로 출력
	 <c:out value="${iTag }" escapeXml="false"/>
	 
	 <h4>default 속성</h4>
	 <c:out value="${param.name }" default="이름 없음"/>
	 <c:out value="${param.name }"/>
	 <c:out value="" default="빈 문자열도 값입니다"/>
	 
	 <h4>redirect</h4>
	 
	 <%-- 리퀘스트 영역의 공유 여부로 forward와 request 의 차이를 보면 될 듯  >
	 <c:set var="requestVar" value="리퀘스트 영역" scope="request"></c:set>
	 <c:redirect url="/12JSTL/inc/OtherPage.jsp">
	 	<c:param name="requestVar" value="${requestVar }"></c:param>
	 	<c:param name="user_param1" value="꺄"></c:param>
	 	<c:param name="user_param2" value="호"></c:param>
	 < /c:redirect -->
	 --%>
	 <h4>url태그를 이용해서 링크 걸기</h4>
	 <!-- 
	 c: url 지정한 경로와 매개변수를 이용해서 컨텍스트 루트를 포함한 URL 생성
	 a태그의 href 속성이나 form 태그의 action 속성에 이용
	 value : 경로 / var: 변수명 
	 -->
	 <a href="/12JSTL/inc/OtherPage.jsp">페이지 바로가기</a><br>
	 <c:url value="/12JSTL/inc/OtherPage.jsp" var="url"></c:url>
	 <a href="${url}" }>url 태그를 이용한 바로가기</a>
	 
</body>
</html>