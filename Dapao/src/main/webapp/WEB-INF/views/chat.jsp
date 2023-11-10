<%@ page language="java" 
    pageEncoding="UTF-8"%>
<%@include file="./include/header.jsp"%>

<title>채팅</title>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script> 
<script type="text/javascript">
	
	
	var ws = new SockJS("http://localhost:8088/chat");
	
	ws.addEventListener("open",function(event){
		ws.send("hello!!!!");
	});
// 	ws.onopen = function() {
// 	console.log('Info: connection opened.');
	
	
</script> 
    
<%@include file="./include/footer.jsp"%>