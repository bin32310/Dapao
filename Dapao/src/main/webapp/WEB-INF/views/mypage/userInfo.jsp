<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage/userInfo  내 정보 조회 페이지</title>



 <c:if test="${empty us_id }">
      <%@ include file="../include/userHeader.jsp"%>
   </c:if>
   <c:if test="${!empty us_id }">
      <%@ include file="../include/userLoginHeader.jsp"%>
   </c:if>

<script src="/media/jquery-1.12.4.min.js"></script>


<!-- userInfo css -->

<script type="text/javascript">
 


</script>

<!-- userInfo css -->



</head>
<body>


  <!-- //http://localhost:8088/mypage/userInfo -->

  
   <!-- 수정 버튼 누르면 비밀번호 1회 체크 <input type="hidden" name="us_pw" value="${vo.us_pw}" id="us_pw"> -->

   <script type="text/javascript">
   var userTel ='${infoVO.us_pw}';
   console.log("userTel 1: " + userTel);
   
   $(document).ready(function(){
      $("#updateBtn").click(function(e) {
      var enteredPassword = prompt("Please enter your password:");
      
      console.log("infoVO: " + userTel);
      
      if (enteredPassword === userTel) {
       $.ajax({ 
           type: "get",
              url: "/mypage/userInfo",
              data: {
                 password: enteredPassword
              },
              success: function(result) {
                  alert('ok');
                  window.location.href = "/mypage/userInfoUpdate";
              },
              error: function(result) {
                  alert('error');
              }
       });
      }
   });
   });
     </script>
  


 




   <a href="/mypage/userSellList">판매 목록 </a>
   <a href="/mypage/userBuyList">구매목록</a>
   <a href="/mypage/userBuyCoin">대나무페이 결제 목록 </a>
   <a href="/mypage/userReview">내가 쓴 리뷰 </a>
   <a href="/mypage/userCs">고객센터</a>
   <a href="/mypage/userLoveList">찜 목록 </a>

   <br>




	<div class="box box-info">
		<div class="box-header with-border">
			<h3 class="box-title">회원정보 조회</h3>
		</div>


		<form class="form-horizontal">
			<div class="box-body">
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">닉네임</label>
					<div class="col-sm-10">
						<input type="text" name="us_nickname" class="form-control" id="inputEmail3" value="${infoVO.us_nickname }" readonly>
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">아이디</label>
					<div class="col-sm-10">
						<input type="text" name="us_id" class="form-control" id="inputPassword3" value="${infoVO.us_id }" readonly>
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
					<div class="col-sm-10">
						<input type="email" class="form-control" id="inputEmail3" placeholder="Email">
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
					<div class="col-sm-10">
						<input type="email" class="form-control" id="inputEmail3" placeholder="Email">
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
					<div class="col-sm-10">
						<input type="email" class="form-control" id="inputEmail3" placeholder="Email">
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
					<div class="col-sm-10">
						<input type="email" class="form-control" id="inputEmail3" placeholder="Email">
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
					<div class="col-sm-10">
						<input type="email" class="form-control" id="inputEmail3" placeholder="Email">
					</div>
				</div>
				
			</div>

			<div class="box-footer">
				<button type="submit" class="btn btn1">회원정보 수정하기</button>
				<input  class="btn2" type="button" value="회원탈퇴하기" onclick="location.href='/user/userFindId';">
				<input  class="btn3" type="button" value="메인으로" onclick="location.href='/user/userFindId';">
			</div>

		</form>
	</div>













<%-- 
	닉네임 :
	<input type="text" name="us_nickname" value="${infoVO.us_nickname }"
      readonly> --%>
  <%--  <br> 아이디 :
   <input type="text" name="us_id" value="${infoVO.us_id }" readonly> --%>
   <br> 이메일 :
   <input type="text" name="us_email" value="${infoVO.us_email }" readonly>
   <hr>
   전화번호 :
   <input type="text" name="us_tel" value="${infoVO.us_tel }" readonly>
   <hr>
   주소 :
   <input type="text" name="us_addr" value="${infoVO.us_addr }" readonly>
   <br> 가입일 :
   <input type="text" name="us_regdate" value="${infoVO.us_regdate }"
      readonly>
   <br> 신고누적횟수 :
   <input type="text" name="us_account" value="${infoVO.us_account }"
      readonly>
   <br> 정지횟수 :
   <input type="text" name="us_stop" value="${infoVO.us_stop }" readonly>
   <br>



 <button id="updateBtn">내프로필 수정</button> <br>
   <button>
      <a href="/mypage/userDelete"> 회원 탈퇴하기 </a>
   </button>
   <button>
      <a href="/user/userMain">메인으로가기</a>
   </button>
   
   
   <%@ include file="../include/userFooter.jsp"%>


</body>
</html>