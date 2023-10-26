<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="./jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>


	<h1>allUserInfo</h1>

	<table border="1">
		<tr>
			<th>아이디</th>
			<th>닉네임</th>
			<th>이름</th>
			<th>주소</th>
			<th>전화번호</th>
			<th>신고누적</th>
			<th>회원상태</th>
		<tr>
			<c:forEach var="list" items="${userList }">
				<tr>
					<td><a class="userInfo">${list.us_id }</a></td>
					<td>${list.us_nickname }</td>
					<td>${list.us_name }</td>
					<td>${list.us_addr }</td>
					<td>${list.us_tel }</td>
					<td>${list.us_account }</td>
					<td class="us_state">${list.us_state }</td>
				<tr>
			</c:forEach>
	</table>

	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">회원 정보</h4>
				</div>
				<div class="modal-body">
					<p></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

	<script type="text/javascript">
		$(function() {
			$('.userInfo').click(function() {
				$('#myModal').modal("show");
				
				var userId = $(this).text();
				console.log("us_id : "+userId);		
					$.ajax({
						url:"/admin/userInfo",
						data: {"us_id": userId},
						success:function(data){
							console.log(data);
							console.log("성공")
						},
						error:function(){
							console.log("오류");
						}
					});
			});
		});	

		if($('.us_state').text() == 0){
			$('.us_state').text("정상");
		}	
		if($('.us_state').text() == 1){
			$('.us_state').text("정지");
		}		
		if($('.us_state').text() == 2){
			$('.us_state').text("탈퇴");
		};
		

	</script>


</body>
</html>