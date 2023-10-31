<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/header.jsp" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">

	$(function() {
		$('.cs_no').click(function() {
			$('#myLargeModal').modal("show");

			$.ajax({
				url : "/admin/FAQInfo",
				data : {
					"cs_no" : $(this).text()
				},
				dataType : "json",
				success : function(data) {
					console.log(data)
					$('input[name=cs_no]').attr('value',data.cs_no)
					$('input[name=cs_title]').attr('value',data.cs_title)
					$('input[name=cs_content]').attr('value',data.cs_content)
					$('input[name=cs_group]').attr('value',data.cs_group)
					$('input[name=cs_board]').attr('value',data.cs_board)
					$('input[name=cs_state]').attr('value',data.cs_state)
					$('input[name=cs_view]').attr('value',data.cs_view)
					$('input[name=cs_regdate]').attr('value',data.cs_regdate)
					$('input[name=cs_update]').attr('value',data.cs_update)
				},
				error : function() {
					console.log("오류");
				}
			});// cs_no click ajax
			
			$('#update').click(function(){
				alert("@@@@@@@@@@@");
				$.ajax({
					url : "/admin/FAQInfoUpdate",
					data : {
						"cs_no" : $('input[name=cs_no]').val(),
						"cs_title" : $('input[name=cs_title]').val(),
						"cs_content" : $('input[name=cs_content]').val(),
						"cs_group" : $('input[name=cs_group]').val(),
						"cs_board" : $('input[name=cs_board]').val(),
						"cs_state" : $('input[name=cs_state]').val,
						"cs_view" : $('input[name=cs_view]').val(),
						"cs_regdate" : $('input[name=cs_regdate]').val(),
						"cs_update" : $('input[name=cs_update]').val()
					},
					success : function(data){
						console.log(data)
					},
					error : function() {
						console.log("오류");
					}
				})//update click ajax
			})//update click
		});// cs_no click
	});//ready
</script>

<h1>/admin/FAQList.jsp</h1>

<div class="row">
	<div class="col-sm-12">
		<table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
			<thead>
				<tr role="row">
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" >글 번호</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" >제목</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" >등록일</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" >조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${vo }">
					<tr role="row" class="odd">
						<td><a class="cs_no">${vo.cs_no }</a></td>
						<td>${vo.cs_title }</td>
						<td>${vo.cs_regdate }</td>
						<td>${vo.cs_view }</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				
			</tfoot>
		</table>
	</div>
</div>

<!-- Modal -->
<div id="myLargeModal" class="modal fade" role="dialog">
	<div class="modal-dialog modal-lg">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">FAQ</h4>
			</div>
			<div class="modal-body" id="ownInfo">
				<div class="form-group">
					<label class="col-sm-2 control-label">글번호</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="cs_no" readonly>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="cs_title">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">내용</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="cs_content">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">등록형태</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="cs_group">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">cs종류</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="cs_board">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">등록상태</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="cs_state">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">조회수</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="cs_view">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">게시일</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="cs_regdate">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">수정일</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="cs_update">
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" name="update" id="update">수정</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>

	</div>
</div>

<%@include file="../include/footer.jsp"%>