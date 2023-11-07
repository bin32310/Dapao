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

		<h1>views/mypage/userInfo</h1>
		<h1>마이페이지-정보조회</h1>
		
		<c:if test="${empty us_id }">
		<%@ include file="../include/userHeader.jsp" %>
	</c:if>
	<c:if test="${!empty us_id }">
		<%@ include file="../include/userLoginHeader.jsp" %>
	</c:if>
	
		
	<button><a href="/mypage/userInfoUpdate">내프로필 수정 
	 </a></button>
			
<!-- 			
			
		<script type="text/javascript">
			$.ajax({
				
				var usId = $('input[name=us_id]').val();
            url : "/mypage/userInfoUpdate",
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
			
			 -->
			
			
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
	
	
		<a href="/mypage/userSellList">판매 목록 </a>
		<a href="/mypage/userBuy">구매 목록 </a>
		<a href="/mypage/userReview">내가 쓴 리뷰 </a>
		<a href="/mypage/userCs">고객센터</a>
		<a href="/mypage/userLove">찜 목록 </a> 
		
		<button><a href="/user/userMain">확인 </a></button>	
		
	 	
			프로필 사진 <br>
			 <!-- 수정 버튼 누르면 비밀번호 1회 체크 <input type="hidden" name="us_pw" value="${vo.us_pw}" id="us_pw"> -->	
			 
				닉네임 : <input type="text" name="us_nickname" value = "${infoVO.us_nickname }" readonly><br>
				아이디 : <input type="text" name="us_id" value = "${infoVO.us_id }" readonly><br>
				이메일 : <input type="text" name="us_email" value = "${infoVO.us_email }" readonly><hr>
				  주소 : <input type="text" name="us_addr" value = "${infoVO.us_addr }" readonly><br>
				가입일 : <input type="text" name="us_regdate" value = "${infoVO.us_regdate }" readonly><br>
		  신고누적횟수 : <input type="text" name="us_account" value = "${infoVO.us_account }" readonly><br>
			  정지횟수 : <input type="text" name="us_stop" value = "${infoVO.us_stop }" readonly><br>
				
		
		
		
		<button><a href="/mypage/userDelete"> 회원 탈퇴하기 </a></button>	
		
		<%@ include file="../include/userFooter.jsp" %>
		
		
</body>
</html>