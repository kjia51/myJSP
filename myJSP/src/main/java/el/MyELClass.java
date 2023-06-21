package el;

import java.util.Iterator;

import org.eclipse.jdt.internal.compiler.batch.Main;

public class MyELClass {

	public MyELClass() {
		// TODO Auto-generated constructor stub
	}
	
	// 주민번호를 입력받아 성별을 반환하는 메서드
	public String getGender(String jumin) {
		String res="";
		try {
			int startIndex = jumin.indexOf("-")+1;
			int endIndex = startIndex+1;
			String gender = jumin.substring(startIndex, endIndex);
			if("1".equals(gender) || "3".equals(gender)) {
			 res = "남자";
			} else if("2".equals(gender) || "4".equals(gender)) {
				res ="여자";
			} else {
				//예외를 발생
				throw new Exception();
			}
			
		} catch (Exception e) {
			System.out.println("주민번호를 다시 입력하세요");
			// TODO: handle exception
		}
		return res;
	}
	
	// 입력받은 문자열이 숫자인지 판별하는 정적메서드
	public static boolean isNumber(String value) {
		/*if(Integer.valueOf(value)!=null) {
			return true;
		}
		return false;
		}*/
		char[] chArr = value.toCharArray();
		for (int i = 0; i <chArr.length; i++){
			//문자가 포함되어 있으면 return false;
			//System.out.print(charr[1])
			if(!(chArr[i] >='0' && chArr[i]<'9')) {
				return false;
			} else {
			}
		}
		return true;
	}
	
	// 입력 받은 정수까지 구구단을 HTML테이블로 출력하는 정적메서드
	// 1~input단까지 출력
	public static String showGugudan(int limitDan) {
		StringBuffer sb = new StringBuffer();
		sb.append("<table border=1>");
		for(int dan=2; dan<=limitDan;dan++) {
			sb.append("<tr>");
			for(int i=1; i<=9; i++) {
				sb.append("<td>");
				sb.append(dan+"*"+i+"="+(dan*i));
				sb.append("</td>");
			}
			sb.append("</tr>");
		}
		sb.append("</table>");
		return sb.toString();
	}
	
	public static void main(String[] args) {
		MyELClass el = new MyELClass();
		System.out.println(el.getGender("001125-100000"));
		el.showGugudan(7);
		System.out.println(el.isNumber("123"));
		String str = "1234";
		System.out.println(el.showGugudan(5));
		
		

	}
}
