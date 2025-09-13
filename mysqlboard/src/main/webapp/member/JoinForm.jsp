<%@page import="common.MysqlConnPool"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
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
		} else if(form.user_name.value==""){
			alert("이름을 입력해 주세요");
			return false;
		}
	}
</script>
	<h2>회원가입</h2>
	<form action="JoinInsert.jsp" method="post" onsubmit="return validateForm(this);">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="user_id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="user_pw"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="user_name"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<button type="submit">가입하기</button>
				</td>
			</tr>
		</table>
	</form>	
</body>
</html>