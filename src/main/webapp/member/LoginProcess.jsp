<%@page import="common.JSFunction"%>
<%@page import="dto.MemberDTO"%>
<%@page import="dao.MemberDAO"%>
<%@page import="common.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("user_id");
	String pass = request.getParameter("user_pw");
	String save_check = request.getParameter("save_check");
	
	MemberDAO dao = new MemberDAO();
	MemberDTO member = dao.loginMember(id, pass);
	
	if(member.getId()!=null) {
		if(save_check != null && save_check.equals("Y")) {	
			CookieManager.makeCookie(response, "loginId", id, 86400);
		} else {			
			CookieManager.deleteCookie(response, "loginId");
		}
		session.setAttribute("UserId", member.getId());
		session.setAttribute("UserName", member.getName());
		response.sendRedirect("LoginForm.jsp");
	} else {
		JSFunction.alertLocation("아이디와 비밀번호를 확인해 주세요", "LoginForm.jsp", out);
	}
%>