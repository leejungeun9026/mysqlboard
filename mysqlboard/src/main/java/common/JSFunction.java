package common;

import jakarta.servlet.jsp.JspWriter;

public class JSFunction {
	// 알림창 생성 및 url 이동
	public static void alertLocation(String msg, String url, JspWriter out) {
		try {
			String script = "" + "<script>" + "	alert('" + msg + "');" + "	location.href='" + url + "';" + "</script>";
			out.println(script); // 스크립트 실행
		} catch (Exception e) {
		}
	}

	// 알림창 생성 및 뒤로 이동
	public static void alertBack(String msg, JspWriter out) {
		try {
			String script = "" + "<script>" + "	alert('" + msg + "');" + "	history.back();" + "</script>";
			out.println(script); // 스크립트 실행
		} catch (Exception e) {
		}
	}
}
