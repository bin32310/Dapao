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

<!-- header -->
<c:if test="${empty us_id }">
		<%@ include file="../include/userHeader.jsp" %>
	</c:if>
	<c:if test="${!empty us_id }">
		<%@ include file="../include/userLoginHeader.jsp" %>
	</c:if>
	<!-- header -->
	
	
	
	<script type="text/javascript">
	function back(){
	      history.back();  // 뒤로가기
	   }
	
	</script>
	
	
		<h1>user/userFindId</h1>
		<h2> 아이디찾기 </h2>
		
	
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
	<script>
	$(document).ready(function(){
		
		
		 function userFindId() {
			if (userFindIdForm.us_name.value == "") {
				alert("이름을 입력해 주세요.");
				userFindIdForm.us_name.focus();
				return;
			}
			if (userFindIdForm.us_tel.value == "") {
				alert("전화번호를 입력해 주세요.");
				userFindIdForm.us_tel.focus();
				return;
			}
			
			var us_name =$("#us_name").val();
			var us_tel =$("#us_tel").val();
			
			var sendData="us_name="+us_name+'&us_tel='+us_tel;
			
			
			$.ajax({
				url : "userFindId",
				method : "post",
				data : sendData,
				dataType : "text",
				success : function(text) {
					if (text != null) {
						$("#result_id").html("아이디는 "+text);
					} else {
						$("#result_id").html("해당정보가 없습니다.");
					}
				},
				error : function(xhr) {
					alert("에러코드 = " + xhr.status);
				}
			});
		
		
		} 
		
		
		
		
	});
	
	
	</script>
	
	 -->
	
			<form action="" method="post" id="userFindId">
			이름<input type="text" name="us_name"><br>
			전화번호<input type="text" name="us_tel" placeholder="'-'도 입력해주세요"><br>
			<input type="submit" value="아이디 찾기">
		</form>
			 <button onclick="back()">뒤로가기</button>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<%@ include file="../include/userFooter.jsp" %>

</body>
</html>