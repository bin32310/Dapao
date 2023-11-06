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
		<form action="">
			<a href="../item/itemDetail?it_no=${it.it_no }">이미지</a> 
			<a href="../item/itemDetail?it_no=${it.it_no }">${it.it_title}</a> 
			<a href="../item/itemDetail?it_no=${it.it_no }">${it.it_price}</a>
			<a href="../item/itemDetail?it_no=${it.it_no }">${it.it_regdate}</a> <br> 
		</form>
	</c:forEach>

<%@ include file="../include/userFooter.jsp" %>
	


</body>
</html>