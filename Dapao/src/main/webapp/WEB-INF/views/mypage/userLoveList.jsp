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
<h1>내 찜 목록</h1>
<h2>views/mypage/userLoveList</h2>


   <c:if test="${empty us_id }">
      <%@ include file="../include/userHeader.jsp" %>
   </c:if>
   <c:if test="${!empty us_id }">
      <%@ include file="../include/userLoginHeader.jsp" %>
   </c:if>
   
   
   
 <a href="/mypage/userInfo">마이페이지</a>
   <a href="/mypage/userSellList">판매 목록 </a>
   <a href="/mypage/userBuyList">구매목록</a>
   <a href="/mypage/userBuyCoin">대나무페이 결제 목록 </a>
   <a href="/mypage/userReview">내가 쓴 리뷰 </a>
   <a href="/mypage/userCs">고객센터</a>
   <a href="/mypage/userLoveList">찜 목록 </a>
  
  
  
   
   <table border="1">
      <thead>
         <tr>
         
            <th>번호</th>
            <th>제목</th>
            <th>판매자</th>
            <th>상품설명</th>
            <th>상품찜수</th>
         </tr>
      </thead>
      
      <tbody>
      
   <c:forEach items="${userLoveList}" var="userLoveList">
            <tr>
               <th>${userLoveList.it_no }</th>
               <th>${userLoveList.it_title }</th>
               <th>${userLoveList.us_id }</th>
               <th>${userLoveList.it_content }</th>
               <th>${userLoveList.it_love }</th>
            </tr>
         </c:forEach> 
      </tbody>
   </table> 


   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   <%@ include file="../include/userFooter.jsp" %> 

</body>
</html>