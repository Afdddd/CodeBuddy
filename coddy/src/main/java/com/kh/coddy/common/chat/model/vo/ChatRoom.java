package com.kh.coddy.common.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @AllArgsConstructor @Getter @Setter @ToString
public class ChatRoom {
	
	private Integer roomId;  // 방번호
	private int userNo;
	private String userName;// 사용자 이름
	private String userPhoto; // 사용자 사진
	private int masterNo;
	private String masterName; // 상대방 이름
	private String masterPhoto;  // 상대방 사진
	private int unReadCount;   // 안읽은메세지 수
	
}