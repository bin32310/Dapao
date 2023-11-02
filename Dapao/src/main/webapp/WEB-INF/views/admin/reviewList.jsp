<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/header.jsp" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<h1>/admin/reviewList.jsp</h1>

<div class="box">
	<div class="box-header with-board">
		<h3 class="box-title">리뷰 목록</h3>
	</div>
	<div class="box-body">
		<table class="table table-bordered">
			<thead>
				<tr role="row">
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" >리뷰 번호</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" >판매자</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" >구매자</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" >별점</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" >등록날짜</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" >삭제날짜</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" >리뷰상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${vo }">
					<tr role="row" class="odd">
						<td><a class="rv_no">${vo.rv_no }</a></td>
						<td>${vo.rv_own_id+vo.rv_us_id}</td>
						<td>${vo.rv_buy_id}</td>
						<td>
							<c:forEach begin="1" end="${vo.rv_star}" >
								<label>⭐</label>
							</c:forEach>
						</td>
						<td>${vo.rv_regdate }</td>
						<td>${vo.rv_outdate }</td>
						<c:choose>
							<c:when test="${vo.rv_state == 0 }">
								<td>정상</td>
							</c:when>
							<c:when test="${vo.rv_state == 1 }">
								<td>삭제</td>
							</c:when>
						</c:choose>
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
				<li><a href="/admin/reviewList?page=${pageVO.startPage-1 } ">←</a></li>
			</c:if>

			<c:forEach var="i" begin="${pageVO.startPage }" end="${pageVO.endPage }" step="1">
				<li ${pageVO.cri.page == i? 'class="active"':'' }><a href="/admin/reviewList?page=${i }">${i }</a></li>
			</c:forEach>

			<c:if test="${pageVO.next }">
				<li><a href="/admin/reviewList?page=${pageVO.endPage+1 }">→</a></li>
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
				<h4 class="modal-title">리뷰관리</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label class="col-sm-2 control-label">리뷰번호</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="rv_no" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">판매자</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="rv_id"><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">구매자</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="rv_buy_id"><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">내용</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="rv_content"><br>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" name="delete" class="delete">삭제</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">

	$(function() {
		$('.rv_no').click(function() {
			$('#myLargeModal').modal("show");

			$.ajax({
				url : "/admin/reviewInfo",
				data : {
					"rv_no" : $(this).text()
				},
				dataType : "json",
				success : function(data) {
					console.log(data)
					$('input[name=rv_no]').val(data.rv_no)
					if(data.rv_own_id == null || data.rv_own_id == ""){
						$('input[name=rv_id]').val(data.rv_us_id)
					}
					if(data.rv_us_id == null || data.rv_us_id == ""){
						$('input[name=rv_id]').val(data.rv_own_id)
					}
					$('input[name=rv_buy_id]').val(data.rv_buy_id)
					$('input[name=rv_content]').text(data.rv_content)
					
				},
				error : function() {
					console.log("오류");
				}
			});// rv_no click ajax
			
			$('.delete').click(function(){
				$.ajax({
					url : "/admin/reviewDelete",
					data : {
						"rv_no" : $('input[name=rv_no]').val()
					},
					dataType : "json",
					success : function(data) {
						alert("삭제완료");
						location.replace("/admin/reviewList");
					},
					error : function() {
						console.log("오류");
					}
				});//delete click ajax
			});//delete click
		});// rv_no click
	});//ready
</script>


<%@include file="../include/footer.jsp"%>