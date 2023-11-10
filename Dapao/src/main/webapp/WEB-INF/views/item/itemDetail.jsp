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


		<div id ="uploadResult">
			<ul></ul>
		</div>



	<fieldset>
		<form action=""  method="post">

			
			<c:if test="${!empty us_id && itemVO.us_id != us_id}">
				<input type="button" value="신고하기" onclick="location.href='/admin/ac/writeForm?it_no=${itemVO.it_no}';"> <br>
			</c:if>
			
			<input type="hidden" value="${itemVO.it_no }" name="it_no"> <br>

			
 			<input type="text" value="${itemVO.it_title }" name="it_title">
			<input type="text" value="${itemVO.it_price }" name="it_price"> <br>
			찜수 <input type="text" value="${itemVO.it_love }" name="it_love"> | 
			조회수 <input type="text" value="${itemVO.it_view }" name="it_view">  | 
			등록일 <input type="text" value="${itemVO.it_regdate }" name="it_regdate"> <br>
			
				
			판매자 <a href="/item/yourPage?us_id=${itemVO.us_id }" >
			<input type="text" value="${sellerVO.us_nickname }" name="us_id"> </a> <br>
			카테고리 <input type="text" value="${itemVO.it_cate }" name="it_cate"> <br>
			상품상태 <input type="text" value="${itemVO.it_con }" name="it_con"> <br>
			<input type="text" value="${sellerVO.us_addr }" name="us_addr"> <br> 
			
			<input type="hidden" value="${itemVO.us_id }" name="us_id"> <br>
			
			<c:if test="${empty us_id }">
				<input type="button" value="로그인하고 구매하기" id="login_buy">
			</c:if>
			<c:if test="${!empty us_id && itemVO.us_id != us_id}">
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
	
	<br><hr><br>

	
	<br><hr><br>
	<a>판매자의 다른 상품도 보기</a>
	<table border="1">
		<c:forEach var="si" items="${sellerItemVO}">
			<input type="hidden" value="${si.it_no }" name="it_no"> <br>
			<tr>
				<td  id ="uploadSeller">
					<img src="/imgfile/${si.it_img }" width="150px" height="150px">
				</td>
				<td>
					<a href="../item/itemDetail?it_no=${si.it_no }"><input type="text" value="${si.it_title }" name="it_title"> </a>
				</td>
		</c:forEach>
	</table>	
	
	<br><hr><br>
	<a>비슷한 상품 둘러보기</a>
	<table border="1">
		<c:forEach var="sc" items="${sameCateVO}">
			<input type="hidden" value="${sc.it_no }" name="it_no">
			<tr>
				<td id ="uploadCate">
					<img src="/imgfile/${sc.it_img }" width="150px" height="150px">
				</td>
				<td>
					<a href="../item/itemDetail?it_no=${sc.it_no }">${sc.it_title }</a>
				</td>
			</tr>
		</c:forEach> 	
	</table>
	

	
	<%@ include file="../include/userFooter.jsp" %>
	

<script type="text/javascript">


$(document).ready(function(){
	
	//var path = "F:\\upload" + ${si.it_img };
	//console.log(path);
	//$("#img src").html(path);
	
	var str="";
	var love = ${love};
	console.log("love : " + love);
	
	// 처음 찜 여부 확인 
	if(love == 0){
		$('#addLoveBtn').attr("value","찜하기");
	}else{
		
		$('#addLoveBtn').attr("value","찜취소");
	}
	
	// 파일 확인
	
	var it_no=$("input[name='it_no']").val();
	//alert(it_no);
	
	// 물건 상세 사진 확인 -콜백함수
	$.getJSON("/item/itemFile",{it_no:it_no},function(data){ 
	
				//alert("실행");
				console.log("function");
				console.log(data);
				
				
				$(data).each(function(i,file){
					console.log("반복");
					if(file.image){
						console.log("if");
						var filePath = encodeURIComponent(file.uploadPath + "/s_" + file.uuid+"_"+file.fileName);
						console.log(filePath);
						//src="/display?fileName='filePath'"
						str += "<img src='/item/display?fileName="+filePath+"'>";		
					}else{
						console.log("else");
						var filePath = encodeURIComponent(file.uploadPath+"/"+file.uuid+"_"+file.fileName);
						//str+="<li><a href='/item/download?fileName="+filePath"'>"+file.fileName+"</a></li>";
					}
				}); // data.each
				console.log("@@str : ");
				console.log(str);
				$("#uploadResult ul").html(str);
	});// getJSON 
	

	// 찜버튼 클릭 
	$('#addLoveBtn').on("click", function(){
		//alert("찜버튼클릭");
		
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
		}); // ajax 끝

	});
	
	// 로그인하고 구매하기 버튼클릭
	$('#login_buy').click(function(){
		location.href='/user/userLogin';			
	});

	
	
});


</script>	
	
	

</body>
</html>