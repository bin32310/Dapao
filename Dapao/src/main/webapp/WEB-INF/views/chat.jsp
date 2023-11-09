<%@ page language="java" 
    pageEncoding="UTF-8"%>
<%@include file="./include/header.jsp"%>

<title>채팅</title>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script> 
<script type="text/javascript">
	var wsocket = null;
	connect();
	
	function connect(){
		var ws = new WebSocket("wss://localhost:8088/chat");
		wsocket = ws;
		ws.onopen = function() {
			console.log('Info: connection opened.');
		};
		
		ws.onmessage = function (evt){
			var data = evt.data;
			if (data.substring(0, 4) == "msg:") {
				appendMessage(data.substring(4));
			}
			console.log("evt.data"+evt.data);
		};
		
		ws.onclose = function(evt){
			console.log('Info: connection closed'); 
		};
		
		ws.onerror = function(err){console.log("Error : "+err);}
	}
	$(document).ready(function() {
		$('#btnSend').on('click', function(evt) {
			var receiveId = $('#receiveId').val();
			var msg = $('#msg').val();
			evt.preventDefault();
			if (wsocket.readyState !== 1 ) return;
			wsocket.send(gUserId + "," + receiveId + "," + msg);
		});
		
		$('#wsClose').on('click', function(e) {
			wsocket.onclose();
			
		});
	});
	
	
// 	function appendMessage(msg) {//메세지를 받기
// 		$("#chatMessageArea").append(msg+"<br>");
// 		var chatAreaHeight = $("#chatArea").height();
// 		var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
// 		$("#chatArea").scrollTop(maxScroll);
// 	}

// 	$(document).ready(function() {
// 		$('#message').keypress(function(event){
// 			var keycode = (event.keyCode ? event.keyCode : event.which);
// 			if(keycode == '13'){//엔터면
// 				send();//보내기 함수 실행
// 			}
// 			event.stopPropagation();
// 		});
		
// 		var nickname = $("#nickname").val();
// 		$('#sendBtn').click(function() {
// 			var nickname = $("#nickname").val();
// 			console.log("nick : "+nickname);
// 			var msg = $("#message").val();
// 			console.log("msg"+msg);
			
// 			wsocket.send("msg:"+JSON.stringify(nickname)+":" +JSON.stringify(msg));
// 			$("#message").val("");
// 			wsocket.onmessage = onMessage;
// 		});//버튼 클릭 시 알맞는 함수 실행
		
// 		$('#enterBtn').click(function() {
			
// 			//처리 함수 지정
// 			$('#message').append(nickname+"연결되었습니다.");
// 		});
		
// 		$('#exitBtn').click(function() {
// 			wsocket.onclose = onClose;
// 			 wsocket.close(); 
// 		});
// 	});
</script>
<style type="text/css">
#messagePop {
	width: 437px;
	height: 256px;
	border: solid 1px;
	background-color: lightgrey;
}

#msg {
	width: 200px;
	height: 30px;
}

.well {
	margin-left: 5px;
    margin-top: 10px;
}

#receiveId {
	height: 30px;
	width: 90px;
}

.pop {
	width: 400px;
	height: 180px;
	border: 1px solid gray;
	position: relative;
}

#popTitle {
	height: 50px;
	background-color: #4D85C5;
}

#popTitle h3 {
	margin: 0;
	padding-top: 13px;
	margin-left: 10px;
	color: white;
}

#popCont {
	margin: 17px;
    border: 1px solid white;
    padding: 1em;
    
}

#popCont .pContent {
    margin-bottom: 1em;
    padding: 0;
}

.popClose {
	width: 1em;
	height: 1em;
	right: 0;
	top: 0;
	position: absolute;
	cursor: pointer;
	margin-right: 0.1em;
	margin-top: 0.1em;
	border: 1px solid white;
}
</style>

<!-- 	이름:<input type="text" id="nickname"> -->
<!-- 	<input type="button" id="enterBtn" value="입장"> -->
<!-- 	<input type="button" id="exitBtn" value="나가기"> -->
    
<!--     <h1>대화 영역</h1> -->
<!--     <div id="chatArea"><div id="chatMessageArea"></div></div> -->
<!--     <br/> -->
<!--     <input type="text" id="message"> -->
<!--     <input type="button" id="sendBtn" value="전송"> -->
<div id="messagePop">
		<div class="well">
		<span class="popClose"><p>x</p></span>
			아이디 : <input type="text" id="receiveId" value="" class="form-control" /> 
			내용 : <input type="text" id="msg" value="" class="form-control" />
			<button class="btn btn-primary" id="btnSend">Send Message</button>
		</div>
		
		<div id="popCont">
			<p id="writer" class="pContent"></p>
			<p id="receiver" class="pContent"></p>
			<p id="content" class="pContent"></p>
		</div>
	</div>
    
<%@include file="./include/footer.jsp"%>