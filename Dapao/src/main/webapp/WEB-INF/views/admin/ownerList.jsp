<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/header.jsp" %>
<h1>/admin/ownerList.jsp</h1>

<div class="row">
	<div class="col-sm-12">
		<table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
			<thead>
				<tr role="row">
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" >사업자 아이디</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" >사업자 이름</th>
					<th class="sorting_desc" tabindex="0" rowspan="1" colspan="1" >주소</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" >전화번호</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" >신고 누적</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" >사업자 상태</th>
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
			<div class="modal-body" id="ownInfo">
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
				<button type="button" name="delete" class="delete">탈퇴</button>
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
							$('input[name=own_id]').attr('value', data.own_id)
							$('input[name=own_name]').attr('value',data.own_name)
							$('input[name=own_pw]').attr('value', data.own_pw)
							$('input[name=own_tel]').attr('value', data.own_tel)
							$('input[name=own_email]').attr('value',data.own_email)
							$('input[name=own_state]').attr('value',data.own_state)
							$('input[name=ent_name]').attr('value',data.ent_name)
							$('input[name=ent_cate]').attr('value',data.ent_cate)
							$('input[name=ent_addr]').attr('value',data.ent_addr)
							$('input[name=ent_mo]').attr('value', data.ent_mo)
							$('input[name=ent_file]').attr('value',data.ent_file)
							$('input[name=ent_of]').attr('value', data.ent_of)
							$('input[name=ent_notice]').attr('value',data.ent_notice)
							$('input[name=ent_info]').attr('value',data.ent_info)
							$('input[name=ent_img]').attr('value', data.ent_img)
							$('input[name=ent_ot]').attr('value', data.ent_ot)
							$('input[name=ent_ct]').attr('value', data.ent_ct)
							$('input[name=ent_account]').attr('value',data.ent_account)
							$('input[name=ent_stop]').attr('value',data.ent_stop)

						},
						error : function() {
							console.log("오류");
						}

					});// ownInfo click ajax
					$(".delete").click(function() {
						$.ajax({
							url : "/admin/ownerInfoDelete",
							data : {
								"own_id" : $('input[name=own_id]').val(),
							},
							dataType : "json",
							success : function(data) {
								console.log(data)
								alert("탈퇴완료")
								location.replace("/admin/ownerList");
							},
							error : function() {
								console.log("오류");
								alert("탈퇴완료");
								location.replace("/admin/ownerList");
							}
						});//delete click ajax
					});// delete click

				});// ownInfo click
	});//ready
</script>
<%@include file="../include/footer.jsp"%>