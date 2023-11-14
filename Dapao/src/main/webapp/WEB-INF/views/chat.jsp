<%@ page language="java" 
    pageEncoding="UTF-8"%>
<%@include file="./include/header.jsp"%>

<title>채팅</title>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script type="text/javascript">
// 	$("#sendBtn").click(function() {
// 		sendMessage();
// 		$('#msg').val('')
// 	});

// 	var sock = new SockJS("http://localhost:8088/chat");
// 	sock.onmessage = onMessage;
// 	sock.onclose = onClose;
	
	  var sock;
      document.addEventListener("DOMContentLoaded", function() {
    	 sock = new SockJS("http://localhost:8088/chat");

    	 sock.onopen = function (event) {
//              var user = '${username}';
//              var str = user+"님이 입장하셨습니다.";
//              $("#msgArea").append(str);
          };
          
    	 sock.onclose = function (event) {
//              var user = '${username}';
//              var str = user+"님이 퇴장하셨습니다.";
//              $("#msgArea").append(str);
          };

         
		sock.onmessage = function(event) {
			var data = event.data;
			var sessionId = null; //데이터를 보낸 사람
			var message = null;
			var arr = data.split(":");
			var cur_session = '${userid}';
			for (var i = 0; i < arr.length; i++) {
				console.log('arr[' + i + ']: ' + arr[i]);
			}
			console.log(cur_session)
			sessionId = arr[0];
			message = arr[1];

			if (sessionId == cur_session) {

				var str = "<div class='col-6'>";
					str += "<div class='alert alert-secondary'>";
					str += "<b>" + sessionId + " : " + message + "</b>";
					str += "</div></div>";

					$("#msgArea").append(str);
			} else {

				var str = "<div class='col-6'>";
					str += "<div class='alert alert-warning'>";
					str += "<b>" + sessionId + " : " + message + "</b>";
					str += "</div></div>";

					$("#msgArea").append(str);
			}
		}
	});

	function send() {
		var message = document.querySelector("#msg");
		sock.send(message.value);
		message.value = '';
	}
</script>

<div class="container">
	<div class="col-6">
		<label><b>채팅방</b></label>
	</div>
	<div>
		<div id="msgArea" class="col">
		
		</div>
		<div class="col-6">
		<div class="input-group mb-3">
			<input type="text" id="msg" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
			<div class="input-group-append">
				<button class="btn btn-outline-secondary" type="button" id="button-send" onclick="send()">전송</button>
			</div>
		</div>
		</div>
	</div>
	<div class="col-6">
	</div>
</div>
<%@include file="./include/footer.jsp"%>