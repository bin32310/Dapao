<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/entHeader.jsp"%>
	<h1>entMain</h1>
	<c:if test="${empty sessionScope.own_id }">
		<input type="button" value="로그인" onclick="location.href='/ent/entLogin';">		
		<input type="button" value="회원가입" onclick="location.href='/ent/entJoin';">
	</c:if>

	<c:if test="${!empty sessionScope.own_id }">
		<h2>${sessionScope.own_id }님 환영합니다.</h2>
		
		<hr>
		<input type="button" value="로그아웃" onclick="location.href='/ent/entLogout';">
		<input type="button" value="비밀번호찾기" onclick="location.href='/ent/findPw';">
		
		<hr>
		<h3><a href="/ent/ownInfo">회원정보 조회</a></h3>
		
		<hr>
		<h3><a href="/ent/shopMain">가게</a></h3>
		
		
	</c:if>

<%@ include file="../include/footer.jsp"%>