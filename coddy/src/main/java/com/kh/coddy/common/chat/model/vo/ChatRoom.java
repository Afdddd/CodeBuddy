package com.kh.coddy.common.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @AllArgsConstructor @Getter @Setter @ToString
public class ChatRoom {
	
	private String roomId;  // 방번호
	private String userName;// 사용자 이름
	private String userPic; // 사용자 사진
	private String masterName; // 상대방 이름
	private String masterPic;  // 상대방 사진
	private int unReadCount;   // 안읽은메세지 수
	
}