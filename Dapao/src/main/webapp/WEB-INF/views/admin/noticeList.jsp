<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/header.jsp" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<h1>/admin/noticeList.jsp</h1>

<div class="box">
	<div class="box-header with-board">
		<h3 class="box-title">notice 목록</h3>
	</div>
	<div class="box-body">
		<table class="table table-bordered">
			<thead>
				<tr role="row">
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" >글 번호</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" >제목</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" >등록일</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" >등록형태</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" width="7%" >등록상태</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" width="5%"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${noticeList }">
					<tr role="row" class="odd">
						<td><a class="cs_no">${list.cs_no }</a></td>
						<td>${list.cs_title }</td>
						<td>${list.cs_regdate }</td>
						<c:choose>
							<c:when test="${list.cs_group eq '0' }">
								<td>회원공지</td>
							</c:when>
							<c:when test="${list.cs_group eq '1' }">
								<td>사업자공지</td>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${list.cs_state eq '0' }">
								<td>해제</td>
							</c:when>
							<c:when test="${list.cs_state eq '1' }">
								<td>등록</td>
							</c:when>						
						</c:choose>
						<c:choose>
							<c:when test="${list.cs_state eq '0' }">
							<td><button type="button" class="csState" value="${list.cs_no }">등록</button></td>
							</c:when>
							<c:when test="${list.cs_state eq '1' }">
							<td><button type="button" class="csState" value="${list.cs_no }">해제</button></td>
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
				<li><a href="/admin/noticeList?page=${pageVO.startPage-1 } ">←</a></li>
			</c:if>

			<c:forEach var="i" begin="${pageVO.startPage }" end="${pageVO.endPage }" step="1">
				<li ${pageVO.cri.page == i? 'class="active"':'' }><a href="/admin/noticeList?page=${i }">${i }</a></li>
			</c:forEach>

			<c:if test="${pageVO.next }">
				<li><a href="/admin/noticeList?page=${pageVO.endPage+1 }">→</a></li>
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
				<h4 class="modal-title">공지사항</h4>
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
						<input type="text" class="form-control" name="cs_group" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">등록상태</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="cs_state" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">조회수</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="cs_view" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">게시일</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="cs_regdate" readonly><br>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">수정일</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="cs_update" readonly><br>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" name="update" class="update">수정</button>
				<button type="button" name="delete" class="delete">삭제</button>
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
				url : "/admin/csInfo",
				data : {
					"cs_no" : $(this).text()
				},
				dataType : "json",
				success : function(data) {
					console.log(data)
					$('input[name=cs_no]').val(data.cs_no)
					$('input[name=cs_title]').val(data.cs_title)
					$('input[name=cs_content]').val(data.cs_content)
					if(data.cs_group == 0){
						$('input[name=cs_group]').val("회원공지");
					}else{
						$('input[name=cs_group]').val("사업자공지");
					}
					if(data.cs_state == 0){
						$('input[name=cs_state]').val("해제")
					}else{
						$('input[name=cs_state]').val("등록")
					}					
					$('input[name=cs_view]').val(data.cs_view)
					$('input[name=cs_regdate]').val(data.cs_regdate)
					$('input[name=cs_update]').val(data.cs_update)
				},
				error : function() {
					console.log("오류");
				}
			});// cs_no click ajax
			
			// 공지사항 수정버튼 클릭시
			$('.update').click(function(){
				alert("@@@@");
				$.ajax({
					url : "/admin/csInfoUpdate",
					data : {
						"cs_no" : $('input[name=cs_no]').val(),
						"cs_title" : $('input[name=cs_title]').val(),
						"cs_content" : $('input[name=cs_content]').val(),
					},
					dataType : "json",
					success : function(data) {
						console.log(data)
						alert("수정완료");
						location.replace("/admin/noticeList");
					},
					error : function() {
						console.log("오류");
					}
				});// update click ajax
			});// update click
		});// cs_no click
		
		// 공지사항 삭제버튼 클릭시
		$('.delete').click(function(){
			$.ajax({
				url:"/admin/csDelete",
				data:{"cs_no" : $('input[name=cs_no]').val()},
				dataType:"json",
				success:function(data){
					console.log(data);
					console.log("성공");
					location.replace("/admin/noticeList");
				},
				error:function(){
					console.log("에러");
				}
			});
		});
		
		// 등록/해제 버튼 클릭시 
		$('.csState').click(function(){
			var state = $(this).text();
			console.log("state : "+state);
			
			if(state == '등록'){
				alert("등록");	
				console.log($(this).val());				
				$.ajax({
					url:"/admin/csUpload",
					data:{"cs_no" : $(this).val()},
					dataType:"json",
					success:function(data){
						console.log("성공결과 : "+data);
						console.log("성공");
						location.replace("/admin/noticeList");
					},
					error:function(){
						console.log("에러");
					}
				});
			}
			if(state == '해제'){
				alert("해제");
				console.log($(this).val());
				$.ajax({
					url:"/admin/csRemove",
					data:{"cs_no":$(this).val()},
					dataType:"json",
					success:function(data){
						console.log("성공결과 : "+data);
						console.log("성공");
						location.replace("/admin/noticeList");
					},
					error:function(){
						console.log("에러");
					}
				});
				
			}
		
		}) // 등록/해제 버튼 클릭 시
	
	});// jquery
</script>


<%@include file="../include/footer.jsp"%>