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
		
		
		
		
	<button><a href="/user/userInfoUpdate">내프로필 수정 </a></button>	
	
		<a href="/user/userSell">판매 목록 </a>
		<a href="/user/userBuy">구매 목록 </a>
		<a href="/user/userReview">내가 쓴 리뷰 </a>
		<a href="/user/userCs">고객센터</a>
		<a href="/user/userLove">찜 목록 </a>
		
		
		<c:forEach var="vo" items="infoVO">
			프로필 사진 <br>
				
				닉네임 : <input type="text" name="us_name" value = "${vo.us_nickname }"><br>
				아이디 : <input type="text" name="us_id" value = "${vo.us_id }"><br>
				이메일 : <input type="text" name="us_email" value = "${vo.us_email }"><hr>
				  주소 : <input type="text" name="us_addr" value = "${vo.us_addr }"><br>
				가입일 : <input type="text" name="us_addr" value = "${vo.us_regdate }"><br>
		  신고누적횟수 : <input type="text" name="us_addr" value = "${vo.us_account }"><br>
			  정지횟수 : <input type="text" name="us_addr" value = "${vo.us_stop }"><br>
				
		</c:forEach>
		
		
		
		
		
		
		
</body>
</html>