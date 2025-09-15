<%@page import="common.JSFunction"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("user_id");
	String pass = request.getParameter("user_pass");
	String nPass1 = request.getParameter("new_pass");
	String nPass2 = request.getParameter("new_pass_chk");
	MemberDAO dao = new MemberDAO();
	int result = dao.updatePass(id, pass, nPass1,nPass2);
	
	if(result == 1) {
		JSFunction.alertLocation("비밀번호 변경 완료", "Mypage.jsp", out);
	} else {
		JSFunction.alertBack("비밀번호 변경 실패", out);
	}
%>