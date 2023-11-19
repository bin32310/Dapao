<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage/userDelete</title>


		<c:if test="${empty us_id }">
		<%@ include file="../include/userHeader.jsp" %>
	</c:if>
	<c:if test="${!empty us_id }">
		<%@ include file="../include/userLoginHeader.jsp" %>
	</c:if>
	
</head>
<body>

	
		<script type="text/javascript">
	function back(){
	      history.back();  // 뒤로가기
	   }
	
	</script>
	

<form action="" method="post">
<span>정말로 탈퇴하시겠습니까?</span>
<input type="text" name="us_pw" placeholder="비밀번호를 입력하세요"/><br>
<input type="submit" name="pwCheck2" value="탈퇴하기" />

  <input type="button" onclick="back()" value="뒤로가기">

</form>



<%@ include file="../include/userFooter.jsp" %> 
</body>
</html>