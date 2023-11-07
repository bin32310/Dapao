<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/header.jsp" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<h1>/admin/itemList.jsp</h1>

<div class="box">
	<div class="box-header with-board">
		<h3 class="box-title">상품(회원) 목록</h3>
	</div>
	<div class="box-body">
		<table class="table table-bordered">
			<thead>
				<tr role="row">
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" >글 번호</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" >회원 아이디</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" >상품 카테고리</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" >가격</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" >상품상태</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" width="7%" >판매상태</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" width="12%" >날짜정보</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" width="5%"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${itemList }">
					<tr role="row" class="odd">
						<td><a class="it_no">${list.it_no }</a></td>
						<td>${list.us_id }</td>
						<td>${list.it_cate }</td>
						<td>${list.it_price }</td>
						<td>${list.it_con }</td>
						<c:choose>
							<c:when test="${list.it_state eq '0' }">
								<td>판매중</td>
							</c:when>
							<c:when test="${list.it_state eq '1' }">
								<td>판매완료</td>
							</c:when>
							<c:when test="${list.it_state eq '2' }">
								<td>삭제</td>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${list.it_state eq '0' }">
								<td>등록 ${list.it_regdate }</td>
							</c:when>
							<c:when test="${list.it_state eq '1' }">
								<td>판매 ${list.it_outdate }</td>
							</c:when>						
							<c:when test="${list.it_state eq '2' }">
								<td>삭제 ${list.it_outdate }</td>
							</c:when>										
						</c:choose>
						<c:if test="${list.it_state eq '0' }">	
							<td><button type="button" class="itState" value="${list.it_no }">삭제</button></td>
						</c:if>							
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
				<li><a href="/admin/itemList?page=${pageVO.startPage-1 } ">←</a></li>
			</c:if>

			<c:forEach var="i" begin="${pageVO.startPage }" end="${pageVO.endPage }" step="1">
				<li ${pageVO.cri.page == i? 'class="active"':'' }><a href="/admin/itemList?page=${i }">${i }</a></li>
			</c:forEach>

			<c:if test="${pageVO.next }">
				<li><a href="/admin/itemList?page=${pageVO.endPage+1 }">→</a></li>
			</c:if>
		</ul>
	</div>
</div>


<script type="text/javascript">
	$(function(){
		// 삭제버튼 클릭시
		$('.itState').click(function(){
			console.log($(this).val());
			$.ajax({
				url:"/admin/itemDelete",
				data:{"it_no":$(this).val()},
				dataType:"json",
				success:function(data){
					console.log("성공 / 결과 : "+data);
					location.replace("/admin/itemList?page=${param.page}");
				},
				error:function(){
					console.log("에러");
				}
			});
		});		
		
	});
</script>


<%@include file="../include/footer.jsp"%>