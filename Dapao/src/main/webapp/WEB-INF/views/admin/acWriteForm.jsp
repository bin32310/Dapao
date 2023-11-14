<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>

<h1>/admin/acWriteForm.jsp</h1>

<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title">신고 글쓰기</h3>
	</div>
	<form action="/admin/acWrite " method="post" role="form">
		<div class="box-body">
			<div class="row">
				<div class="col-lg-6">
					<label>신고자</label> <input type="text" class="form-control" name="us_id" value="${us_id }">
				</div>
				<div class="col-lg-6">
					<label>피신고자</label> 
					<input type="text" class="form-control" value="${us_nickname+prod.own_id }"> 
					<input type="hidden" name="id" value="${item.us_id+prod.own_id }">
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<label>상품번호</label> <input type="text" class="form-control" name="ac_item" value="${item.it_no }">
				</div>
				<div class="col-lg-6">
					<label>신고일</label> <input type="text" class="form-control" name="ac_regdate">
				</div>
			</div>
			<div class="form-group">
				<label>신고사유</label> <select class="form-control select2 select2-hidden-accessible" style="width: 100%;" data-select2-id="1" tabindex="-1" aria-hidden="true" name="ac_cate">
					<option selected="selected" data-select2-id="3" value="0">신고사유를 선택해주세요.</option>
					<option data-select2-id="40" value="사기행위">사기행위</option>
					<option data-select2-id="40" value="모조품판매">모조품판매</option>
					<option data-select2-id="40" value="거래금지품목 판매">거래금지품목 판매</option>
					<option data-select2-id="40" value="게시물 내 욕설,비방">게시물 내 욕설,비방</option>
					<option data-select2-id="40" value="기타사유">기타사유</option>
				</select>
			</div>
			<div class="form-group">
				<label>내 용</label>
				<textarea class="form-control" id="cs_content" name="cs_content" rows="3" placeholder="내용을 작성하시오"></textarea>
			</div>
		</div>
		<div class="box-footer">
			<button type="submit" class="btn btn-info" id="write">신고하기</button>
		</div>
	</form>
</div>

<script type="text/javascript">
	$(function() {
		var today = new Date();
		var year = today.getFullYear();
		var month = ('0' + (today.getMonth() + 1)).slice(-2);
		var day = ('0' + today.getDate()).slice(-2);
		var date = year + '-' + month + '-' + day;
		$('input[name=ac_regdate]').val(date);

		$('#write').click(
				function() {
					if ($('select[name=ac_cate]').val() == 0) {
						alert("신고사유를 선택해주세요");
					}
					if ($('select[name=ac_cate]').val() == "기타사유"
							&& $('#cs_content').val() == "") {
						alert("내용을 입력해주세요");
					}
				});
	});//ready
</script>
<%@include file="../include/footer.jsp"%>