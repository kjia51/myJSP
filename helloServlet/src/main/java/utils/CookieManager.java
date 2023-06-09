package utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {

	public CookieManager() {
		// TODO Auto-generated constructor stub
	}
	// 쿠키이름 값 유지시간을 매개변수로 받아서 쿠키 생성
	// 쿠키를 생성 후 응답 객체에 담기
	public static void makeCookie(HttpServletResponse response, String cName, String cValue, int CTime) {
		// 쿠키생성
	 	Cookie cookie = new Cookie(cName,cValue);		
		// 경로설정
		cookie.setPath("/");
		// 유지기간 설정
		cookie.setMaxAge(CTime);
		// 응답객체에 추가
		response.addCookie(cookie);
	}
	
	// 매개변수로 쿠키이름을 받아서 쿠키를 찾고 반환
	public static String readCookie(HttpServletRequest request, String cName) {
		String cookieValue = "";
		Cookie[] cookies = request.getCookies();
		if(cookies!=null){
			for(Cookie cookie : cookies){
				if(cName.equals(cookie.getName())){
					cookieValue = cookie.getValue();
					break;
				}
			}
		}
		return cookieValue;
	}
	
	// 쿠키이름을 매개변수로 받아 삭제
	public static void deleteCookie(HttpServletResponse response, String cName) {
		makeCookie(response, cName, "", 0);
	}
}
