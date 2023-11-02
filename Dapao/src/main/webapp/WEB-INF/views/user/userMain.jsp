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

<script>

        var login = '${login}';
        console.log(login);

        if(login == 'success'){
            alert('로그인 성공');
        }

</script>


<!-- 	
		<h1> /user/userMain.jsp</h1>
		<h1> 유저 메인페이지</h1>
-->

	<c:if test="${us_id.equals('admin') }">
		관리자페이지로 이동 
	
	</c:if>


	<c:if test="${empty us_id }">
		<%@ include file="../include/userHeader.jsp" %>
	</c:if>
	<c:if test="${!empty us_id }">
		<%@ include file="../include/userLoginHeader.jsp" %>
	</c:if>
	
	

	
	<h2> 인기 가게 둘러보기(광고) </h2>
	<c:forEach var="ad" items="${adList}">
		<fieldset>
			<form>
				<a href="../ent/ent?ent_id=${ad.own_id }"><input type="text" value="/upload/${ad.ent_img }" name="ent_img"></a> <br>
				<a href="../ent/ent?ent_id=${ad.own_id }"><input type="text" value="${ad.ent_name }" name="ent_name"> </a>
			</form>
		</fieldset>
	</c:forEach> 
	
 	<c:if test="${!empty us_id }">
		<h2> 나의 찜 목록 </h2>
 		<c:forEach var="love" items="${loveList}">
			<fieldset>
				<form action="">
					<a href="../item/itemDetail?it_no=${love.it_no }"> <input type="text" value="/upload/${love.it_img }" name="it_img"></a> <br>
					<a href="../item/itemDetaiil?it_no=${love.it_no }"> <input type="text" value="${love.it_title }" name="it_title"></a> <br>
					<input type="text" value="${love.it_price }" name="it_price">
				</form>
			</fieldset>
		</c:forEach> 
	</c:if>
	
	<h2> 인기 물건 둘러보기 </h2>
	
 	<c:forEach var="item" items="${itemList}">
		<a href="../item/itemDetail?it_no=${item.it_no }"><input type="text" value="/upload/${item.it_img }" name="it_img"> </a>
		<a href="../item/itemDetail?it_no=${item.it_no }"><input type="text" value="${item.it_title }" name="it_title"> </a>
		<a href="../item/itemDetail?it_no=${item.it_no }"><input type="text" value="${item.it_price }" name="it_price"> </a> <br><br>
	</c:forEach>  
	
	<%@ include file="../include/userFooter.jsp" %>
	
	
</body>
</html>