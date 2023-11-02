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

	<c:if test="${empty us_id }">
		<%@ include file="../include/userHeader.jsp" %>
	</c:if>
	<c:if test="${!empty us_id }">
		<%@ include file="../include/userLoginHeader.jsp" %>
	</c:if>
	
<!-- 	<h1> /item/item_detail.jsp</h1>
	<h1> 물건 상세페이지 </h1> -->
	
	<fieldset>
		<form action=""  method="post">
			상품번호 <input type="text" value="${itemVO.it_no }" name="it_no"> <br>
			<a>이미지 사진</a>
			<input type="text" value="${itemVO.it_img }" name="it_img"> <br>
			
 			<input type="text" value="${itemVO.it_title }" name="it_title"> <br>
			<input type="text" value="${itemVO.it_price }" name="it_price"> <br>
			<input type="text" value="${itemVO.it_love }" name="it_love"> <br>
			<input type="text" value="${itemVO.it_view }" name="it_view"> <br>
			<input type="text" value="${itemVO.it_regdate }" name="it_regdate"> <br>
			상품상태 <input type="text" value="${itemVO.it_con }" name="it_con"> <br>
			<input type="text" value="${itemVO.it_cate }" name="it_cate"> <br>
			<input type="text" value="${itemVO.us_addr }" name="us_addr"> <br> 
			
			<input type="hidden" value="${itemVO.us_id }" name="us_no"> <br>
			
			<input type="button" value="찜"> 
			<input type="button" value="판다톡"> 
			<input type="submit" value="바로구매"> 
		
		</form>
	</fieldset>
	
	<form action="">
	
		상세 내용 <br>
		<textarea rows="10" cols="10">${itemVO.it_content}</textarea>
	</form>
	
	<a>판매자의 다른 상품도 보기</a>

	<c:forEach var="si" items="${sellerItemVO}">
		<form action="">
		상품번호(나중에 지우기) <br>  <input type="text" value="${si.it_no }" name="it_no"> <br>
			<a href="../item/itemDetail?it_no=${si.it_no }"><input type="text" value="${si.it_img }" name="it_img"> </a> <br>
			<a href="../item/itemDetail?it_no=${si.it_no }"><input type="text" value="${si.it_title }" name="it_title"> </a> <br>
		</form>
	</c:forEach>
	
	
	<a>비슷한 상품 둘러보기</a>
	
	<c:forEach var="sc" items="${sameCateVO}">
		<form action="">
			상품번호(나중에 지우기) <br> <input type="text" value="${sc.it_no }" name="it_no"> <br>
			<a href="../item/itemDetail?it_no=${sc.it_no }"><input type="text" value="${sc.it_img }" name="it_img"> </a> <br>
			<a href="../item/itemDetail?it_no=${ssci.it_no }"><input type="text" value="${sc.it_title }" name="it_title"> </a> <br>
		</form>
	</c:forEach> 
	
	<%@ include file="../include/userFooter.jsp" %>

</body>
</html>