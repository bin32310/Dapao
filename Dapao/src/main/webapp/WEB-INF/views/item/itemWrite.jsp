
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<c:if test="${us_id.equals(null) || empty us_id }">
<c:redirect url="../user/userLogin"/>
</c:if>
<c:if test="${!empty us_id }">
<%@ include file="../include/userLoginHeader.jsp" %>
</c:if>

<script type="text/javascript">


$(document).ready(function(){
	
	// 첨부파일 공격에 대비하기 위한 업로드 파일 확장자 제한
	// 특정 크기 이상의 파일 업로드 제한
	
	// 함수선언 : 정규식을 이용하여 확장자 제한
	var reg = new RegExp("(.*?)\.(exe|zip|alz|js)$")
	
	// 최대 업로드 크기를 설정하여 그 이상이면 제한
	var maxSize = 5242880; // 5MB
	
	// 파일이름, 파일크기
	function checkExtension(fileName, fileSize){
		
		// 파일 크기 제한
		// 실페 파일 크기 > 최대 업로드 가능 크기
		
		if(fileSize > maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(reg.test(fileName)){
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		
		return true;
		
	}//checkExtension
	
	
	
	$("#uploadBtn").on("click", function(){
		// 파일 업로드 관련 로직 처리
		
		var formData = new FormData();
		
		var inputFile = $("input[name='uploadFile']");
		//console.log(inputFile);
		
		var files = inputFile[0].files;
		console.log(files); 
		
		// add File Data to formData
		 for(var i =0; i < files.length; i++){
			 console.log(files.length);
			 // checkExtension 함수 호출
		 	 if(!checkExtension(files[i].name, files[i].size)){
		 		 console.log("@해당파일불가@");
				 return false;
			 } 
			 
			 // jsp의 파일선택을 통해 선택한 파일들을 form 태그에 추가
			formData.append("uploadFile", files[i]);
			 console.log("@실행됨@");
			 
		} 
		
		console.log(formData);
		 // 첨부한 파일을 서버에 올려줌( UploadController에 파일 관련 데이터 전송 )
		 $.ajax({
			type : "POST",
			url : "/item/uploadAjaxAction",
			data : formData,
			processData : false,
			contentType : false,
			// dataType : "json",
			success : function(result){
				//console.log("@@@1");
				//console.log(result);
				alert('성공');				
				var str="";
				var input="";
				// 향상된 for문  _ 배열타입일때 사용 인덱스 i부터 obj 배열을 순차진행함
				
				$(result).each(function(i, obj){
					console.log("@@@2");
					console.log(obj);
					// filePath : 썸네일 파일 경로 + 파일명
					// console.log(obj.fileName);
					
					input += "<input type='text' name='fileList["+i+"].fileName' value='"+obj.fileName+"'>";
					input += "<input type='text' name='fileList["+i+"].uuid' value='"+obj.uuid+"'>";
					input += "<input type='text' name='fileList["+i+"].uploadPath' value='"+obj.uploadPath+"'>";
					input += "<input type='text' name='fileList["+i+"].image' value='"+obj.image+"'>";
					
					
				}); // $(result).each(function(i,obj)) 닫음  

				
				$("#form").append(input).submit();
				//console.log("완료3");
				
			},
			error : function(result){
				alert('실패');
			}
			
			
		}); // $.ajax 닫음 
 
	});
});




	// 뒤로가기 
	function back(){
		history.back(); 
	}

</script>


</head>
<body>



	<h1> /item/item_Write.jsp</h1>
	<h1> 물건 판매글 등록 </h1>
	
	<fieldset>
		<form action=""  method="post" id="form">
		
			이미지 사진 :
			<input type="file" name="uploadFile" multiple required> <br>
			<input type="button" value="파일전송" > <br>
			<div id="uploadResult">
				<ul>
				
				</ul>
				
			</div>
			
			제목 : <input type="text" value="" name="it_title" required> <br>
			가격 : <input type="number" value="" name="it_price" required> <br>
			내용 : <input type="text" value="" name="it_content" required> <br>
			
			상품 상태 :<input type="radio" value="중고" name="it_con" checked> 중고
			<input type="radio" value="새상품" name="it_con"> 새상품 <br>
			
			카테고리 : 
			<select name="it_cate" required>
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
			

			<input type="button" value="등록하기" id="uploadBtn"> 
			<input type="button" value="돌아가기" onclick="back();"> 
		
		</form>
	</fieldset>
	
<%@ include file="../include/footer.jsp" %>

</body>
</html>