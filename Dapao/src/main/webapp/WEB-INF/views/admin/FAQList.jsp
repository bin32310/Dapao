<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/header.jsp" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<h1>/admin/FAQList.jsp</h1>

<div class="box">
	<div class="box-header with-board">
		<h3 class="box-title">FAQ 목록</h3>
	</div>
	<div class="box-body">
		<table class="table table-bordered">
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
						<td><button type="button" name="upload" class="upload">등록</button>
							<button type="button" name="remove" class="remove">등록해제</button></td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				
			</tfoot>
		</table>
	</div>
	<div class="box-footer clearfix">
		<ul class="pagination pagination-sm no-margin pull-right">

			<c:if test="${pageVO.prev }">
				<li><a href="/admin/FAQList?page=${pageVO.startPage-1 } ">←</a></li>
			</c:if>

			<c:forEach var="i" begin="${pageVO.startPage }" end="${pageVO.endPage }" step="1">
				<li ${pageVO.cri.page == i? 'class="active"':'' }><a href="/admin/FAQList?page=${i }">${i }</a></li>
			</c:forEach>

			<c:if test="${pageVO.next }">
				<li><a href="/admin/FAQList?page=${pageVO.endPage+1 }">→</a></li>
			</c:if>
		</ul>
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
			<div class="modal-body">
				<div class="form-group">
					<label class="col-sm-2 control-label">글번호</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="cs_no" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="cs_title"><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">내용</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="cs_content"><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">등록형태</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="cs_group"><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">cs종류</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="cs_board"><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">등록상태</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="cs_state"><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">조회수</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="cs_view"><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">게시일</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="cs_regdate"><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">수정일</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="cs_update"><br>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" name="update" class="update">수정</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>


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
					$('input[name=cs_no]').val(data.cs_no)
					$('input[name=cs_title]').val(data.cs_title)
					$('input[name=cs_content]').val(data.cs_content)
					$('input[name=cs_group]').val(data.cs_group)
					$('input[name=cs_board]').val(data.cs_board)
					$('input[name=cs_state]').val(data.cs_state)
					$('input[name=cs_view]').val(data.cs_view)
					$('input[name=cs_regdate]').val(data.cs_regdate)
					$('input[name=cs_update]').val(data.cs_update)
				},
				error : function() {
					console.log("오류");
				}
			});// cs_no click ajax
			
			$('.update').click(function(){
				$.ajax({
					url : "/admin/FAQInfoUpdate",
					data : {
						"cs_no" : $('input[name=cs_no]').val(),
						"cs_title" : $('input[name=cs_title]').val(),
						"cs_content" : $('input[name=cs_content]').val()
					},
					dataType : "json",
					success : function(data) {
						console.log(data)
						alert("수정완료");
						location.replace("/admin/FAQList");
					},
					error : function() {
						console.log("오류");
					}
				});//update click ajax
			});//update click
			$('.upload').click(function(){
				$.ajax({
					url : "/admin/FAQUpload",
					data : {
						"cs_no" : $('input[name=cs_no]').val()
					},
					dataType : "json",
					success : function(data){
						console.log(data)
						alert("FAQ - 등록완료")
						location.replace("/admin/FAQList");
					}
				}); // upload click ajax
			});// upload click
			$('.remove').click(function(){
				$.ajax({
					url : "/admin/FAQRemove",
					data : {
						"cs_no" : $('input[name=cs_no]').val()
					},dataType : "json",
					success : function(data){
						console.log(data)
						alert("FAQ - 등록해제완료")
						location.replace("/admin/FAQList");
					}
					
				});// remove click ajax
			});// remove click
		});// cs_no click
	});//ready
</script>


<%@include file="../include/footer.jsp"%>