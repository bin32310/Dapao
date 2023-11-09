<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/header.jsp" %>
<h1>/admin/expList.jsp</h1>

<div class="box">
	<div class="box-header with-board">
		<h3 class="box-title">체험단 관리</h3>
	</div>
	<div class="box-body">
		<table class="table table-bordered">
			<thead>
				<tr role="row">
					<th class="sorting" tabindex="0" rowspan="1" colspan="1">체험단 번호</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1">사업자 아이디</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1">체험단 제목</th>
					<th class="sorting_desc" tabindex="0" rowspan="1" colspan="1">체험단 내용</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1">체험단 인원</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1">체험단 유의사항</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1">체험단 신청일자</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1">체험단 상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${vo }">
					<tr role="row" class="odd">
						<td><a class="exp_no">${vo.exp_no}</a></td>
						<td>${vo.own_id }</td>
						<td>${vo.exp_title }</td>
						<td>${vo.exp_content }</td>
						<td>${vo.exp_psn_ch }</td>
						<td>${vo.exp_notice }</td>
						<td>${vo.exp_regdate }</td>
						<c:choose>
							<c:when test="${vo.exp_state == 0 }">
								<td>접수</td>
							</c:when>
							<c:when test="${vo.exp_state == 1 }">
								<td>승인</td>
							</c:when>
							<c:when test="${vo.exp_state == 2 }">
								<td>반려</td>
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
				<li><a href="/admin/expList?page=${pageVO.startPage-1 } ">←</a></li>
			</c:if>

			<c:forEach var="i" begin="${pageVO.startPage }" end="${pageVO.endPage }" step="1">
				<li ${pageVO.cri.page == i? 'class="active"':'' }><a href="/admin/expList?page=${i }">${i }</a></li>
			</c:forEach>

			<c:if test="${pageVO.next }">
				<li><a href="/admin/expList?page=${pageVO.endPage+1 }">→</a></li>
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
				<h4 class="modal-title">체험단 관리</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label class="col-sm-2 control-label">체험단 번호</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="exp_no" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">사업자 아이디</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="own_id" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">체험단 제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="exp_title" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">체험단 내용</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="exp_content" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">체험단 인원</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="exp_psn" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">체험단 신청인원</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="exp_psn_ch" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">체험단 유의사항</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="exp_notice" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">체험단 상태</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="exp_state" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">체험단 신청일자</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="exp_regdate" readonly><br>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<select name="update" class="btn btn-default" aria-label="Small select example">
					<option selected>광고 기간</option>
					<option value="5">5일</option>
					<option value="7">7일</option>
					<option value="10">10일</option>
					<option value="15">15일</option>
					<option value="20">20일</option>
				</select>
				<button type="button" name="update" class="btn btn-default update">승인</button>
				<button type="button" name="delete" class="btn btn-default delete">반려</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function() {
		$('.exp_no').click(
				function() {
					$('#myLargeModal').modal("show");

					$.ajax({
						url : "/admin/expInfo",
						data : {
							"exp_no" : $(this).text()
						},
						dataType : "json",
						success : function(data) {
							console.log(data)
							$('input[name=exp_no]').val(data.exp_no)
							$('input[name=own_id]').val(data.own_id)
							$('input[name=exp_title]').val(data.exp_title)
							$('input[name=exp_content]').val(data.exp_content)
							$('input[name=exp_psn]').val(data.exp_psn)
							$('input[name=exp_psn_ch]').val(data.exp_psn_ch)
							$('input[name=exp_notice]').val(data.exp_notice)
							$('input[name=exp_state]').val(data.exp_state)
							$('input[name=exp_regdate]').val(data.exp_regdate)
						},
						error : function() {
							console.log("오류");
						}
					});// exp_no click ajax
					$('.update').click(function() {
						var date = $('select[name=update]').val();
						console.log("ad_upload : "+ad_upload);
						$.ajax({
							url : "/admin/expAdInsert",
							data : {
								"exp_no" : $('input[name=exp_no]').val(),
								"date" : date,
								"own_id" : $('input[name=own_id]').val()
							},
							dataType : "json",
							success : function(data) {
								alert("정상적으로 광고 승인되었습니다.");
								location.replace("/admin/expList");

							},
							error : function(data) {
								console.log("에러");
							}
						}); // 승인 ajax
					});// 승인 click
					
				});// exp_no click
	});//ready
</script>
<%@include file="../include/footer.jsp"%>