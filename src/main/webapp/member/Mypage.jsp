<%@page import="dto.MemberDTO"%>
<%@page import="dao.MemberDAO"%>
<%@page import="common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	if (session.getAttribute("UserId") == null) {
		response.sendRedirect("LoginForm.jsp");
	} else {
		MemberDAO dao = new MemberDAO();
		MemberDTO member = dao.getMemberDTO(session.getAttribute("UserId").toString());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/inc/Header.jsp" />
<h2>마이페이지</h2>
<script>
	function checkPwMatch(){
		let pass1 = document.getElementById("pass1").value;
		let pass2 = document.getElementById("pass2").value;
		let msg = document.getElementById("passMsg");
		
		if(pass2.length == 0) {
			msg.innerHTML = ""; // 비밀번호 확인창이 비어있을 땐 표시 안 함
      return;
		}
		if(pass1 == pass2) {
			msg.textContent = "비밀번호가 일치합니다.";
			msg.style.color = "green";
		} else {
			msg.textContent = "비밀번호가 일치하지 않습니다.";
			msg.style.color = "red";
		}
	}
</script>
<form action="MemberUpdate.jsp" method="post">
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="user_id" value="<%= member.getId() %>" readonly></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="user_name" value="<%= member.getName() %>" readonly></td>
		</tr>
		<tr>
			<td>가입일</td>
			<td><input type="date" name="regidate" value="<%= member.getRegidate() %>" readonly></td>
		</tr>
		<tr>
			<td>현재 비밀번호</td>
			<td>
				<input type="password" name="user_pass" value="">
			</td>
		</tr>
		<tr>
			<td>변경할 비밀번호</td>
			<td><input type="password" id="pass1" name="new_pass" value="" onkeyup="checkPwMatch()"></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td>
				<input type="password" id="pass2" name="new_pass_chk" value="" onkeyup="checkPwMatch()">				
			</td>
		</tr>
		<tr>
			<td></td>
			<td><p id="passMsg" style="margin:0;"></p></td>
		</tr>
		<tr>
			<td></td>
			<td><button type="submit">수정하기</button></td>
		</tr>
	</table>
</form>
</body>
</html>
<%
	}
%>