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

<script>

        var login = '${login}';
        console.log(login);

        if(login == 'success'){
            alert('로그인 성공');
        }

</script>


<!-- 	
		<h1> /user/userMain.jsp</h1>
		<h1> 유저 메인페이지</h1>
-->

	<c:if test="${us_id.equals('admin') }">
		관리자페이지로 이동 
	
	</c:if>


	<c:if test="${empty us_id }">
		<%@ include file="../include/userHeader.jsp" %>
	</c:if>
	<c:if test="${!empty us_id }">
		<%@ include file="../include/userLoginHeader.jsp" %>
	</c:if>
	
	

	
	<h2> 인기 가게 둘러보기(광고) </h2>
	<c:forEach var="ad" items="${adList}">
		<fieldset>
			<form>
				<a href="../ent/ent?ent_id=${ad.own_id }">
					<img src="/imgfile/${ad.ent_img }" name="ent_img" width="150px" height="150px"> <br>
					<input type="text" value="${ad.ent_name }" name="ent_name">
				</a>
			</form>
		</fieldset>
	</c:forEach> 
	
 	<c:if test="${!empty us_id }">
		<h2> 나의 찜 목록 </h2>
 		<c:forEach var="love" items="${loveList}">
			<fieldset>
				<form action="">
					<a href="../item/itemDetail?it_no=${love.it_no }">
						<img src="/imgfile/${love.it_img }" name="it_img" width="150px" height="150px"> <br>
						<input type="text" value="${love.it_title }" name="it_title"> <br>
						<input type="text" value="${love.it_price }" name="it_price">
					</a>
				</form>
			</fieldset>
		</c:forEach> 
	</c:if>
	
	<h2> 인기 물건 둘러보기 </h2>
	
 	<c:forEach var="item" items="${itemList}">
		<a href="../item/itemDetail?it_no=${item.it_no }">
			<img src="/imgfile/${item.it_img }" name="it_img" width="150px" height="150px" > <br>
			<input type="text" value="${item.it_title }" name="it_title"> <br>
			<input type="text" value="${item.it_price }" name="it_price">
		</a> 
	</c:forEach> 
	
	<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">체험단을 모집합니다</h4>
			</div>
			<div class="modal-body">
				가게상호명 <br>
				<h3 class="ent_name"></h3>
				체험단 내용<br>
				<h3 class="exp_content"></h3>
				체험단 유의 사항<br>
				<h3 class="exp_notice"></h3>
				신청인원/체험단모집인원<br>
				<h3 class="exp_psn_ch exp_psn"></h3>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href='';">신청하기</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div> 

<script type="text/javascript">
$(function(){
	$('#myModal').modal("show");
	$.ajax({
		url : "${contextPath}/ad/modalShow",
		dataType : "json",
		success : function(data){
			console.log(data);
			$.each(data,function(index,exp){
				$.each(exp.entList,function(idx,ent){
					$('.ent_name').append(ent.ent_name);
				})
				$('.exp_content').append(exp.exp_content);
				$('.exp_notice').append(exp.exp_notice);
				$('.exp_psn_ch').append(exp.exp_psn_ch);
				$('.exp_psn').append("/"+exp.exp_psn);
			});
			
		},
		error : function(){
			alert("@@@@@@@@@@@");
		}
	});//ajax
 });//ready
</script>
	
	<%@ include file="../include/userFooter.jsp" %>
	
	
</body>
</html>