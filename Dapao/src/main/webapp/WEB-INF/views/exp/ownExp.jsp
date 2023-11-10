<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>

<h1>사업자 - 체험단 신청페이지</h1>

<style>
#expForm {
	position: relative;
	border-radius: 3px;
	background: #ffffff;
	border-top: 3px solid #d2d6de;
	margin-bottom: 20px;
	width: 100%;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
	padding: 30px;
}
</style>

<!-- 사업자아이디(세션제어)/체험단 제목/내용/모집인원/유의사항 -->
<form action="ownExpPOST" method="post">
<div id="expForm">
	<div class="form-group">
		<label>사업자 아이디 : ${id }</label> 
	</div>
	<div class="form-group">
		<label>제목</label> <input type="text" class="form-control" name="exp_title"
		 required="required" placeholder="광고에 게시될 제목을 기입해주세요">
	</div>
	<div class="form-group">
		<label>모집인원</label> 
		<select class="form-control" name="exp_psn">
			<option>3</option>
			<option>5</option>
			<option>10</option>
			<option>15</option>
			<option>20</option>
		</select>
	</div>
	<div class="form-group">
		<label>내용</label>
		<textarea class="form-control" rows="10" required="required" name="exp_content" placeholder="광고에 게시될 내용을 기입해주세요"></textarea>
	</div>
	<div class="form-group">
		<label>유의사항</label>
		<textarea class="form-control" rows="7" required="required" name="exp_notice" placeholder="광고에 게시될 유의사항을 기입해주세요"></textarea>
	</div>
	<input type="hidden" name="own_id" value="1">
<%-- 	<input type="hidden" name="own_id" value="${id }"> --%>
	<input type="submit" value="신청하기" id="expSubmit">
</div>
</form>

<script type="text/javascript">

	$('#expSubmit').click(function(){
		if(confirm("신청하시겠습니까?")){
			alert("신청완료");
		}else{
			alert("취소");
		}
	})

</script>


<%@ include file="../include/footer.jsp"%>