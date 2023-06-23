package common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
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

	public static void alertBack(HttpServletResponse resp, String msg) {
		resp.setContentType("text/html;charset=utf-8");
		try {
			String script = "<script>"
							+ "alert('"+ msg +"')"
							+ "history.back();"
							+ "</script>";
			
			PrintWriter writer = resp.getWriter();
			writer.print(script);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void alertLocation(HttpServletResponse resp, String url, String msg) {
		resp.setContentType("text/html;charset=utf-8");
		try {
			String script = "<script>"
							+ "alert('"+ msg +"')"
							+ "location.href='"+url+"';"
							+ "</script>";
			
			PrintWriter writer = resp.getWriter();
			writer.print(script);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
