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

	<c:if test="${us_id.equals(null) } ||${empty us_id }">
		<c:redirect url="../user/userLogin"/>
	</c:if>
	<c:if test="${!empty us_id }">
		<%@ include file="../include/userLoginHeader.jsp" %>
	</c:if>
	
	
	<h1>/item/coinharge.jsp</h1>
	<h1> 대나무 페이 충전 </h1>
	
	현재 금액 <br>
	<input type="text" value="${us_coin }"> <br> <br>
	<a href="/item/coinRefund"> 환불하기 </a>
	
	<form action="">
	 
		충전금액 :  <br>
		5,000<input type="radio" name="charge_price" value="5000" > 
		10,000<input type="radio" name="charge_price" value="10000" > <br>
		20,000<input type="radio" name="charge_price" value="20000" >
		30,000<input type="radio" name="charge_price" value="30000" > <br>
		50,000<input type="radio" name="charge_price" value="50000" >
		100,000<input type="radio" name="charge_price" value="100000" > <br>
		200,000<input type="radio" name="charge_price" value="200000" > 
		300,000<input type="radio" name="charge_price" value="300000" > <br>
		직접입력하기<input type="radio" name="charge_price" value="" > <br>

		
		<input type="submit" value="결제하기">
	</form>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>