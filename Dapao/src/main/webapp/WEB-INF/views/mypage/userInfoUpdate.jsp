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
<h1>내 프로필 수정</h1>
<h2>views/mypage/userInfoUpdate</h2>

      <c:if test="${empty us_id }">
      <%@ include file="../include/userHeader.jsp" %>
   </c:if>
   <c:if test="${!empty us_id }">
      <%@ include file="../include/userLoginHeader.jsp" %>
   </c:if>
   
   
      <a href="/mypage/userSellList">판매 목록 </a>
      <a href="/mypage/userBuy">구매 목록 </a>
      <a href="/mypage/userReview">내가 쓴 리뷰 </a>
      <a href="/mypage/userCs">고객센터</a>
      <a href="/mypage/userLoveList">찜 목록 </a> 
      
      <!-- 여기서부터 다시 해야함 -->
      
   <script type="text/javascript">
   function back(){
         history.back();  // 뒤로가기
      }
   
   
   </script>
   
 
      
      
      
      <fieldset>
<legend>회원정보수정</legend>
   <form action="" method="post" name="fr">
        
       닉네임<input type="text" name="us_nickname" value="${vo.us_nickname }"><br>
       아이디<input type="text" name="us_id" value="${vo.us_id }" readonly><br>  
      이름 <input type="text" name="us_name" value="${vo.us_name }" readonly><br>
      이메일 <input type="text" name="us_email" value="${vo.us_email }" readonly><br>
      전화번호<input type="text" name="us_tel" value="${vo.us_tel }"><br>
      주소<input type="text" name="us_addr" value="${vo.us_addr }"><br>
      프로필 이미지<input type="file" id="profile" accept="image/png, image/jpeg"> <br>
      새 비밀번호 <input type="password" name="us_pw" placeholder="새 비밀번호를 입력하세요" ><br>
      새 비밀번호확인<input type="password" name="us_pw1" placeholder="새 비밀번호를 확인하세요" ><br>
      
      <input type="submit" class="btn" value="회원정보 수정">
       <button onclick="back()">뒤로가기</button>
   </form>
</fieldset>
</body>
      

      
      
      
      
      
   

<%@ include file="../include/userFooter.jsp" %> 

</body>
</html>