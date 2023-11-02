<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/header.jsp" %>
<h1>/admin/ownerList.jsp</h1>

<div class="box">
	<div class="box-header with-board">
		<h3 class="box-title">사업자 관리</h3>
	</div>
	<div class="box-body">
		<table class="table table-bordered">
			<thead>
				<tr role="row">
					<th class="sorting" tabindex="0" rowspan="1" colspan="1">사업자 아이디</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1">사업자 이름</th>
					<th class="sorting_desc" tabindex="0" rowspan="1" colspan="1">주소</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1">전화번호</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1">신고 누적</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1">사업자 상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${vo }">
					<tr role="row" class="odd">
						<td><a class="ownInfo">${vo.own_id }</a></td>
						<td>${vo.own_name }</td>
						<td>${vo.ent_addr }</td>
						<td>${vo.own_tel }</td>
						<td>${vo.ent_account }</td>
						<c:choose>
							<c:when test="${vo.own_state == 0 }">
								<td>정상</td>
							</c:when>
							<c:when test="${vo.own_state == 1 }">
								<td>정지</td>
							</c:when>
							<c:when test="${vo.own_state == 2 }">
								<td>탈퇴</td>
							</c:when>
							<c:when test="${vo.own_state == 3 }">
								<td>승인요청</td>
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
				<li><a href="/admin/ownerList?page=${pageVO.startPage-1 } ">←</a></li>
			</c:if>

			<c:forEach var="i" begin="${pageVO.startPage }" end="${pageVO.endPage }" step="1">
				<li ${pageVO.cri.page == i? 'class="active"':'' }><a href="/admin/ownerList?page=${i }">${i }</a></li>
			</c:forEach>

			<c:if test="${pageVO.next }">
				<li><a href="/admin/ownerList?page=${pageVO.endPage+1 }">→</a></li>
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
				<h4 class="modal-title">사업자 정보</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label class="col-sm-2 control-label">사업자 아이디</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="own_id" readonly><br>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">사업자 비밀번호</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="own_pw" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">사업자 이름</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="own_name" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">사업자 전화번호</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="own_tel" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">사업자 이메일</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="own_email" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">사업자 상태</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="own_state" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">ent_name</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="ent_name" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">ent_cate</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="ent_cate" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">ent_addr</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="ent_addr" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">ent_mo</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="ent_mo" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">ent_file</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="ent_file" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">ent_of</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="ent_of" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">ent_notice</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="ent_notice" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">ent_info</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="ent_info" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">ent_img</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="ent_img" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">ent_ot</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="ent_ot" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">ent_ct</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="ent_ct" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">own_stopdate</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="own_stopdate" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">ent_account</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="ent_account" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">ent_stop</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="ent_stop" readonly><br>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<select name="stop" class="btn btn-default" aria-label="Small select example">
					<option selected>정지</option>
					<option value="7">7일</option>
					<option value="30">30일</option>
					<option value="100">100일</option>
				</select>
				<button type="button" class="btn btn-default" id="stop">정지</button>
				<button type="button" name="update" class="btn btn-default update">승인</button>
				<button type="button" name="delete" class="btn btn-default delete">탈퇴</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function() {
		$('.ownInfo').click(
				function() {
					$('#myLargeModal').modal("show");

					var ownId = $(this).text();
					$.ajax({
						url : "/admin/ownerInfo",
						data : {
							"own_id" : ownId
						},
						dataType : "json",
						success : function(data) {
							console.log(data)
							$('input[name=own_id]').val(data.own_id)
							$('input[name=own_name]').val(data.own_name)
							$('input[name=own_pw]').val(data.own_pw)
							$('input[name=own_tel]').val(data.own_tel)
							$('input[name=own_email]').val(data.own_email)
							$('input[name=own_state]').val(data.own_state)
							$('input[name=ent_name]').val(data.ent_name)
							$('input[name=ent_cate]').val(data.ent_cate)
							$('input[name=ent_addr]').val(data.ent_addr)
							$('input[name=ent_mo]').val(data.ent_mo)
							$('input[name=ent_file]').val(data.ent_file)
							$('input[name=ent_of]').val(data.ent_of)
							$('input[name=ent_notice]').val(data.ent_notice)
							$('input[name=ent_info]').val(data.ent_info)
							$('input[name=ent_img]').val(data.ent_img)
							$('input[name=ent_ot]').val(data.ent_ot)
							$('input[name=ent_ct]').val(data.ent_ct)
							$('input[name=ent_account]').val(data.ent_account)
							$('input[name=ent_stop]').val(data.ent_stop)

						},
						error : function() {
							console.log("오류");
						}
					});// ownInfo click ajax
					$('#stop').click(function() {
						var own_stopdate = $('select[name=stop]').val();
						$.ajax({
							url : "/admin/ownerStop",
							data : {
								"own_id" : $('input[name=own_id]').val(),
								"own_stopdate" : own_stopdate
							},
							dataType : "json",
							success : function(data) {
								if (data == 1) {
									alert("정상적으로 정지가 부여되었습니다.");
									location.replace("/admin/ownerList");
								}
							},
							error : function(data) {
								console.log("에러");
							}
						});
					});
					$(".update").click(function(){
						$.ajax({
							url : "/admin/ownerApprove",
							data : {
								"own_id" : $('input[name=own_id]').val()
							},
							dataType : "json",
							success : function(data){
									alert("승인완료")
									location.replace("/admin/ownerList");
							},
							error : function() {
								console.log("오류");
							}
						});//update click ajax
					});//update click
					$(".delete").click(function() {
						$.ajax({
							url : "/admin/ownerInfoDelete",
							data : {
								"own_id" : $('input[name=own_id]').val()
							},
							dataType : "json",
							success : function(data) {
									alert("탈퇴완료")
									location.replace("/admin/ownerList");
							},
							error : function() {
								console.log("오류");
							}
						});//delete click ajax
					});// delete click
				});// ownInfo click
	});//ready
</script>
<%@include file="../include/footer.jsp"%>