<%@page import="dto.MemberDTO"%>
<%@page import="dao.MemberDAO"%>
<%@page import="common.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String loginId = CookieManager.readCookie(request,"loginId");
	String cookieChk = "";
	if(!loginId.equals("")) {
		cookieChk = "checked";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/inc/Header.jsp" />

<script>
	function validateForm(form){
		if(form.user_id.value=="") {
			alert("아이디를 입력해 주세요");
			return false;
		} else if(form.user_pw.value==""){
			alert("비밀번호를 입력해 주세요");
			return false;
		}
	}
</script>
<% if(session.getAttribute("UserId") == null) {%>	
	<h2>로그인</h2>
	<form action="LoginProcess.jsp" method="post" onsubmit="return validateForm(this);">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="user_id" value="<%=loginId%>"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="checkbox" name="save_check" value="Y" <%= cookieChk %>>아이디저장</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="user_pw"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<button type="submit">로그인하기</button>
					<button type="button" onclick="location.href='JoinForm.jsp'">회원가입</button>
				</td>
			</tr>
		</table>
	</form>
<% } else {
		response.sendRedirect("Mypage.jsp");
}
%>
</body>
</html>