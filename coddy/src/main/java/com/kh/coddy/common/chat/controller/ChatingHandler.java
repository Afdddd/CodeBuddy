package com.kh.coddy.common.chat.controller;

import java.util.ArrayList;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.coddy.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ChatingHandler extends TextWebSocketHandler{
	// 여러 스레드가 동시에 안전하게 맵을 수정하기 위해 ConcurrentHashMap 이용
	// 채팅방 목록<채팅방 번호, 세션리스트>
	private Map<String, ArrayList<WebSocketSession>> roomList = new ConcurrentHashMap<>();
	// 세션 목록<세션, 방번호>
	private Map<WebSocketSession, String> sessionList = new ConcurrentHashMap<>();
	
	private Set<WebSocketSession> userList = new CopyOnWriteArraySet<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		userList.add(session);
		log.info("사용자 접속 : 현재={}",userList.size());
		Member m = (Member)session.getAttributes().get("loginMember");
		log.info("m = {}",m.getMemberName());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		TextMessage newMessage = new TextMessage(message.getPayload());
		
		log.info("message = {}",message.getPayload());
		
		for(WebSocketSession ws : userList) {
			ws.sendMessage(newMessage);
			
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception { 
		userList.remove(session);
		log.info("사용자 접속 종료 : 현재={}",userList.size());
	}
}