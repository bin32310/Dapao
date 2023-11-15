<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<c:if test="${empty us_id }">
	<%@ include file="../include/userHeader.jsp" %>
</c:if>
<c:if test="${!empty us_id }">
	<%@ include file="../include/userLoginHeader.jsp" %>
</c:if>

<style type="text/css">

.cateItemVODiv{
	width : 300px;
	height: 300px;
	float : left;

}

</style>
	
</head>
<body>

<!-- 	<h1>/item/itemCateSearch.jsp</h1>
	<h1>검색시 나타나는 페이지</h1> -->
	카테고리 : ${it_cate_search}
	<div>
		<c:forEach var="it" items="${cateItemVO}">
			<fieldset>
			<form action="" class="cateItemVODiv">
				<a href="../item/itemDetail?it_no=${it.it_no }">
					<img src="/imgfile/${it.it_img }" width="150px" height="150px"> <br>
					<input type="text" value="${it.it_title}">  <br>
					<input type="text" value="${it.it_price}">
					<input type="text" value="${it.it_regdate}">
					<input type="hidden" value="${it.it_state }" name="it_state">
					<!-- 글 상태 표시 -->
					<c:choose>
						<c:when test="${it.it_state == 0 }">
							<input type="text" value="판매중"> <br>
						</c:when>
						<c:when test="${it.it_state == 1 }">
							<input type="text" value="예약중"> <br>
						</c:when>
						<c:when test="${it.it_state == 2 }">
							<input type="text" value="판매완료"> <br>
						</c:when>
						<c:otherwise>
							<input type="text" value="접근이상함"> <br>			
						</c:otherwise>
					</c:choose>
				</a>
			</form>
			</fieldset>
		</c:forEach>
	</div>

<%@ include file="../include/userFooter.jsp" %>
	


</body>
</html>