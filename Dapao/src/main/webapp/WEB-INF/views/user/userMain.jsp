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

	<h1> /user/userMain.jsp</h1>
	<h1> 유저 메인페이지</h1>
	
	<c:if test="${empty session.us_id }">
	
		<a href="/user/userLogin">로그인 </a>
		<a href="/user/userJoin">회원가입 </a>
	
	</c:if>
	
	<c:if test="${!empty session.us_id }">
	
	<a href="/user/userLogin">내 프로필 </a> <br>
	<a href="/chat/userChat">판다톡 </a> <br>
	<a> 대나무페이금액 </a> <br>
	<a href="/charge/userCharge">충전 </a> <br>
	<a href="/user/userLogout">로그아웃 </a> <br>
	
	</c:if>
	
	

	
	<h2> 인기 가게 둘러보기(광고) </h2>
	<c:forEach var="ent" items="${adList}">
		<fieldset>
			<form>
				<a href="/ent/ent?ent_id=${vo.ent_id }"><input type="image" value="/upload/${ent.ent_img }" name="ent_img"></a> <br>
				<a href="/ent/ent?ent_id=${vo.ent_id }"><input type="text" value="${ent.ent_name }" name="ent_name"> </a>
			</form>
		</fieldset>
	</c:forEach>
	
	<c:if test="${!empty session.us_id }">
		<h2> 나의 찜 목록 </h2>
		<c:forEach var="love" items="${loveList}">
			<fieldset>
				<form action="">
					<a href="/item/itemDetail?it_no=${love.it_no }"> <input type="image" value="/upload/${like.it_img }" name="it_img"></a> <br>
					<a href="/item/itemDetaiil?it_no=${love.it_no }"> <input type="text" value="${like.it_name }" name="it_name"></a> <br>
					<input type="text" value="${love.it_price }" name="it_price">
				</form>
			</fieldset>
		</c:forEach>
	</c:if>
	
	<h2> 인기 물건 둘러보기 </h2>
	
	<c:forEach var="item" items="${itemList}">
		<a href="/item/itemDetail?it_no=${item.it_no }">${item.it_img } </a>
	</c:forEach>
	
</body>
</html>