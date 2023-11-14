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


<h1>views/mypage/userBuyCoin</h1>
<h1>구매목록</h1>

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
		<td>결제번호</td>
		<td>결제금액</td>
		<td>결제종류</td>
		<td>결제일시</td>
		<td>결제수단</td>
	</tr>
	</thead>
	
			<tbody>
		
	<c:forEach items="${userBuyCoin}" var="userBuyCoin">
				<tr>
					<th>${userBuyCoin.pay_id }</th>
					<th>${userBuyCoin.pay_price }</th>
					<th>${userBuyCoin.pay_kind }</th>
					<th>${userBuyCoin.pay_date }</th>
					<th>${userBuyCoin.pay_method }</th>
				</tr>
			</c:forEach> 
		</tbody>
	
	
</table>

 <button onclick="back()">뒤로가기</button>
<%@ include file="../include/userFooter.jsp" %> 

</body>
</html>