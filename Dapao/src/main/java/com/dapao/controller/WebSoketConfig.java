package com.dapao.controller;

import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@EnableWebSocket
public class WebSoketConfig implements WebSocketConfigurer{
	
	private final ChatWebSocketHandler webSocketHandler = new ChatWebSocketHandler();
	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(webSocketHandler, "/chat").setAllowedOrigins("*");
	}
}
