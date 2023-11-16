<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
h1 {
	color: grean;
	font-size: 15px;
}
</style>

<!-- Login css -->

<!-- // http://localhost:8088/user/userFindId -->

</head>
<body>

	<div class="box box-info">
		<div class="box-header with-border">
			<h3 class="box-title">아이디 찾기</h3>
		</div>


		<form class="form-horizontal" action="" method="post">
			<div class="box-body">
				<div class="form-group">
					<div class="col-sm-10">
						이름<input id="us_name" class="form-control" type="text" name="us_name"><br>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10">
						전화번호<input class="form-control" type="text" name="us_tel" placeholder="'-'도 입력해주세요"><br>
					</div>
				</div>
				
			</div>

			<div class="box-footer">
				<input class="btn btn-info pull-right" type="submit" value="아이디 찾기">
				<button class="btn btn-default" onclick="back()">메인으로</button>
			</div>

		</form>
	</div>


<!-- 	<form action="" method="post" id="userFindId">
		이름<input type="text" name="us_name"><br>
		전화번호<input type="text" name="us_tel" placeholder="'-'도 입력해주세요"><br>
		<input type="submit" value="아이디 찾기">
	</form>
	<button onclick="back()">뒤로가기</button>

 -->

	<script type="text/javascript">
		function back() {
			history.back(); // 뒤로가기
		}
	</script>


	<%@ include file="../include/userFooter.jsp"%>

</body>
</html>