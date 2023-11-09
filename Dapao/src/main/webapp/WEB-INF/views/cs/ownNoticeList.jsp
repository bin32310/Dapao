<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${empty us_id }">
	<%@ include file="../include/userHeader.jsp"%>
</c:if>
<c:if test="${!empty us_id }">
	<%@ include file="../include/userLoginHeader.jsp"%>
</c:if>

<div class="box">
	<div class="box-header with-board" id="notice">
		<h3 class="box-title">공지사항</h3>
	</div>
	<div class="box-body">
		<table class="table table-bordered">
			<thead>
				<tr role="row">
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" width="1px"></th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1">제목</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1">등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${noticeList }">
					<tr role="row" class="odd">
						<td>${list.cs_no }</td>
						<c:if test="${not empty param.page }">
							<td><a class="noticeList" href='/cs/ownNotice?page=${param.page }&cs_no=${list.cs_no }'>${list.cs_title }</a></td>
						</c:if>
						<c:if test="${empty param.page }">
							<td><a class="noticeList" href='/cs/ownNotice?cs_no=${list.cs_no }'>${list.cs_title }</a></td>
						</c:if>
						<td>${list.cs_regdate }</td>
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
				<li><a href="/cs/ownNoticeList?page=${pageVO.startPage-1 } ">←</a></li>
			</c:if>

			<c:forEach var="i" begin="${pageVO.startPage }" end="${pageVO.endPage }" step="1">
				<li ${pageVO.cri.page == i? 'class="active"':'' }><a href="/cs/ownNoticeList?page=${i }">${i }</a></li>
			</c:forEach>

			<c:if test="${pageVO.next }">
				<li><a href="/cs/ownNoticeList?page=${pageVO.endPage+1 }">→</a></li>
			</c:if>
		</ul>
	</div>
</div>



<%@include file="../include/userFooter.jsp"%>