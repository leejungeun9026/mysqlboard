<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="dto.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
Map<String, String> search = new HashMap<String, String>();
search.put("searchField", searchField);
search.put("searchWord", searchWord);

BoardDAO dao = new BoardDAO();
ArrayList<BoardDTO> list = dao.selectBoard(search);
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
			<td align="center">
				<form method="get">
					<select name="searchField">
						<option value="all" 
							${ param.searchField eq "all" ? "selected" : "" }>제목+내용</option>
						<option value="title"
							${ param.searchField eq "title" ? "selected" : "" }>제목</option>
						<option value="content"
							${ param.searchField eq "content" ? "selected" : "" }>내용</option>
						<option value="num"
							${ param.searchField eq "num" ? "selected" : "" }>글번호</option>
						<option value="userid"
							${ param.searchField eq "userid" ? "selected" : "" }>아이디</option>
						<option value="username"
							${ param.searchField eq "username" ? "selected" : "" }>작성자</option>
					</select> <input type="text" name="searchWord" value="${ param.searchWord }">
					<input type="submit" value="검색">
				</form>
			</td>
		</tr>
	</table>
	<table border="1" width="90%">
		<tr>
			<th width="10%">번호</th>
			<th width="40%">제목</th>
			<th width="20%">작성자</th>
			<th width="20%">날짜</th>
			<th width="10%">조회수</th>
		</tr>
		<c:set var="list" value="<%= list %>" />
		<c:if test="${ empty list }">
			<tr>
				<td colspan="5" align="center">게시물이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="board" items="<%= list %>">
			<tr>
				<td>${ board.num }</td>
				<td><a href="View.jsp?num=${ board.num }">${ board.title }</a></td>
				<td>${ board.id }(${ board.name })</td>
				<td><fmt:formatDate value="${ board.postdate }"  pattern="yyyy-MM-dd hh:mm:ss"/></td>
				<td>${ board.visitcount }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>