<%@page import="dao.BoardDAO"%>
<%@page import="dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<h2>글 보기</h2>
	<table border="1" width="90%">
		<tr>
			<td>번호</td>
			<td><%=board.getNum()%></td>
			<td>작성자</td>
			<td><%=board.getId()%>(<%=board.getName()%>)</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><%=board.getPostdate()%></td>
			<td>조회수</td>
			<td><%=board.getVisitcount()%></td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3"><b><%=board.getTitle()%></b></td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3" style="height: 50px;"><%=board.getContent()%></td>
		</tr>
		<tr>
			<td colspan="4" align="center">
<%
	if (session.getAttribute("UserId") != null && session.getAttribute("UserId").equals(board.getId())){
%>
				<button type="button" onclick="location.href='Modify.jsp?num=<%= board.getNum() %>'">수정하기</button>
				<button type="button" onclick="location.href='Remove.jsp?num=<%= board.getNum() %>'">삭제하기</button>
<%
	}
%>
				<button type="button" onclick="location.href='List.jsp'">목록으로</button>
			</td>
		</tr>
	</table>
</body>
</html>