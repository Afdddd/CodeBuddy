package com.kh.coddy.common.chat.controller;

import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatingHandler extends TextWebSocketHandler{

	private Set<WebSocketSession> userList = new CopyOnWriteArraySet<>();
	private Logger log = LoggerFactory.getLogger(getClass());
	
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		userList.add(session);
		log.info("사용자 접속 : 현재={}",userList.size());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		userList.remove(session);
		log.info("사용자 접속 종료 : 현재={}",userList.size());
	}
	

}
