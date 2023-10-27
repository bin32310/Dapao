<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<script type="text/javascript">

	$(function() {
		$('.a').click(function() {
			$('#myModal').modal("show");
		});

		if ($('.own_state').text() == 0) {
			$('.own_state').text("정상");
		}
		if ($('.own_state').text() == 1) {
			$('.own_state').text("정지");
		}
		if ($('.own_state').text() == 2) {
			$('.own_state').text("탈퇴");
		}

		$('.ownInfo').click(function() {
			$('#myModal').modal("show");

			var ownId = $(this).text();
			$.ajax({
				url : "/admin/ownInfo",
				data : {
					"own_id" : ownId
				},
				dataType : "json",
				success : function(data) {
					$('#ownInfo').text(data.own_id + data.own_name);
				},
				error : function() {
					console.log("오류");
				}
			});
		});
	});
</script>

<table border="1">
	<tr>
		<th>사업자 아이디</th>
		<th>사업자 이름</th>
		<th>주소</th>
		<th>전화번호</th>
		<th>신고누적</th>
	</tr>
	<c:forEach var="vo" items="${vo }">
		<tr>
			<td><a class="ownInfo">${vo.own_id }</a></td>
			<td>${vo.own_name }</td>
			<td>${vo.ent_addr }</td>
			<td>${vo.own_tel }</td>
			<td>${vo.ent_account }</td>
		</tr>
	</c:forEach>
</table>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">사업자 정보</h4>
      </div>
      <div class="modal-body" id="ownInfo">
        ${ownInfo.own_id }
        ${ownInfo.own_name }
        ${ownInfo.own_pw }
        ${ownInfo.own_tel }
        ${ownInfo.own_email }
        ${ownInfo.own_state }
		${ownInfo.ent_name }
		${ownInfo.ent_cate }
		${ownInfo.ent_addr }
		${ownInfo.ent_mo }
		${ownInfo.ent_file }
		${ownInfo.ent_of }
		${ownInfo.ent_notice }
		${ownInfo.ent_info }
		${ownInfo.ent_img }
		${ownInfo.ent_time }
		${ownInfo.ent_account }
		${ownInfo.ent_stop }
		
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>



</body>
</html>