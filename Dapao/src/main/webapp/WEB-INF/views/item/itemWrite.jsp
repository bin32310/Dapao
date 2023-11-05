
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	// 뒤로가기 
	function back(){
		history.back(); 
	}

</script>


</head>
<body>

 	<c:if test="${us_id.equals(null) || empty us_id }">
		<c:redirect url="../user/userLogin"/>
	</c:if>
	<c:if test="${!empty us_id }">
		<%@ include file="../include/userLoginHeader.jsp" %>
	</c:if>

	<h1> /item/item_Write.jsp</h1>
	<h1> 물건 판매글 등록 </h1>
	
	<fieldset>
		<form action=""  method="post">
			이미지 사진 :
			<input type="text" value="이미지를 등록해주세요" name="it_img"> <br>
			
			제목 : <input type="text" value="" name="it_title"> <br>
			가격 : <input type="text" value="" name="it_price"> <br>
			내용 : <input type="text" value="" name="it_content"> <br>
			
			상품 상태 :<input type="radio" value="중고" name="it_con"> 중고
			<input type="radio" value="새상품" name="it_con"> 새상품 <br>
			
			카테고리 : 
			<select name="it_cate" >
				<option value="">카테고리</option>
				<option value="패션의류">패션의류</option> 
				<option value="뷰티잡화">뷰티/잡화</option> 
				<option value="유아용품">유아용품</option> 
				<option value="가구생활">가구/생활</option> 
				<option value="취미">취미</option> 
				<option value="전자기기">전자기기</option> 
				<option value="스포츠레저">스포츠/레저</option> 
				<option value="자동차">자동차</option> 
				<option value="도서">도서</option> 
			</select> <br>
			

			<input type="submit" value="등록하기"> 
			<input type="button" value="돌아가기" onclick="back();"> 
		
		</form>
	</fieldset>
	
<%@ include file="../include/footer.jsp" %>

</body>
</html>