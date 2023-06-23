<%@page import="common.JSFunction"%>
<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="fileupload.FileDto"%>
<%@page import="fileupload.FileDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
		// 저장할 디렉터리의 실제 경로
		String saveDirectory = "C:/upload";
		// webapp 폴더 하위에 디렉토리 생성
	    //saveDirectory = "C:/Users/user/git/myJSP/myJSP/src/main/webapp/upload";
		
		
		
		//파일의 최대 크기
		int maxPostSize = 2000*1000;
		
		//인코딩 방식
		String encoding = "utf-8";
		
		try{
			// 1. MultipartRequest 객체 생성
			// 생성자의 매개변수로 저장경로, 파일 최대크기, 인코딩방식 지정
			// 객체가 정상적으로 생성되면 파일 업로드
			
			MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
			
			
			//2. 새로운 파일명 생성
			// 동일한 파일명이 업로드 되는 경우, 기존 파일 소실의 위험으로 파일명 변경
			String fileName = mr.getFilesystemName("attachedFile");
			System.out.println("fileName : "+fileName);

			// 첨부파일의 확장자
			String ext = fileName.substring(0, fileName.lastIndexOf("."));
			System.out.println("ext : "+ext);
			
			//H : 0~23 S: millisecond
			// 현재시간을 파일이름으로 지정

			String now = new SimpleDateFormat("yyyyMMd_HmsS").format(new Date());
			System.out.println("now : "+now);
			String oFileName = fileName.substring(0, fileName.lastIndexOf("."));
			System.out.println("oFileName : "+oFileName);
			
			String newFileName = oFileName + "_" +  now + ext;
			System.out.println("원본: " + fileName);
			System.out.println("신규: " + newFileName);

			//3. 파일명 변경
			File oldFile = new File(saveDirectory + File.separator + fileName);
			File newFile = new File(saveDirectory + File.separator + newFileName);
			System.out.println("oldFile : " + oldFile);
			System.out.println("newFile : " + newFile);
			oldFile.renameTo(newFile);
			// 폼 요소의 값을 저장
			String[] cateArr = mr.getParameterValues("cate");
			StringBuffer sb = new StringBuffer();
			
			if(cateArr == null){
				sb.append("선택없음");
			} else{
			for(String cate :cateArr){
				sb.append(cate);		
			}				
			}
			
			//파일목록 페이지로 이동
			String name = mr.getParameter("name");
			String title = mr.getParameter("title");
			String cate = mr.getParameter("cate");
			String ofileName = mr.getFilesystemName("attachedFile");
			
			System.out.println(name);
			System.out.println(title);
			System.out.println(sb.toString());
			System.out.println(ofileName);
			
			FileDto dto = new FileDto("", name, title, cate, fileName, newFileName , "");
			FileDao dao = new FileDao();
			int res = dao.insertFile(dto);
			System.out.println(res);
			if(res>0){
				//out.print("등록 완");
				//리스트 페이지 이동
				JSFunction.alertLocation("등록완료", "FileList.jsp", out);
			} else{
				//out.print("DB등록에 실패했습니다");				
				// 이전페이지 이동
				JSFunction.alertBack("등록 실패", out);
			}
			
		} catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMessage", "파일 업로드 오류");
		}
		
	%>
</body>
</html>