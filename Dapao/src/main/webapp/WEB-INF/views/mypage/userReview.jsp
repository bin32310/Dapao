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
<h1>내가 쓴 리뷰</h1>
<h2>views/mypage/userReview</h2>


		<c:if test="${empty us_id }">
		<%@ include file="../include/userHeader.jsp" %>
	</c:if>
	<c:if test="${!empty us_id }">
		<%@ include file="../include/userLoginHeader.jsp" %>
	</c:if>
	

<button><a href="/mypage/userReviewOwn">판매자=사업자 
	 </a></button>
	 
<br>

<button><a href="/mypage/userReviewUs">판매자=회원
	 </a></button>



 
<%@ include file="../include/userFooter.jsp" %> 

</body>
</html>