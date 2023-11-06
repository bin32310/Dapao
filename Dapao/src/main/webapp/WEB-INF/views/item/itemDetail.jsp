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
	
	<fieldset>
		<form action=""  method="post">
			<c:if test="${!empty us_id }">
				<input type="button" value="신고하기" onclick="location.href='/ac/writeForm?it_no=${itemVO.it_no}';"> <br>
			</c:if>
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
			
			<input type="hidden" value="${itemVO.us_id }" name="us_id"> <br>
			
			<c:if test="${empty us_id }">
				<input type="button" value="로그인하고 구매하기" id="login_buy">
			</c:if>
			<c:if test="${!empty us_id }">
				<input type="button" value="찜" id="addLoveBtn"> 
				<input type="hidden" value="${love}" id="love_value"> 
				<input type="button" value="판다톡"> 
				<input type="submit" value="바로구매"> 
			</c:if>
		
		</form>
	</fieldset>
	
	<form action="">
	
		상세 내용 <br>
		<textarea rows="10" cols="10">${itemVO.it_content}</textarea>
	</form>
	
	<a href="/item/yourPage?us_id=${itemVO.us_id }" > 판매자 프로필 보러가기 </a>
	
	
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
	

<script type="text/javascript">


$(document).ready(function(){
	
	

	
	
	var love = ${love};
	console.log(love);
	
	// 처음 찜 여부 확인 
	if(love == 0){
		$('#addLoveBtn').attr("value","찜하기");
	}else{
		
		$('#addLoveBtn').attr("value","찜취소");
	}
	
	

	// 찜버튼 클릭 
	$('#addLoveBtn').on("click", function(){
		alert("찜버튼클릭");
		
		var love_value = $("input[id='love_value']").val();
		var it_no = $("input[name='it_no']").val();
		
		$.ajax({
			type : "get",
			url : "/item/itemLove",
			data : {"love_value" : love_value, "it_no" : it_no},
			dataType : "JSON",
			error: function(){
				alert("찜실패");
			},
			success : function(result){
				console.log(result)
				if(result == 1){
					if( love_value == 0){ // 찜하기 
						
						console.log(result);
						$('#love_value').attr("value",1);
						$('#addLoveBtn').attr("value","찜취소");
						console.log(love_value);
						
					}else{ // 찜취소
								
						console.log(result);
						$('#love_value').attr("value",0);
						$('#addLoveBtn').attr("value","찜하기");
						console.log(love_value);
					} //else
				}
			} // success 끝	
		}) // ajax 끝

	});
	
	// 로그인하고 구매하기 버튼클릭
	$('#login_buy').click(function(){
		location.href='/user/userLogin';			
	});

	
	
});


</script>	
	
	

</body>
</html>