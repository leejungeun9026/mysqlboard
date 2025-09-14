<%@page import="java.util.HashMap"%>
<%@page import="dto.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
request.setAttribute("searchWord", searchWord);
request.setAttribute("searchField", searchField);
HashMap<String, String> search = new HashMap<String, String>();
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
						<option value="all" >제목+내용</option>
						<option value="title" ${ searchField == "title" ? "selected" : "" } >제목</option>
						<option value="content" ${ searchField == "content" ? "selected" : "" } >내용</option>
					</select>
					<input type="text" name="searchWord" value="${searchWord}">
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
		<%
		if (list.size() == 0) {
		%>
		<tr>
			<td colspan="5" align="center">게시물이 없습니다.</td>
		</tr>
		<%
		} else {
		for (BoardDTO b : list) {
		%>
		<tr>
			<td><%=b.getNum()%></td>
			<td><a href="View.jsp?num=<%=b.getNum()%>"><%=b.getTitle()%></a></td>
			<td><%=b.getId()%>(<%=b.getName()%>)</td>
			<td><%=b.getPostdate()%></td>
			<td><%=b.getVisitcount()%></td>
		</tr>
		<%
		}
		}
		%>
	</table>
</body>
</html>