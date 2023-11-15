<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/entHeader.jsp"%>

	<h1>ownInfo</h1>
	
	<h3>${entVO }</h3>
	
	<fieldset>
		<form action="" method="post" enctype="multipart/form-data"> <br>
					<input type="hidden" name="own_pw" value="${entVO.own_pw }" readonly="readonly" > <br>
			아이디 : <input type="text" name="own_id" value="${entVO.own_id }" readonly="readonly" > <br>
			이름 : <input type="text" name="own_name"  value="${entVO.own_name }" readonly="readonly"> <br>
			전화번호 : <input type="text" name="own_tel" value="${entVO.own_tel }"  readonly="readonly"> <br>
			이메일 : <input type="text" name="own_email" value="${entVO.own_email }"  readonly="readonly"> <br>
			상호명 : <input type="text" name="ent_name" value="${entVO.ent_name }"  readonly="readonly"> <br>
			업종 : <input type="text" name="ent_cate" value="${entVO.ent_cate }"  readonly="readonly"> <br>
			주소 : <input type="text" name="ent_addr" value="${entVO.ent_addr }"  readonly="readonly"> <br>
			통신판매업 : <input type="text" name="ent_mo" value="${entVO.ent_mo }"  readonly="readonly"> <br>
			사업자등록증 : <input type="file" name="ent_file"  readonly="readonly"> <br>
			<input type="submit" value="수정하기">
			<a href="/ent/entMain"><input type="button" value="뒤로가기"></a>
			<input type="button" value="회원탈퇴" onclick="location.href = '/ent/ownDelete'">
		</form>
	</fieldset>
	
	


<script type="text/javascript">
	
	$(document).ready(function(){
		
	});

</script>

<%@ include file="../include/footer.jsp"%>