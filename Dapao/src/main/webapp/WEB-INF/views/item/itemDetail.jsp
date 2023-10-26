<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1> /item/item_detail.jsp</h1>
	<h1> 물건 상세페이지 </h1>
	${itemVO }
	
	<fieldset>
		<form action=""  method="post">
			<a>이미지 사진</a>
			<input type="image" value="${itemVO.it_img_z }" name="it_img_z"> 
			
			<input type="text" value="${itemVO.it_title }" name="it_title"> <br>
			<input type="text" value="${itemVO.it_price }" name="it_price"> <br>
			<input type="text" value="${itemVO.it_like }" name="it_like"> <br>
			<input type="text" value="${itemVO.it_view }" name="it_view"> <br>
			<input type="text" value="${itemVO.it_botime }" name="it_botime"> <br>
			<input type="text" value="${itemVO.it_state }" name="it_state"> <br>
			<input type="text" value="${itemVO.it_cate }" name="it_cate"> <br>
			<input type="text" value="${itemVO.it_addr }" name="it_addr"> <br>
			
			<input type="button" value="찜"> 
			<input type="button" value="판다톡"> 
			<input type="submit" value="바로구매"> 
		
		</form>
	</fieldset>
	
	<form action="">
		<input type="text" value="판매글 제목"> <br>
		<textarea rows="10" cols="10" value="판매글 내용"></textarea>
	</form>
	
	<a>판매자의 다른 상품도 보기</a>
	

	<form action="">
		<input type="text" value="판매자 프로필 보기">
		<input type="text" value="판매자 이름">
		<input type="text" value="판매자 물품 수">
		
		<input type="text" value="판매후기">
	</form>


</body>
</html>