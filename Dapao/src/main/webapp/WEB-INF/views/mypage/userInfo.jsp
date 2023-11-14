<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/media/jquery-1.12.4.min.js"></script>
</head>
<body>

   <h1>views/mypage/userInfo</h1>
   <h1>마이페이지-정보조회</h1>

   <c:if test="${empty us_id }">
      <%@ include file="../include/userHeader.jsp"%>
   </c:if>
   <c:if test="${!empty us_id }">
      <%@ include file="../include/userLoginHeader.jsp"%>
   </c:if>


   <!-- <button><a href="/mypage/userInfoUpdate">내프로필 수정 </a></button> -->
   <button id="updateBtn">내프로필 수정</button>

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
   <a href="/mypage/userBuyCoin">대나무페이 결제 목록 </a>
   <a href="/mypage/userReview">내가 쓴 리뷰 </a>
   <a href="/mypage/userCs">고객센터</a>
   <a href="/mypage/userLoveList">찜 목록 </a>

   <br>
   <!-- 수정 버튼 누르면 비밀번호 1회 체크 <input type="hidden" name="us_pw" value="${vo.us_pw}" id="us_pw"> -->

   닉네임 :
   <input type="text" name="us_nickname" value="${infoVO.us_nickname }"
      readonly>
   <br> 아이디 :
   <input type="text" name="us_id" value="${infoVO.us_id }" readonly>
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




   <button>
      <a href="/mypage/userDelete"> 회원 탈퇴하기 </a>
   </button>
   <button>
      <a href="/user/userMain">확인 </a>
   </button>
   <%@ include file="../include/userFooter.jsp"%>


</body>
</html>