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

		<c:if test="${empty us_id }">
		<%@ include file="../include/userHeader.jsp" %>
	</c:if>
	<c:if test="${!empty us_id }">
		<%@ include file="../include/userLoginHeader.jsp" %>
	</c:if>
	

<h1>내가 쓴 리뷰 목록(판매자 = 회원)</h1>
<h2>views/mypage/userReviewUs</h2>


<table>
		<thead>
			<tr>
			
				<th>리뷰번호</th>
				<th>판매자</th>
				<th>내용</th>
				<th>별점</th>
				<th>등록날짜</th>
			</tr>
		</thead>
		
		<tbody>
		
	<c:forEach items="${userReviewUs}" var="userReviewUs">
				<tr>
					<th>${userReviewUs.rv_no }</th>
					<th>${userReviewUs.rv_Us_id }</th>
					<th>${userReviewUs.rv_content }</th>
					<th>${userReviewUs.rv_star }</th>
					<th>${userReviewUs.rv_regdate }</th>
				</tr>
			</c:forEach> 
		</tbody>
	</table> 

<%@ include file="../include/userFooter.jsp" %> 

</body>
</html>