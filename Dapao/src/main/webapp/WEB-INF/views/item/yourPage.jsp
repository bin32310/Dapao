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
	
<!-- 		<h1>/item/yourPage</h1>
		<h1>상대방 프로필</h1> -->

	
		<a href="/user/userBuy">구매 목록 </a>

		프로필 사진 <br>
		
		닉네임 : <input type="text" name="us_name" value = "${yourInfo.us_nickname }"><br>
		주소 : <input type="text" name="us_addr" value = "${yourInfo.us_addr }"><br>
				  
		판매중인 물건 <br>		  
		<c:forEach var="yi" items="${yourItemVO }">
			<c:if test="${yi.it_state != 2 }">
				<img src="/imgfile/${yi.it_img }" name="it_img" width="150px" height="150px" > <br>
				제목 : <input type="text" name="it_title" value = "${yi.it_title }"> <br>
				가격 : <input type="text" name="it_price" value = "${yi.it_price }"><br>
			</c:if>
		</c:forEach>
		
		리뷰 <br>		  
 		<c:forEach var="rv" items="${reviewVO}">
				닉네임 : <input type="text" name="us_name" value = "${rv.us_nickname }"><br>
				별점 : <input type="text" name="rv_star" value = "${rv.rv_star }"><br>
				리뷰내용 : <input type="text" name="rv_content" value = "${rv.rv_content }"><br>
		</c:forEach> 
		
		
		
		<%@ include file="../include/footer.jsp" %>
		
		
</body>
</html>