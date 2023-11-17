<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:if test="${empty us_id }">
	<%@ include file="../include/userHeader.jsp"%>
</c:if>
<c:if test="${!empty us_id }">
	<%@ include file="../include/userLoginHeader.jsp"%>
</c:if>


<h1>공지사항</h1>

<div class="notice">
	<div class="title">
		<span id="title">${notice.cs_title }</span> <span id="view">조회수 : ${notice.cs_view }</span>
	</div>
	<div class="content"><pre>${notice.cs_content }</pre></div>
	<button type="button" id="listBtn" onclick="location.href='/cs/userNoticeList?page=${page}'">목록가기</button>
</div>



<style>
.content-header{
	position: relative;
    padding: 30px 30px
}

.notice {
	width: 100%;
	height: 500px;
	background-color: white;
	margin-left: 3%;
	margin-top: 5%;
}

.title {
	padding: 5%;
}

#title {
	font-size: 30px;
	font-weight: 400;
}

#view {
	padding-left: 50%;
	font-size: 13px;
}

.content {
	padding-left: 5%;
}
pre{
	border: none;
	background-color: white;
}
</style>

<script type="text/javascript">
	
</script>


<%@include file="../include/userFooter.jsp"%>