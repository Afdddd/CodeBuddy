package com.kh.coddy.common.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @AllArgsConstructor @Getter @Setter @ToString
public class ChatMessage {

	private String roomId;    // 방번호
	private String messageId; // 메세지 번호	
	private String message;   // 메세지 내용
	private String name; 	  // 보낸사람 이름
	private int unReadCount;  // 안읽은 메세지 수
	private int sessionCount; // 현재 세션 수
}
