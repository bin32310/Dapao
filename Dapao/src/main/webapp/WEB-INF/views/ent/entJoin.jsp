<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/entHeader.jsp"%>
	<h1>entJoin</h1>
	
	<fieldset>
		<form action="" method="post" enctype="multipart/form-data"> <br>
			<table>
				<tr>
					<th>
						<label for="own_id">아이디</label>
					</th>
					<td>
						<input type="text" name="own_id" required oninput = "checkId()"  maxlength="12" id="own_id" placeholder="사업자번호(-)포함 입력하세요!" > <br>
						<span class="id_ok" style="color:green; display: none;">사용 가능한 아이디입니다.</span>
						<span class="id_no" style="color:red; display: none;">중복된 아이디입니다!</span>
						<span class="id_ck" style="color:red; display: none;">사업자번호 (-)포함 입력하세요! </span>
					</td>
				</tr>
				
				<tr>
					<th>
						<label for="own_pw">비밀번호</label>
					</th>
					<td>
						<input type="password" name="own_pw" required="required" id="own_pw" min="8" maxlength="16">
						<div id="pwc1"></div>
					</td>
				</tr>
				
				<tr>
					<th>
						<label for="own_pw">비밀번호확인</label>
					</th>
					<td>
						<input type="password" name="own_pwC" required="required" id="own_pwC" min="8">
						<div id="pwc2"></div>
					</td>
				</tr>
			
				<tr>
					<th>
						<label for="own_name">이름</label>
					</th>
					<td>
						<input type="text" name="own_name" required="required" id="own_name">
					</td>
				</tr>
			
			
				<tr class="mobileNo">
					<th>
						<label for="phone">휴대폰 번호</label>
					</th>
					<td>
						<p>
							<input id="phone" type="text" name="own_tel" title="전화번호 입력" required/>
							<span id="phoneChk" class="doubleChk btn btn-info">인증번호 보내기</span> <br/>
							<input id="phone2" type="text" name="phone2" title="인증번호 입력" disabled required/>
							<span id="phoneChk2" class="doubleChk btn btn-info">본인인증</span> <br>
							<span class="point successPhoneChk">휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span>
							<input type="hidden" id="phoneDoubleChk"/>
						</p>
						
					</td>
				</tr>
				<tr>
					<th>
						<label for="own_email">이메일</label>
					</th>	
					<td>
						<input type="text" name="own_email" required="required" id="own_email">
					</td>
				</tr>
				<tr>
					<th>
						<label for="ent_name">상호명</label>
					</th>
					<td>
						<input type="text" name="ent_name" required="required" id="ent_name">
					</td>
				</tr>
				<tr>
					<th>
						<label for="ent_cate">업종</label>
					</th>
					<td>
						<input type="text" name="ent_cate" required="required" id="ent_cate">
					</td>
				</tr>
				<tr>
					<th>
						<label for="ent_addr">주소</label>
					</th>
					<td>
						<p>
							<input type="text" class="form-control" name="post" required="required" id="zipNo" placeholder="우편번호"><br>
							<button class="btn btn-default" type="button" onclick="goPopup();">
								<i class="fa fa-search">주소검색</i>
							</button>
							<input type="text" class="form-control" name="ent_addr" required="required" id="roadFullAddr" placeholder="상세주소"><br>
						</p>
					</td>
				</tr>							
				<tr>
					<th>
						<label for="ent_mo">통신판매업</label>
					</th>
					<td>
						<input type="text" name="ent_mo" required="required" id="ent_mo">
					</td>
				</tr>
				<tr>
					<th>
						<label for="ent_file">사업자등록증</label>
					</th>
					<td>
						<input type="text" name="ent_file" required="required" id="ent_file">
					</td>
				</tr>
			</table>
			<input type="submit" value="가입하기" >
			<input type="button" value="취소" onclick="location.href='/ent/entMain'">
		</form>
	</fieldset>
	
	
	
	
	
<script	type="text/javascript">
	$(document).ready(function(){
		var code2 = "";
		$("#phoneChk").click(function(){
			alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
			var phone = $("#phone").val();
			$.ajax({
		        type:"GET",
		        url:"entPhoneCk?phone=" + phone,
		        cache : false,
		        success:function(data){
		        	if(data == "error"){
		        		alert("휴대폰 번호가 올바르지 않습니다.")
						$(".successPhoneChk").text("유효한 번호를 입력해주세요.");
						$(".successPhoneChk").css("color","red");
						$("#phone").attr("autofocus",true);
		        	}else{	        		
		        		$("#phone2").attr("disabled",false);
		        		$("#phoneChk2").css("display","inline-block");
		        		$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
		        		$(".successPhoneChk").css("color","green");
		        		$("#phone").attr("readonly",true);
		        		code2 = data;
		        	}
		        }
		    });
		});
		
		$("#phoneChk2").click(function(){
			if($("#phone2").val() == code2){
				$(".successPhoneChk").text("인증번호가 일치합니다.");
				$(".successPhoneChk").css("color","green");
				$("#phoneDoubleChk").val("true");
				$("#phone2").attr("disabled",true);
			}else{
				$(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
				$(".successPhoneChk").css("color","red");
				$("#phoneDoubleChk").val("false");
				$(this).attr("autofocus",true);
			}
		});
	
	
	
	
	});
	
	function goPopup(){
		//경로는 시스템에 맞게 수정하여 사용
		//호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를
		//호출하게 됩니다.
		var pop = window.open("/ent/jusoPopup","pop","width=570,height=350, scrollbars=yes, resizable=yes");
		//** 2017년 5월 모바일용 팝업 API 기능 추가제공 **/
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서
		// 실제 주소검색 URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		// var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");
		}
		
	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd,
		rnMgtSn, bdMgtSn , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm,
		buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
		 // 2017년 2월 제공항목이 추가되었습니다. 원하시는 항목을 추가하여 사용하시면 됩니다.
		 var address1 = document.querySelector("#zipNo");
		 address1.value = zipNo;
		 
		 var address2 = document.querySelector("#roadFullAddr");
		 address2.value = roadFullAddr;
		 
		}
	
	function checkId(){
		var own_id = $('#own_id').val();
		
		$.ajax({
			url:'/ent/entCheckId',
			type:'post',
			data:{own_id:own_id},
			success:function(cnt){
				if(cnt != 1 && own_id.length == 12){
					$('.id_ok').css("display","inline-block");
					$('.id_no').css("display","none");
					$('.id_ck').css("display","none");
				}else if(cnt == 1 && own_id.length == 12){
					$('.id_ok').css("display","none");
					$('.id_no').css("display","inline-block");
					$('.id_ck').css("display","none");
					$("#own_id").focus();
				}else if(own_id.length != 12){
					$('.id_ok').css("display","none");
					$('.id_no').css("display","none");
					$('.id_ck').css("display","inline-block");
					$("#own_id").focus();	
				}else{
					$('.id_ok').css("display","none");
					$('.id_no').css("display","none");
					$('.id_ck').css("display","none");
				}
			}
		})
		
	}
	
	$("#own_pw").blur(function() {
	 	let pwdCheck= /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
	 	
	 	if ($("#own_pw").val() == "") {
	         $("#pwc1").css("color", "red");
	         $("#pwc1").text("비밀번호를 입력하세요!");
	         password = false;
	      }	
	      else if (!pwdCheck.test($("#own_pw").val())) {
		  	 $("#pwc1").css("color", "red");
		     $("#pwc1").text("비밀번호는 영문+숫자+특수문자 조합하여 8~16자리를 사용해야 합니다");
		     password = false;
	      }else {
	    	  $("#pwc1").css("color", "blue");
			  $("#pwc1").text("안전한 비밀번호 입니다. 아래에 한번 더 입력하세요");
			  password = true;
	      }
	 	
	 
	 });
	
	/////비밀번호 확인//////
	$("#own_pwC").blur(function() {
		if($("#own_pwC").val() == "") {
			$("#pwc2").css("color", "red");
	        $("#pwc2").text("비밀번호 확인해주세요!");
	        $("#own_pwC").focus();
	        password_check = false;
		}
		else if(password == true && $("#own_pw").val() == $("#own_pwC").val()) {
			$("#pwc2").css("color", "blue");
			$("#pwc2").text("비밀번호가 일치합니다!");
			password_check = true;
		}else {
			$("#pwc2").css("color", "red");
			$("#pwc2").text("비밀번호를 다시 확인해주세요");
			$("#own_pwC").val("").focus();;
			password_check = false;
		}
	}); // pw

	
</script>
	
	
	
	
	
	
	
<%@ include file="../include/footer.jsp"%>
