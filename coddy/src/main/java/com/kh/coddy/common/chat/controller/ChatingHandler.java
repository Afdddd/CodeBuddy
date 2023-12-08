package com.kh.coddy.common.chat.controller;



import java.util.ArrayList;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.coddy.common.chat.model.service.ChatService;
import com.kh.coddy.common.chat.model.vo.ChatMessage;
import com.kh.coddy.common.chat.model.vo.ChatRoom;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ChatingHandler extends TextWebSocketHandler{
	
	@Autowired
	public ChatService cService;
	
	private final ObjectMapper objectMapper = new ObjectMapper();

	// 채팅방 목록 <방 번호, ArrayList<session> >이 들어간다.
	private Map<String, ArrayList<WebSocketSession>> RoomList = new ConcurrentHashMap<>();
	
	// session, 방 번호가 들어간다.
	private Map<WebSocketSession,String> sessionList = new ConcurrentHashMap<>();
	
	private static int i;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		i++;
		log.info("연결 성공! 현재인원 = {}",i);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		i--;
		log.info("연결 종료! 현재인원 = {}",i);
		if(sessionList.get(session) != null) {
			RoomList.get(sessionList.get(session)).remove(session);
			sessionList.remove(session);
		}
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		//전달 받은 메세지
		String msg = message.getPayload();
		
		// Json 객체 -> java객체
		ChatMessage chatMessage = objectMapper.readValue(msg, ChatMessage.class);
		
		// 받은 메세지에 담긴 roomId로 해당 채팅방을 찾아온다.
		ChatRoom chatRoom = cService.selectChatRoom(chatMessage.getRoomId());
		
		
		// 채팅 세션 목록에 채팅방이 존재하지 않고, 처음 들어왔고, DB에서의 채팅방이 있을 때
		if(RoomList.get(chatRoom.getRoomId()) == null && chatMessage.getMessage().equals("ENTER-CHAT") && chatRoom != null) {
			
			ArrayList<WebSocketSession> sessionTwo = new ArrayList<>();
			sessionTwo.add(session);
			sessionList.put(session, chatRoom.getRoomId());
			
			// 해당 채팅방에 참여한 세션들 추가
			RoomList.put(chatRoom.getRoomId(), sessionTwo);
			
			log.info("채팅방 생성");
			// 채팅방이 존재할때
		}else if(RoomList.get(chatRoom.getRoomId()) != null && chatMessage.getMessage().equals("ENTER-CHAT") && chatRoom != null){
				// RoomList에서 해당 방번호를 가진 방이 있는지 확인.
			  RoomList.get(chatRoom.getRoomId()).add(session);
			  // sessionList에 추가
			  sessionList.put(session, chatRoom.getRoomId());
			  // 확인용
			  System.out.println("생성된 채팅방으로 입장");
			}
//		채팅 메세지 입략시 cpelse if()
			
		}
		
	}
	
		
		
		

}
