<%@page import="common.JSFunction"%>
<%@page import="dto.BoardDTO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
BoardDAO dao = new BoardDAO();
BoardDTO board = dao.selectOne(Integer.parseInt(request.getParameter("num")));
%>
<c:if test="${ empty UserId }">
	<%
	JSFunction.alertBack("글 작성자만 수정 가능합니다.", out);
	%>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/inc/Header.jsp" />
	<c:set var="board" value="<%=board%>" />
	<h2>글 보기</h2>
	<form action="BoardUpdate.jsp" method="post">
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
				<td colspan="3"><b><input type="text" name="title"
						value="${ board.title }" style="width: 90%;"></b></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3" style="height: 50px;"><textarea rows="10"
						name="content" style="width: 90%;">${ board.content }</textarea></td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<button type="submit" onclick="location.href='BoardUpdate.jsp?num=${ board.num }'">작성 완료</button>
					<button type="reset">다시 작성</button>
					<button type="button" onclick="location.href='List.jsp'">목록으로</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>