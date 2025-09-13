<%@page import="common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("UserId") == null){
		JSFunction.alertBack("로그인한 회원만 작성 가능합니다.", out);
	} else {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
	<jsp:include page="/inc/Header.jsp" /><h2>글쓰기</h2>
	<form action="BoardInsert.jsp" method="post">
		<table border="1" width="90%">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" style="width:90%;"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="id" value="${UserId}" readonly style="width:90%;"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="30" rows="10" name="content" style="width:90%;"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">저장하기</button>
					<button type="button" onclick="location.href='List.jsp';">목록으로</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
<%
	}
%>