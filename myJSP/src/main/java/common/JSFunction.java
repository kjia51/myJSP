package common;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;

public class JSFunction {

	public JSFunction() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * 알림창을 띄운 후 명시한 URL로 이동
	 * @param msg
	 * @param url
	 * @param out
	 */
	public static void alertLocation(String msg, String url, JspWriter out) {
		try {
		String script = ""
						+ "<script>"
						+ "alert('"+msg+"');"
						+ "location.href='"+url+"';"
						+ "</script>";
			out.print(script);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}
	/**
	 * 알림창을 띄운 후 이전페이지로 이동
	 * @param msg
	 * @param url
	 * @param out
	 */
	public static void alertBack(String msg, JspWriter out) {
		try {
		String script = ""
				+ "<script>"
				+ "alert('"+msg+"');"
				+ "history.go(-1);"
				+ "</script>";
			out.print(script);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
