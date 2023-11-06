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


<!-- header -->
<c:if test="${empty us_id }">
		<%@ include file="../include/userHeader.jsp" %>
	</c:if>
	<c:if test="${!empty us_id }">
		<%@ include file="../include/userLoginHeader.jsp" %>
	</c:if>
	<!-- header -->
	
	
	
	
<h1> 비밀번호 찾기 </h1>
<h2> /user/userFindPw </h2>

<form class="content" action="" method="post">
	<div class="textbox">
		<input id="us_name" name="us_name" required="" type="text">
		<label for="text">이름</label>
		<div class="error"> 이름을 입력하세요 </div>
	</div>
	
	<div class="textbox">
		<input id="us_email" name="us_email" 
		required="/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)?$/i"
				type="text">
		<div class="error"> 이메일을 다시 입력해 주세요 </div>
	</div> <br><br>
		
		<input id="check" type="submit" value="비밀번호 찾기">
</form>








<%@ include file="../include/userFooter.jsp" %>



</body>
</html>