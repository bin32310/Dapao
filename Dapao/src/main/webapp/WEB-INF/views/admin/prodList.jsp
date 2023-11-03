<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/header.jsp" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<h1>/admin/productList.jsp</h1>

<div class="box">
	<div class="box-header with-board">
		<h3 class="box-title">상품(사업자) 목록</h3>
	</div>
	<div class="box-body">
		<table class="table table-bordered">
			<thead>
				<tr role="row">
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" >상품 번호</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" >사업자 아이디</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" >상품 카테고리</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" >가격</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" >상품 상태</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" width="7%" >판매 상태</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" width="7%" >날짜 정보</th>
					<th class="sorting" tabindex="0" rowspan="1" colspan="1" width="7%" ></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${prodList }">
					<tr role="row" class="odd">
						<td><a class="prod_no">${list.prod_no }</a></td>
						<td>${list.own_id }</td>
						<td>${list.prod_cate }</td>
						<td>${list.prod_price }</td>
						<td>${list.prod_con }</td>
						<c:choose>
							<c:when test="${list.prod_state eq '0' }">
								<td>판매중</td>
							</c:when>						
							<c:when test="${list.prod_state eq '1' }">
								<td>판매완료</td>
							</c:when>						
							<c:when test="${list.prod_state eq '2' }">
								<td>삭제</td>
							</c:when>						
						</c:choose>
						<c:choose>
							<c:when test="${list.prod_state eq '0' }">
								<td>등록 ${list.prod_regdate }</td>
							</c:when>
							<c:when test="${list.prod_state eq '2' }">
								<td>삭제 ${list.prod_outdate }</td>
							</c:when>
						</c:choose>
						<c:if test="${list.prod_state eq '0' }">	
							<td><button type="button" class="prodState" value="${list.prod_no }">삭제</button></td>
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
				<li><a href="/admin/prodList?page=${pageVO.startPage-1 } ">←</a></li>
			</c:if>

			<c:forEach var="i" begin="${pageVO.startPage }" end="${pageVO.endPage }" step="1">
				<li ${pageVO.cri.page == i? 'class="active"':'' }><a href="/admin/prodList?page=${i }">${i }</a></li>
			</c:forEach>

			<c:if test="${pageVO.next }">
				<li><a href="/admin/prodList?page=${pageVO.endPage+1 }">→</a></li>
			</c:if>
		</ul>
	</div>
</div>


<script type="text/javascript">
		
		$(function(){
			var query = window.location.search;         // http://localhost:8080/notice?id=1&name=하나
			var param = new URLSearchParams(query);     // ?id=1&name=하나
			var page = param.get("page")
			console.log(param.get("page"));  
			// 삭제버튼 클릭시
			$('.prodState').click(function(){
				console.log($(this).val());
				$.ajax({
					url:"/admin/prodDelete",
					data:{"prod_no":$(this).val()},
					dataType:"json",
					success:function(data){
						console.log("성공 / 결과 : "+data);
						location.replace("/admin/prodList?page="+page);
					},
					error:function(){
						console.log("에러");
					}
				});
			});		
		});
	
</script>


<%@include file="../include/footer.jsp"%>