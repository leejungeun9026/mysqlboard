<%@page import="dto.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
BoardDAO dao = new BoardDAO();
ArrayList<BoardDTO> list = dao.selectBoard();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
	<jsp:include page="/inc/Header.jsp" />
	<h2>게시판 목록</h2>
	<table border="1" width="90%">
		<tr>
			<th width="10%">번호</th>
			<th width="40%">제목</th>
			<th width="20%">작성자</th>
			<th width="20%">날짜</th>
			<th width="10%">조회수</th>
		</tr>
<%
if (list == null) {
%>
		<tr>
			<td colspan="5">게시물이 없습니다.</td>
		</tr>
<%
} else {
	for (BoardDTO b : list) {
%>
		<tr>
			<td><%= b.getNum() %></td>
			<td><a href="View.jsp?num=<%= b.getNum() %>"><%= b.getTitle() %></a></td>
			<td><%= b.getId() %>(<%= b.getName() %>)</td>
			<td><%= b.getPostdate() %></td>
			<td><%= b.getVisitcount() %></td>
		</tr>
<%
	}
}
%>
	</table>
</body>
</html>