package com.kh.coddy.common.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @AllArgsConstructor @Getter @Setter @ToString
public class Chat {
	
	private int chatNo; 
	private int	masterNo;	 // 본인
	private int userNo;  	 // 상대방
	private int projectNo;   // 프로젝트 방
	private int unReadCount; // 안읽은 메세지 수
}