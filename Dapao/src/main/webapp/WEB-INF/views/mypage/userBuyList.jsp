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


<h1>views/mypage/userBuyList</h1>
<h1>거래목록</h1>


<c:if test="${empty us_id }">
		<%@ include file="../include/userHeader.jsp" %>
	</c:if>
	<c:if test="${!empty us_id }">
		<%@ include file="../include/userLoginHeader.jsp" %>
	</c:if>
	
 	<!-- <script type="text/javascript">
	function back(){
	      history.back();  // 뒤로가기
	   }
	
	</script>
	 -->
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
		<td>거래번호</td>
		<td>판매자(사업자)</td>
		<td>판매자(회원)</td>
		<td>거래금액</td>
		<td>거래일시</td>
	</tr>
	</thead>
	
			<tbody>
		
	<c:forEach items="${userBuyList }" var="userBuyList">
				<tr>
					<th>${userBuyList.tr_no }</th>
					<th>${userBuyList.tr_sell_ent }</th>
					<th>${userBuyList.tr_sell_us }</th>
					<th>${userBuyList.tr_price }</th>
					<th>${userBuyList.tr_date }</th>
				</tr>
			</c:forEach> 
		</tbody>
	
	
</table>
	
	
	
	
	
	 
	<!--  <button onclick="back()">뒤로가기</button> -->
<%@ include file="../include/userFooter.jsp" %> 
</body>
</html>