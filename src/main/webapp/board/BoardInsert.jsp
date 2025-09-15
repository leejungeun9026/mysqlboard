<%@page import="common.JSFunction"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
BoardDAO dao = new BoardDAO();
String title = request.getParameter("title");
String content = request.getParameter("content");
String id = request.getParameter("id");
int result = dao.insertBoardDTO(title, content, id);

if (result == 1) {
	JSFunction.alertLocation("등록 완료", "List.jsp", out);
} else {
	JSFunction.alertBack("등록 실패", out);
}
