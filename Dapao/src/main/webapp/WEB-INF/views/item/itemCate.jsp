<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<c:if test="${empty us_id }">
	<%@ include file="../include/userHeader.jsp" %>
</c:if>
<c:if test="${!empty us_id }">
	<%@ include file="../include/userLoginHeader.jsp" %>
</c:if>
	
</head>
<body>

	<h1>/item/itemCateSearch.jsp</h1>
	<h1>검색시 나타나는 페이지</h1>
	
	<c:forEach var="it" items="${cateItemVO}">
		<div>
			<a href="../item/itemDetail?it_no=${it.it_no }">
				<img src="/imgfile/${it.it_img }" width="150px" height="150px"> <br>
				<input type="text" value="${it.it_title}">  <br>
				<input type="text" value="${it.it_price}">
				<input type="text" value="${it.it_regdate}">
			</a>
		</div>
		<br>
	</c:forEach>

<%@ include file="../include/userFooter.jsp" %>
	


</body>
</html>