<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp" %>


<h1>allUserInfo</h1>
	
<div class="row">
   <div class="col-sm-12">
      <table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
         <thead>
            <tr role="row">
               <th class="sorting" tabindex="0" rowspan="1" colspan="1" >아이디</th>
               <th class="sorting" tabindex="0" rowspan="1" colspan="1" >닉네임</th>
               <th class="sorting_desc" tabindex="0" rowspan="1" colspan="1" >이름</th>
               <th class="sorting" tabindex="0" rowspan="1" colspan="1" >주소</th>
               <th class="sorting" tabindex="0" rowspan="1" colspan="1" >전화번호</th>
               <th class="sorting" tabindex="0" rowspan="1" colspan="1" >신고누적</th>
               <th class="sorting" tabindex="0" rowspan="1" colspan="1" >회원상태</th>
            </tr>
         </thead>
         <tbody>
            <c:forEach var="list" items="${userList }">
               <tr role="row" class="odd">
                  <td><a class="userInfo">${list.us_id }</a></td>
                  <td>${list.us_nickname }</td>
                  <td>${list.us_name }</td>
                  <td>${list.us_addr }</td>
                  <td>${list.us_tel }</td>
                  <td>${list.us_account }</td>
                  <c:choose>
                  	<c:when test="${list.us_state eq '0'}">
                  		<td>정상</td>
                  	</c:when>
                  	<c:when test="${list.us_state eq '1'}">
                  		<td>정지</td>
                  	</c:when>
                  	<c:when test="${list.us_state eq '2'}">
                  		<td>탈퇴</td>
                  	</c:when>
                  </c:choose>
               </tr>
            </c:forEach>
         </tbody>
      </table>
   </div>
</div>

<select class="form-select" aria-label="Default select example">
  <option selected>Open this select menu</option>
  <option value="1">One</option>
  <option value="2">Two</option>
  <option value="3">Three</option>
</select>

<select class="form-select form-select-lg mb-3" aria-label="Large select example">
  <option selected>Open this select menu</option>
  <option value="1">One</option>
  <option value="2">Two</option>
  <option value="3">Three</option>
</select>

<style>
	.form-control{
	border: none;
	padding-bottom: 3%;
	font-size: 18px;
	}
</style>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
   <div class="modal-dialog modal-lg">

      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">회원 정보</h4>
         </div>
         <div class="modal-body" id="userInfo">
            <div class="form-group">
               <label class="col-sm-2 control-label">아이디</label>
               <div class="col-sm-10">
                  <input type="text" class="form-control" name="us_id" id="us_id">
               </div>
            </div>
            <div class="form-group">
               <label class="col-sm-2 control-label">비밀번호</label>
               <div class="col-sm-10">
                  <input type="text" class="form-control" name="us_pw" id="us_pw">
               </div>
            </div>
            <div class="form-group">
               <label class="col-sm-2 control-label">이름</label>
               <div class="col-sm-10">
                  <input type="text" class="form-control" name="us_name" id="us_name">
               </div>
            </div>
            <div class="form-group">
               <label class="col-sm-2 control-label">닉네임</label>
               <div class="col-sm-10">
                  <input type="text" class="form-control" name="us_nickname" id="us_nickname">
               </div>
            </div>
            <div class="form-group">
               <label class="col-sm-2 control-label">프로필 이미지</label>
               <div class="col-sm-10">
                  <input type="text" class="form-control" name="us_img" id="us_img">
               </div>
            </div>
            <div class="form-group">
               <label class="col-sm-2 control-label">전화번호</label>
               <div class="col-sm-10">
                  <input type="text" class="form-control" name="us_tel" id="us_tel">
               </div>
            </div>
            <div class="form-group">
               <label class="col-sm-2 control-label">이메일</label>
               <div class="col-sm-10">
                  <input type="text" class="form-control" name="us_email" id="us_email">
               </div>
            </div>
            <div class="form-group">
               <label class="col-sm-2 control-label">주소</label>
               <div class="col-sm-10">
                  <input type="text" class="form-control" name="us_addr" id="us_addr">
               </div>
            </div>
            <div class="form-group">
               <label class="col-sm-2 control-label">충전금액</label>
               <div class="col-sm-10">
                  <input type="text" class="form-control" name="us_coin" id="us_coin">
               </div>
            </div>
            <div class="form-group">
               <label class="col-sm-2 control-label">블로그</label>
               <div class="col-sm-10">
                  <input type="text" class="form-control" name="us_blog" id="us_blog">
               </div>
            </div>
            <div class="form-group">
               <label class="col-sm-2 control-label">인스타</label>
               <div class="col-sm-10">
                  <input type="text" class="form-control" name="us_instar" id="us_instar">
               </div>
            </div>
            <div class="form-group">
               <label class="col-sm-2 control-label">가입일</label>
               <div class="col-sm-10">
                  <input type="text" class="form-control" name="us_regdate" id="us_regdate">
               </div>
            </div>
            <div class="form-group">
               <label class="col-sm-2 control-label">탈퇴일</label>
               <div class="col-sm-10">
                  <input type="text" class="form-control" name="us_outdate" id="us_outdate">
               </div>
            </div>
            <div class="form-group">
               <label class="col-sm-2 control-label">회원상태</label>
               <div class="col-sm-10">
                  <input type="text" class="form-control" name="us_state" id="us_state">
               </div>
            </div>
            <div class="form-group">
               <label class="col-sm-2 control-label">정지기간</label>
               <div class="col-sm-10">
                  <input type="text" class="form-control" name="us_stopdate" id="us_stopdate" >
               </div>
            </div>
            <div class="form-group">
               <label class="col-sm-2 control-label">신고 누적 횟수</label>
               <div class="col-sm-10">
                  <input type="text" class="form-control" name="us_account" id="us_account" >
               </div>
            </div>
            <div class="form-group">
               <label class="col-sm-2 control-label">정지 횟수</label>
               <div class="col-sm-10">
                  <input type="text" class="form-control" name="us_stop" id="us_stop">
               </div>
            </div>
         </div>
         <div class="modal-footer">
            <button type="button" name="update" class="update">수정</button>
            <button type="button" name="delete" class="delete">탈퇴</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
         </div>
      </div>

   </div>
</div>

	<script type="text/javascript">
		$(function() {
			$('.userInfo').click(function() {
				$('#myModal').modal("show");

				var userId = $(this).text();
				console.log("us_id : " + userId);
				$.ajax({
					url:"/admin/userInfo",
					data:{
						"us_id" : userId
					},
					dataType : "json",
					success : function(data) {
						console.log("@@@@ : " + data);
						console.log("성공");
						$('#us_id').val(data.us_id)
						$('#us_pw').val(data.us_pw)
						$('#us_name').val(data.us_name)
						$('#us_nickname').val(data.us_nickname)
						$('#us_img').val(data.us_img)
						$('#us_tel').val(data.us_tel)
						$('#us_email').val(data.us_email)
						$('#us_addr').val(data.us_addr)
						$('#us_coin').val(data.us_coin)
						$('#us_blog').val(data.us_blog)
						$('#us_instar').val(data.us_instar)
						$('#us_regdate').val(data.us_regdate)
						$('#us_outdate').val(data.us_outdate)
						$('#us_state').val(data.us_state)
						$('#us_stopdate').val(data.us_stopdate)
						$('#us_account').val(data.us_account)
						$('#us_stop').val(data.us_stop)
					},
					error : function() {
						console.log("오류");
					}
				});
			});
		});
		
		$('.update').click(function(){
			var us_id = $('#us_id').val();
			console.log("us_id :"+us_id);
			if(confirm("수정하시겠습니까?") == true){
				$.ajax({
					url:"/admin/userInfoUpdate",
					data:{
						"us_id":$('#us_id').val(),
						"us_pw":$('#us_pw').val(),
						"us_name":$('#us_name').val(),
						"us_nickname":$('#us_nickname').val(),
						"us_img":$('#us_img').val(),
						"us_tel":$('#us_tel').val(),
						"us_email":$('#us_email').val(),
						"us_addr":$('#us_addr').val(),
						"us_coin":$('#us_coin').val(),
						"us_blog":$('#us_blog').val(),
						"us_instar":$('#us_instar').val(),
						"us_state":$('#us_state').val(),
						"us_stopdate":$('#us_stopdate').val(),
						"us_account":$('#us_account').val(),
						"us_stop":$('#us_stop').val()
					},
					dataType:"json",
					success:function(data){
						console.log("수정 ajax성공");
					},
					error:function(){
						console.log("수정 ajax오류");
					}
				});
				alert("수정완료")
				$('#myModal').modal("hide");
			}
		});

	</script>

<%@ include file="../include/footer.jsp" %>