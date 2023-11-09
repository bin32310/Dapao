<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${empty us_id }">
		<%@ include file="../include/userHeader.jsp" %>
	</c:if>
	<c:if test="${!empty us_id }">
		<%@ include file="../include/userLoginHeader.jsp" %>
	</c:if>
	
	
<h1>/views/user/userLogin</h1>

<fieldset>
	<form action="" method="post">
	아이디<input type="text" name="us_id"><br>	 
	비밀번호<input type="password" name="us_pw"><br>
	비밀번호 확인<input type="password" name="us_pw_ch"><br>
	이름<input type="text" name="us_name"><br>
	닉네임<input type="text" name="us_nickname"><br>
	이메일<input type="text" name="us_email"><br>
	전화번호<input type="text" name="us_tel"><br>
	주소<input type="text" name="us_addr"><br>
		<input type="submit" value="회원가입하기">
	</form>

</fieldset>

<%@ include file="../include/userFooter.jsp" %> 

</body>
</html>