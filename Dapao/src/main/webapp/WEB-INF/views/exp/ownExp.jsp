<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>

<h1>사업자 - 체험단 신청페이지</h1>

<style>
#expForm {
	position: relative;
	border-radius: 3px;
	background: #ffffff;
	border-top: 3px solid #d2d6de;
	margin-bottom: 20px;
	width: 100%;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
	padding: 30px;
}
</style>

<!-- 사업자아이디(세션제어)/체험단 제목/내용/모집인원/유의사항 -->
<form action="ownExpPOST" method="post" name="expSubit" id="expSubmit">
	<div id="expForm">
		<div class="form-group">
			<label>사업자 아이디 : ${id }</label>
		</div>
		<div class="form-group">
			<label>신청 제목</label> <input type="text" class="form-control"
				name="exp_title" id="exp_content" required="required"
				placeholder="광고에 게시될 제목을 기입해주세요">
		</div>
		<div class="form-group">
			<label>모집인원</label> <select class="form-control" name="exp_psn"
				id="exp_psn">
				<option>3</option>
				<option>5</option>
				<option>10</option>
				<option>15</option>
				<option>20</option>
			</select>
		</div>
		<div class="form-group">
			<label>신청 내용</label>
			<textarea class="form-control" rows="10" required="required"
				name="exp_content" placeholder="광고에 게시될 내용을 기입해주세요"></textarea>
		</div>
		<div class="form-group">
			<label>유의사항</label>
			<textarea class="form-control" rows="7" required="required"
				name="exp_notice" placeholder="광고에 게시될 유의사항을 기입해주세요"></textarea>
		</div>
		<input type="hidden" name="own_id" value="1">
		<%-- 	<input type="hidden" name="own_id" value="${id }"> --%>
		<input type="button" id="btnExp" value="신청하기">
	</div>
</form>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog modal-sm3">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">체험단 결제</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label class="col-sm-2 control-label">사업자 아이디</label>
					<div class="col-sm-10">
						<input type="text" value="${id }" class="form-control" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">신청 제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="exp_content2" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">모집 인원</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="exp_psn2" readonly><br>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<input type="button" class="expSubmit" value="결제하기"
					onclick="requestPay()">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript">

	// 시간
	var today = new Date();
	var hours = today.getHours(); // 시
	var minutes = today.getMinutes(); // 분
	var seconds = today.getSeconds(); // 초
	var milliseconds = today.getMilliseconds();
	var makeMerchantUid = hours + minutes + seconds + milliseconds;

	// 신청하기 눌럿을때 모달 -> 결제창
	$('#btnExp').click(function() {
		$('#myModal').modal('show');
		$('#exp_content2').val($('#exp_content').val());
		$('#exp_psn2').val($('#exp_psn').val());
	});
	
	// 결제연동
	IMP.init('imp73450751');
	function requestPay() {
		// var id = "${sessionScope.id}";
		var id = "1";
		console.log(id);
		// 결제 api 실행
		IMP.request_pay({
			pg : "html5_inicis.INIpayTest",
			pay_method : "card",
			merchant_uid : "IMP"+makeMerchantUid,
			name : $('#exp_content').val(),
			amount : 100, //  $('#price').val()
			buyer_tel : "01011111111",	// 사업자 전화번호
		}, function(rsp) { // callback
			//rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
			if (rsp.success) {
				// 결제하기 눌렀을때 -> 결제창 + submit동작 + 결제테이블 처리
				$.ajax({
					url : "ownExpSuccess",
					data : {
						imp_uid : rsp.imp_uid,
						pay_uid : rsp.merchant_uid,
						pay_price : 100,
						pay_kind : "체험단",
						pay_con : "결제완료",
						pay_pg : "카카오",
						pay_method : "카드",
						pay_card : "카카오페이",
						own_id : "1"
					},
					dataType : "json",
					success : function(data) {
						console.log(data);
						if (data == 1) {
							document.getElementById('expSubmit').submit();
							alert("결제완료");
							$('#myModal').modal('hide');
						}
					}
				});
			} else {
				alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
				$('#myModal').modal('hide');
			}
		});
	} //requestPay()
</script>


<%@ include file="../include/footer.jsp"%>