package com.dapao.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/websocket/*")
public class ChatControllet {

	private static final Logger logger = LoggerFactory.getLogger(ChatControllet.class);
	
//	@RequestMapping("/chat")
//	public String Chat() throws Exception{
//		logger.info("chat");
//		
//		return "chat";
//	}
	
	
	@MessageMapping("/chat4")
	@SendTo("/topic")
	public String sendMsg(@Payload Map<String, Object> data) {
		logger.debug("chat4");
		return "chat4";
	}
	
	// http://localhost:8088/websocket/chat
	// http://localhost:8088/chat
	@RequestMapping("/chat/{id}")
	 public String chattingRoom(@PathVariable String id, HttpSession session, Model model){
			id = session.getId();
	        if(id != null){
	            model.addAttribute("id", id);
	        }else{
	            return "로그인이 필요합니다";
	        }
	        return "chat";
	    }

}
