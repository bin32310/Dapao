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
	
		<h1>/item/yourPage</h1>
		<h1>상대방 프로필</h1>

	
		<a href="/user/userBuy">구매 목록 </a>

		프로필 사진 <br>
		
		닉네임 : <input type="text" name="us_name" value = "${yourPage.us_nickname }"><br>
		주소 : <input type="text" name="us_addr" value = "${yourPage.us_addr }"><br>
				  
		판매중인 물건		  
		<c:forEach var="yp" items="yourVO">
				사진 : <input type="text" name="us_name" value = "${yp.us_nickname }"><br>
				제목 : <input type="text" name="us_name" value = "${yp.us_nickname }"><br>
				가격 : <input type="text" name="us_addr" value = "${yp.us_addr }"><br>
		</c:forEach>
		
		리뷰		  
		<c:forEach var="rv" items="userVO">
				닉네임 : <input type="text" name="us_name" value = "${rv.us_nickname }"><br>
				별점 : <input type="text" name="rv_star" value = "${rv.rv_star }"><br>
				리뷰내용 : <input type="text" name="rv_content" value = "${rv.rv_content }"><br>
		</c:forEach>
		
		
		
		<%@ include file="../include/footer.jsp" %>
		
		
</body>
</html>