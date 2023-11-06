<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> 비밀번호 찾기( 이메일 인증번호 입력 페이지 )</h1>
<h1> user/userFindPwNum</h1>
	<form action="" method="post">
		<input type="hidden" name="pwNum" value="${pwNum }">
			<div class="content">
				<div class="textbox"></div>
				<input type="text" name="emailNum" placeholder="인증번호를 입력하세요"> <label>인증번호</label>
				<div class="error"> </div>
			</div> <br><br>
				<input type="submit" id="pwCheck" value="확인">
	</form>
</body>
</html>