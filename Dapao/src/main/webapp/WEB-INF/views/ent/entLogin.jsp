<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/entHeader.jsp"%>
	<h1>entLogin</h1>
	
	<c:choose>
		<c:when test="${param.result=='fail' }">
			<script>
				window.onload=function(){
					alert("아이디나 비밀번호가 틀렸습니다. 다시 로그인 하세요!")
				}
			</script>
		</c:when>		
		<c:when test="${param.result=='1' }">
			<script>
				window.onload=function(){
					alert("정지된 아이디입니다. 고객센터에 문의하세요!")
				}
			</script>
		</c:when>		
		<c:when test="${param.result=='2' }">
			<script>
				window.onload=function(){
					alert("탈퇴하신 아이디입니다!")
				}
			</script>
		</c:when>		
		<c:when test="${param.result=='3' }">
			<script>
				window.onload=function(){
					alert("승인대기중인 아이디 입니다. 고객센터에 문의하세요!")
				}
			</script>
		</c:when>		
	</c:choose>
	
	<fieldset>
		<form action="" method="post">
			아이디 : <input type="text" name="own_id"> <br>
			비밀번호 : <input type="password" name="own_pw"> <br>
			<input type="submit" value="로그인">
		</form>
	</fieldset>

<%@ include file="../include/footer.jsp"%>