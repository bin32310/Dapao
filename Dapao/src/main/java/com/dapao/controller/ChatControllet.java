package com.dapao.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/websocket/*")
public class ChatControllet {

	private static final Logger logger = LoggerFactory.getLogger(ChatControllet.class);
	
	@RequestMapping("/chat")
	public String Chat() throws Exception{
		logger.info("chat");
		
		return "chat";
	}
	@RequestMapping("/echo")
	public String echo() throws Exception{
		logger.info("echo");
		
		return "echo";
	}

}
