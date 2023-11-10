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
				<div class="form-group">
					<label class="col-sm-2 control-label">??</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="ac_no" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">신고자</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="us_id"><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">피신고자</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="id"><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">상품번호</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="ac_item"><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">신고사유</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="ac_cate"><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">신고내용</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="ac_content"><br>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div> 

<script type="text/javascript">
$(function(){
	$('#myModal').modal("show");
	$.ajax({
		url : "${contextPath}/ad/modalShow"
		dataType : "json"
		success : function(data){
			console.log(data);
		}
	});
 });//ready
</script>
	
	<%@ include file="../include/userFooter.jsp" %>
	
	
</body>
</html>