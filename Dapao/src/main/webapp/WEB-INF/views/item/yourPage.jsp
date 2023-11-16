<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.profile {
	padding: 2%;
    margin-bottom: 10px;
    border: solid 1px #ababab;
    text-align: left;
    background-color: #f7f7f7;
    margin-left: 12%;
    margin-right: 10%;
    height: 250px;
}

#container{
	display: float;
}

.item2 {
	float: left;
	padding-top: 2%;
	width: 250px;
	text-align: center;
	margin-right: 10px;
	margin-bottom: 10px;
	background-color: #f7f7f7;
	border: solid 1px #ababab;
}

.review {
    padding: 2%;
    margin-bottom: 10px;
    border: solid 1px #ababab;
    text-align: left;
    background-color: #f7f7f7;
    margin-left: 12%;
    margin-right: 10%;
}

#title {
	font-size: 25px;
}

img[name=it_img] {
	margin-bottom: 20px;
}

img {
	width: 150px;
	height: 150px;
}

.price {
	margin-top: 4px;
	margin-bottom: 60px;
}

.products {
	margin-left: auto;
	margin-right: auto;
	padding: 0;
	text-align: center;
}

.item{
	float:left;
	margin-left: 30px;
}

#box-body {
	border-top-left-radius: 0;
	border-top-right-radius: 0;
	border-bottom-right-radius: 3px;
	border-bottom-left-radius: 3px;
	padding-left: 12%;
	padding-right: 10%;
}

input[type=text] {
	font-size: 15px;
	border-style: none;
}

input[id=inputcolor]{
	background-color: #f7f7f7;
}

#img{
	float:left;
}

input[name=it_price]{
	font-size: 20px;
	text-align: center;
}
</style>
<body>

	<c:if test="${empty us_id }">
		<%@ include file="../include/userHeader.jsp"%>
	</c:if>
	<c:if test="${!empty us_id }">
		<%@ include file="../include/userLoginHeader.jsp"%>
	</c:if>

	<!-- 		<h1>/item/yourPage</h1>
		<h1>상대방 프로필</h1> -->

	<a href="/user/userBuy">구매 목록 </a>
	<div class="profile">
		<label>프로필 사진</label><br>
		<img src="/resources/itemIMG/pro.png" name="it_img" id="img">
		<div class="item">
			닉네임 : <input type="text" name="us_name" value="${yourInfo.us_nickname }" id="inputcolor"><br> 
			주소 : <input type="text" name="us_addr" value="${yourInfo.us_addr }" id="inputcolor"><br>
		</div>
	</div>
	<div class="box-body" id="box-body">
		<div class="products">
			<label id="title">판매중인 물건</label> <br>
			<div class="box">
				<c:forEach var="yi" items="${yourItemVO }">
					<div class="item2">
						<c:if test="${yi.it_state != 2 && yi.it_state != 3 }">
							<img src="/imgfile/${yi.it_img }" name="it_img" width="150px" height="150px">
							<div class="product">
								<input type="text" name="it_title" value="${yi.it_title }" id="inputcolor">
							</div>
							<div class="price">
								<input type="text" name="it_price" value="${yi.it_price }" id="inputcolor">
							</div>
						</c:if>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<hr>
	<div class="box-body">
		<div class="products">
			<label id="title">리뷰 </label> <br>
			<div id="container">
				<c:forEach var="rv" items="${reviewVO}">
						<div class="review">
							<div class="nickname">
								닉네임 : <input type="text" name="us_name" value="${rv.us_nickname }" id="inputcolor">
							</div>
							<div class="reviewstar">
								별점 : <input type="text" name="rv_star" value="${rv.rv_star }" id="inputcolor">
							</div>
							<div class="reviewcontent">
								리뷰내용 : <input type="text" name="rv_content" value="${rv.rv_content }" id="inputcolor">
							</div>
						</div>
				</c:forEach>
			</div>
		</div>
	</div>


	<%@ include file="../include/userFooter.jsp"%>


</body>
</html>