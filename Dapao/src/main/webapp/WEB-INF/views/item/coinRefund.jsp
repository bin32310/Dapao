<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="../include/userHeader.jsp" %>
	
	<h1>/item/coinharge.jsp</h1>
	<h1> 대나무 페이 충전 </h1>
	
	현재 금액 <br>
	10,000원 <br> <!-- ${us_coin} 로그인 시 세션에 추가 -->
	<a href="/item/coinRefund"> 환불하기 </a>
	
	<form action="">
	 
		충전금액 :  <br>
		5,000<input type="radio" name="charge_price" value="5000" > 
		10,000<input type="radio" name="charge_price" value="10000" > <br>
		20,000<input type="radio" name="charge_price" value="20000" >
		30,000<input type="radio" name="charge_price" value="30000" > <br>
		50,000<input type="radio" name="charge_price" value="50000" >
		100,000<input type="radio" name="charge_price" value="100000" >
		200,000<input type="radio" name="charge_price" value="200000" > <br>
		300,000<input type="radio" name="charge_price" value="300000" >
		500,000<input type="radio" name="charge_price" value="500000" > <br>
		직접입력하기<input type="radio" name="charge_price" value="" > <br>

	
		ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ  <br>
		
		<input type="text" value="현재 대나무 페이 금액"> <br>
		 - <input type="text" value="상품 가격"> <br>
			
		
		
		<input type="submit" value="결제하기">
	</form>
	
</body>
</html>