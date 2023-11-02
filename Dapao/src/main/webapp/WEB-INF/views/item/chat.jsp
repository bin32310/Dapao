<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<script src="http://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
 	<!-- jQuery 2.1.4 -->
  	<script src="${pageContext.request.contextPath }/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<title>Insert title here</title>

</head>
<body>

	socket page <br><br>
	
	
	<input type="text" id="message"><br>
	<button type="button" id="sendBtn" value="submit">전송</button>
	<div id="messageArea"></div>
	
	
	
</body>

<script type="text/javascript">
	
	
	
	$("#sendBtn").click(function(){
		
		sendMessage();
		$('#message').val('')
		
	});
		
// 		let sock = new SockJS("http://localhost:8088/controller/echo/");
		let sock = new SockJS("ws://echo/");
		sock.onmessage = onMessage;
		//sock.onclose = onClose;
		
		
		// 메세지 전송
		function sendMessage(){
			sock.send($("#message").val());
			
		}
		
		// 서버로부터 메세지를 받았을 때
		function onMessage(msg){
			var data = msg.data;
			$("#messageArea").append(data+"<br>");
		}
		
		// 서버와 연결을 끊었을 때
		function onClose(evt){
			$("#messageArea").append("연결 끊김");
		}


</script>
</html>