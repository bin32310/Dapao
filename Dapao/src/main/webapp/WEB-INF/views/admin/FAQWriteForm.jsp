<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

	<h1>/admin/FAOWriteFrom.jsp.jsp</h1>

<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title">FAQ 글쓰기</h3>
	</div>
	<form action="/admin/FAQWrite " method="get" role="form">
		<div class="box-body">
			<div class="form-group" data-select2-id="38">
				<select class="form-control select2 select2-hidden-accessible" style="width: 100%;" data-select2-id="1" tabindex="-1" aria-hidden="true" name="cs_group">
					<option selected="selected" data-select2-id="3" data-name="cs_board" value="0">회원</option>
					<option data-select2-id="40" data-name="cs_board"  value="1">사업자</option>
				</select>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">제 목</label> 
				<input type="text" class="form-control" name="cs_title" id="exampleInputPassword1" placeholder="제목을 작성하시오">
			</div>
			<div class="form-group">
				<label>내 용</label>
				<textarea class="form-control" name="cs_content" rows="20" placeholder="내용을 작성하시오"></textarea>
			</div>

		</div>

		<div class="box-footer">
			<button type="submit" class="btn btn-info">글쓰기</button>
		</div>
	</form>
</div>
<%@include file="../include/footer.jsp" %>