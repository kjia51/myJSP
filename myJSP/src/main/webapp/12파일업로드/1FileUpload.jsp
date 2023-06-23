<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function validateForm(form){
	if(form.name.value==''){
		alert('작성자를 입력하세요.');
		form.name.focus()
		return false;
	}
	if(form.title.value==''){
		alert('제목을 입력하세요.');
		form.title.focus()
		return false;
	}
	if(document.querySelectorAll("[name=cate]:checked").length==0){
		alert('카테고리를 선택하세요.');
		form.cate.focus()
		return false;		
	}
	if(form.attachedFile.value==''){
		alert('첨부파일을 선택하세요.');
		form.attachedFile.focus()
		return false;
	}
}
</script>

</head>
<body>
	<h3>파일 업로드</h3>
	<!-- 파일을 업로드 라이브러리(cos.jar) 추가 후 form 태그의 속성을 설정
		method : post
		enctype : multipart/form-data
	 -->
	 
	 <!-- 유효성 검사, validateion체크, 사용자입력  체크 로직 추가 -->
	<form action="UploadProcess.jsp" method="post" enctype="multipart/form-data" onsubmit="return validateForm(this);">

	<p>
		작성자 : <input type="text" name="name" value="하니">
	</p>
	<p>
		제목 : <input type="text" name="title" value="제목">
	</p>
	<p>
		카테고리 : 
		<input type="checkbox" name="cate" value="사진">사진
		<input type="checkbox" name="cate" value="음원">음원
		<input type="checkbox" name="cate" value="문서">문서

	</p>
	<p>
	첨부파일 : <input type="file" name="attachedFile" multiple="multiple"><br>
	</p>
	<input type="submit" value="전송하기">
	
	<!-- enctype : form 값을 서버로 전송할때의 인코딩 방식 지정
		- application/ x-www-form=urlencoded (기본값) : 모든 문자를 서버로 전송하기 전에 인코딩
		- multipart/form-data : form 태그를 통해 파일을 서버로 전송할때 사용 인코딩하지 않음
	 -->
	 
	 
	 <h3>다운로드</h3>
	 <a href="${pageContext.request.contextPath }/upload/activity.jpg" download="activity">다운로드</a>
	</form>
</body>
</html>