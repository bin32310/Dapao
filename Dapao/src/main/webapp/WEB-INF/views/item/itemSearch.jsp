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

	<h1>/item/itemSearch.jsp</h1>
	<h1>검색시 나타나는 페이지</h1>
	
	<c:forEach var="it" items="itemVO">
		<form action="">
			<input type="image"> <br>
			<input type="text" name="it_name"> <br>
			<input type="text" name="it_price"> <br> 
			<input type="text" name="it_regdate"> <br> 
		</form>
	</c:forEach>
	
</body>
</html>