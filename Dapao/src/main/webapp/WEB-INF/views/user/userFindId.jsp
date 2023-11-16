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
	
	
	
	<script type="text/javascript">
	function back(){
	      history.back();  // 뒤로가기
	   }
	
	</script>
	
	
		<h1>user/userFindId</h1>
		<h2> 아이디찾기 </h2>
		
	

	
			<form action="" method="post" id="userFindId">
			이름<input type="text" name="us_name"><br>
			전화번호<input type="text" name="us_tel" placeholder="'-'도 입력해주세요"><br>
			<input type="submit" value="아이디 찾기">
		</form>
			 <button onclick="back()">뒤로가기</button>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<%@ include file="../include/userFooter.jsp" %>

</body>
</html>