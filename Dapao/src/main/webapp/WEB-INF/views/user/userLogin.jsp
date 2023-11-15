<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


		<c:if test="${empty us_id }">
		<%@ include file="../include/userHeader.jsp" %>
	</c:if>
	<c:if test="${!empty us_id }">
		<%@ include file="../include/userLoginHeader.jsp" %>
	</c:if>
	
	
	
		<script>
	 $(function(){
		 $("#findPwBtn").click(function(){
			 location.href='../user/userFindPw';
			 
		 });//findPwBtn
		 
		 
		 
	 });// function
	
	
	</script>
	
	
	
	
	

<div class="box box-info">
<div class="box-header with-border">
<h3 class="box-title">로그인</h3>
</div>


<form class="form-horizontal">
<div class="box-body">
<div class="form-group">
<label for="inputEmail3" class="col-sm-2 control-label">아이디</label>
<div class="col-sm-10">
<input type="email" class="form-control" id="inputEmail3" placeholder="아이디를 입력해주세요" required="required">
</div>
</div>
<div class="form-group">
<label for="inputPassword3" class="col-sm-2 control-label">비밀번호</label>
<div class="col-sm-10">
<input type="password" class="form-control" id="inputPassword3" placeholder="비밀번호를 입력해주세요" required="required">
</div>
</div>
<div class="form-group">
<div class="col-sm-offset-2 col-sm-10">
<div class="checkbox">
<label>

</label>
</div>
</div>
</div>
</div>

<div class="box-footer">
<button type="submit" class="btn btn-default">Cancel</button>
<button type="submit" class="btn btn-info pull-right">Sign in</button>
</div>

</form>
</div>
	
	


<!-- 로그인 -->

	<fieldset>
	<h4>회원 로그인</h4>
		<form action="" method="post">
			아이디<input type="text" name="us_id"><br>
			비밀번호<input type="password" name="us_pw"><hr>
			<input type="submit" value="로그인" >
			<input type="button" value="회원가입 바로가기" 
				onclick="location.href='/user/userJoin';">	
		</form>
		
	
	</fieldset>
	
	<input type="button" value="아이디찾기" 
				onclick="location.href='/user/userFindId';">	
		<input type="button" value="비밀번호찾기" 
				id="findPwBtn">	
	
<%@ include file="../include/userFooter.jsp" %> 

</body>
</html>