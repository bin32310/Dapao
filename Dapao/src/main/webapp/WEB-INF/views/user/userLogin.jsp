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
	
<!-- 간편로그인  -->

	<fieldset>
	<h4>간편 로그인</h4>
		<form action="">
			
		
		</form>
	
	
	</fieldset>
	
	
	<script>
	 $(function(){
		 $("#findPwBtn").click(function(){
			 location.href='../user/userFindPw';
			 
		 });//findPwBtn
		 
		 
		 
	 });// function
	
	
	</script>


<!-- 로그인 -->

	<fieldset>
	<h4>회원 로그인</h4>
		<form action="" method="post">
			아이디<input type="text" name="us_id"><br>
			비밀번호<input type="password" name="us_pw"><hr>
			<input type="submit" value="로그인" >
			<input type="button" value="회원가입 바로가기" 
				onclick="location.href='/user/userJoin';">	
		</form>
		
	
	</fieldset>
	
	<input type="button" value="아이디찾기" 
				onclick="location.href='/user/userFindId';">	
		<input type="button" value="비밀번호찾기" 
				id="findPwBtn">	
	
<%@ include file="../include/userFooter.jsp" %> 

</body>
</html>