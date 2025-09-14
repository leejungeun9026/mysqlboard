<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table border="1" style="width: 90%;">
	<tr>
		<td width="30%">
			<%
			if (session.getAttribute("UserId") == null) {
			%> <a href="/mysqlboard/member/LoginForm.jsp">로그인</a> / <a
			href="/mysqlboard/member/JoinForm.jsp">회원가입</a> <%
 } else {
 %> <%=session.getAttribute("UserName")%>님 <a class="nav-link px-2"
			href="/mysqlboard/member/Logout.jsp">[로그아웃]</a> <%
 }
 %>
		</td>
		<td width="70%"><a href="/mysqlboard/board/List.jsp">게시판 목록</a>
			&nbsp; <a href="/mysqlboard/board/Write.jsp">글쓰기</a></td>
	</tr>
</table>