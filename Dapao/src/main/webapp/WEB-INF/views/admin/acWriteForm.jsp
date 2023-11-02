<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

	<h1>/admin/FAOWriteFrom.jsp.jsp</h1>

<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title">신고 글쓰기</h3>
	</div>
	<form action="/admin/csWrite " method="get" role="form">
		<div class="box-body">
			<div class="row">
				<div class="col-lg-6">
					<label>신고자</label>
					<input type="text" class="form-control" name="id">
				</div>
				<div class="col-lg-6">
					<label>피신고자</label>
					<input type="text" class="form-control" name="id">
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<label>신고사유</label>
					<select class="form-control select2 select2-hidden-accessible" style="width: 100%;" data-select2-id="1" tabindex="-1" aria-hidden="true" name="cs_group">
					<option selected="selected" data-select2-id="3" value="0">신고사유를 선택해주세요.</option>
					<option data-select2-id="40" value="1">사기행위</option>
					<option data-select2-id="40" value="2">모조품판매</option>
					<option data-select2-id="40" value="3">거래금지품목 판매</option>
					<option data-select2-id="40" value="4">게시물 내 욕설,비방</option>
					<option data-select2-id="40" value="5">기타사유</option>
				</select>
				</div>
				<div class="col-lg-6">
					<label>신고일</label>
					<input type="text" class="form-control" name="ac_regdate">
				</div>
			</div>
			<div class="form-group">
				<label>내 용</label>
				<textarea class="form-control" name="cs_content" rows="3" placeholder="내용을 작성하시오"></textarea>
			</div>

		</div>

		<div class="box-footer">
			<button type="submit" class="btn btn-info">글쓰기</button>
		</div>
	</form>
</div>

<script type="text/javascript">
	$(function(){
		$('input[name=ac_regdate]').val(new Date(yyyy-mm-dd))
	});
</script>
<%@include file="../include/footer.jsp" %>