<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<c:if test="${empty us_id }">
	<%@ include file="../include/userHeader.jsp"%>
</c:if>
<c:if test="${!empty us_id }">
	<%@ include file="../include/userLoginHeader.jsp"%>
</c:if>



<!-- Login css -->

<style type="text/css">
	

</style>

<!-- Login css -->

<!-- // http://localhost:8088/user/userLogin -->
</head>

<body>



	<div class="box box-info">
		<div class="box-header with-border">
			<h1 class="box-title">로그인</h1>
		</div>


		<form class="form-horizontal" action="" method="post">
			<div class="box-body">
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label" ></label>
					<div class="col-sm-10">
						아이디<input id="inputEmail3" class="form-control" type="text" name="us_id" placeholder="아이디를 입력해주세요" required="required"><br>
						비밀번호<input id="inputPassword3" class="form-control" type="password" name="us_pw" placeholder="비밀번호를 입력해주세요" required="required">
					</div>
				</div>
				<div class="form-group">
				<!-- 	<label for="inputPassword3" class="col-sm-2 control-label"></label> -->
					<div class="col-sm-10">
						
					</div>
					<div>
						<input type="submit" value="로그인"> <input type="button" value="회원가입 바로가기" onclick="location.href='/user/userJoin';">	
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<div class="checkbox">
							<label> </label>
						</div>
					</div>
				</div>
			</div>
		</form>
			<div class="box-footer">
				<input id="a" type="button" value="아이디찾기" onclick="location.href='/user/userFindId';">
				<input type="button" value="비밀번호찾기" id="findPwBtn">
			</div>

	
	</div>

	<%@ include file="../include/userFooter.jsp"%>





	<script>
		$(function() {
			$("#findPwBtn").click(function() {
				location.href = '../user/userFindPw';

			});//findPwBtn

		});// function
	</script>


	<!-- 로그인 -->

	<!-- <fieldset> -->
		<!-- <h4>회원 로그인</h4> -->
	<!-- 	<form action="" method="post"> -->
			<!-- 아이디<input type="text" name="us_id"><br> 비밀번호<input type="password" name="us_pw"> -->
		<!-- 	<hr> -->
		<!-- 	<input type="submit" value="로그인"> <input type="button" value="회원가입 바로가기" onclick="location.href='/user/userJoin';"> -->
		<!-- </form> -->


	<!-- </fieldset> -->

	<!-- <input type="button" value="아이디찾기" onclick="location.href='/user/userFindId';">
	<input type="button" value="비밀번호찾기" id="findPwBtn">
 -->


</body>
</html>
