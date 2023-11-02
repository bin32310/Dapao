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

		<h1>views/user/userMypage</h1>
		<h1>마이페이지</h1>
		
		
		
		
	<button><a href="/user/userInfoUpdate">내프로필 수정 
	 </a></button>	
			
			
			<button onclick="confirmPassword()">회원정보 수정하기</button>
		<script type="text/javascript">
			$.ajax({
				
				var usId = $('input[name=us_id]').val();
            url : "/user/userInfoUpdate",
            type : "POST",
            data : {
               "us_id" : usId
            },
            dataType : "json",
            success : function(data) {
               console.log(data)
             	 
            },
            error : function() {
               console.log("오류");
            }
            
         });
			
			
			 
			</script>
			
			
			
			
<!-- <script type="text/javascript">
// JavaScript로 비밀번호 확인과 이동을 처리합니다.
function confirmPassword() {
    var userInfoCheck = prompt("비밀번호를 입력하세요."); 
    // 여기서 비밀번호를 확인하는 로직을 실행합니다.
    if (userInfoCheck == 'us_pw') {
        // 비밀번호가 맞다면 수정 페이지로 이동합니다.
        location.href = '/user/userInfoUpdate';
    } else {
        // 비밀번호가 틀렸을 경우, 오류 메시지를 표시합니다.
        alert("비밀번호가 틀렸습니다. 다시 시도해주세요.");
    }
}
	
	</script>
	
	 -->
	
	
		<a href="/user/userSell">판매 목록 </a>
		<a href="/user/userBuy">구매 목록 </a>
		<a href="/user/userReview">내가 쓴 리뷰 </a>
		<a href="/user/userCs">고객센터</a>
		<a href="/user/userLove">찜 목록 </a> 
		
		<button><a href="/user/userMain">확인 </a></button>	
		<c:forEach var="vo" items="UserVO">
			프로필 사진 <br>
			 <!-- 수정 버튼 누르면 비밀번호 1회 체크 -->	<input type="hidden" name="us_pw" value="${vo.us_pw}" id="us_pw"> 
				닉네임 : <input type="text" name="us_name" value = "${vo.us_nickname }"><br>
				아이디 : <input type="text" name="us_id" value = "${vo.us_id }"><br>
				이메일 : <input type="text" name="us_email" value = "${vo.us_email }"><hr>
				  주소 : <input type="text" name="us_addr" value = "${vo.us_addr }"><br>
				가입일 : <input type="text" name="us_regdate" value = "${vo.us_regdate }"><br>
		  신고누적횟수 : <input type="text" name="us_account" value = "${vo.us_account }"><br>
			  정지횟수 : <input type="text" name="us_stop" value = "${vo.us_stop }"><br>
				
		</c:forEach>
		
		
		<button><a href="/user/userDelete"> 회원 탈퇴하기 </a></button>	
		
		
		
		
</body>
</html>