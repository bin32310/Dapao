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

<h1>비밀번호찾기 이메일인증</h1>
<h1>user/userFindPw</h1>

		<c:if test="${empty us_id }">
		<%@ include file="../include/userHeader.jsp" %>
	</c:if>
	<c:if test="${!empty us_id }">
		<%@ include file="../include/userLoginHeader.jsp" %>
	</c:if>
	
	
	
	<script type="text/javascript">
	function back(){
	      history.back();  // 뒤로가기
	   }
	
	</script>
	
	<!-- 이메일인증 버튼 클릭 -->
	<script type="text/javascript">
		$("#sendEmail").click(function(){
			const email = $("#us_id").val
			console.log("회원 이메일 확인 : " + email);// console에서 확인 
			const checkInput = $("#checkNum"); // 인증번호 입력하는 곳 
			
			$.ajax({
				type : "get",
				url : "/user/userFindPw,
				success : function(data){
					console.log("data : " + data);
					checkInput.attr("disabled",false);
					code = data; 
					alert("인증번호가 전송되었습니다");
				},
				error : function(){
					alert("인증번호 전송에 실패했습니다.");
				}
			});// mail ajax
		});// sendEmail. click 
		
		$("#checkNum").blur(function(){
			var inputCode = $(this).val();
			var resultMsg = $("#mail_check_msg");
			
			if(inputCode == code){
				resultMsg.html("인증번호가 일치합니다.");
				resultMsg.css("color","green");
				$("#sendEmail").attr("disabled",true);
				$("#email").attr("readonly",true);
			}else{
				resultMsg.html("인증번호가 일치하지 않습니다. 다시 입력해 주세요.");
				resultMag.css("color","red");
			}
			
		});
	
	</script>
	
	
	
	
	
	
	<form action="" method="post" id="userFindPw">
			이메일 <input type="text" name="us_email" placeholder="이메일 형식으로 입력해주세요">
			<button id="sendEmail">이메일 인증번호 보내기</button>
			인증번호 <input type="text" name="checkNum"><br>
			<input type="submit" value="비밀번호찾기">
		</form>
			 <button onclick="back()">뒤로가기</button>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
<%@ include file="../include/userFooter.jsp" %> 
</body>
</html>