<%@page import="common.JSFunction"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDAO dao = new BoardDAO();
	int result = dao.updateBoardDTO(title, content, num);
	
	if(result == 1) {
		JSFunction.alertLocation("수정 완료", "View.jsp?num=" + num, out);
	} else {
		JSFunction.alertBack("수정 실패", out);
	}
%>