<%@page import="common.JSFunction"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDAO dao = new BoardDAO();
	int result = dao.deleteBoardDTO(num);
	
	if(result == 1) {
		JSFunction.alertLocation("삭제 완료", "List.jsp", out);
	} else {
		JSFunction.alertBack("삭제 실패", out);
	}
%>