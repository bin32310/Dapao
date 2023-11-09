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
<h1>내가 쓴 리뷰 목록</h1>
<h2>views/mypage/userReview</h2>


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
	 
	
	
	
<table border="1">
		<thead>
			<tr>
			
				<th>번호</th>
				<th>판매자(사업자)</th>
				<th>판매자(회원)</th>
				<th>내용</th>
				<th>별점</th>
				<th>등록날짜</th>
			</tr>
		</thead>
		
		<tbody>
			
				<c:forEach items="${userReview }" var="userReview">
				<tr>
					<td>${userReview.rv_no }</td>
					<td>${userReview.rv_own_id }</td>
					<td>${userReview.rv_us_id }</td>
					<td>${userReview.rv_content }</td>
					<td>${userReview.rv_star }</td>
					<td>${userReview.rv_regdate }</td>
				</tr>
				</c:forEach>
			
		</tbody>
		
	</table> 
 

<input type="button" onclick="back()" value="뒤로가기">





 
<%@ include file="../include/userFooter.jsp" %> 

</body>
</html>