<%@page import="dao.MemberDAO"%>
<%@page import="common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("user_id");
	String pass = request.getParameter("user_pw");
	String name = request.getParameter("user_name");
	
	MemberDAO dao = new MemberDAO();
	int result = dao.insertMemberDTO(id, pass, name);
	if(result == 1) {
		JSFunction.alertLocation("가입 완료", "LoginForm.jsp", out);
	} else {
		JSFunction.alertBack("가입 실패", out);
	}
%>