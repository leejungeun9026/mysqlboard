<%@page import="dao.BoardDAO"%>
<%@page import="dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
int num = Integer.parseInt(request.getParameter("num"));
BoardDAO dao = new BoardDAO();
dao.visitCount(num);
BoardDTO board = dao.selectOne(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
	<jsp:include page="/inc/Header.jsp" />
	<c:set var="board" value="<%= board %>" />
	<h2>글 보기</h2>
	<table border="1" width="90%">
		<tr>
			<td width="10%">번호</td>
			<td width="40%">${ board.num }</td>
			<td width="10%">작성자</td>
			<td width="40%">${ board.id }(${ board.name })</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${ board.num }</td>
			<td>조회수</td>
			<td>${ board.visitcount }</td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3"><b>${ board.title }</b></td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3" style="height: 50px;">${ board.content }</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<c:if test="${ not(empty UserId) and UserId eq board.id }">
					<button type="button"
						onclick="location.href='Modify.jsp?num=${ board.num }'">수정하기</button>
					<button type="button"
						onclick="location.href='Remove.jsp?num=${ board.num }'">삭제하기</button>
				</c:if>
				<button type="button" onclick="location.href='List.jsp'">목록으로</button>
			</td>
		</tr>
	</table>
</body>
</html>