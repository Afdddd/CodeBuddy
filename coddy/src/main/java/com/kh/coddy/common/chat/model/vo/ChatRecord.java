package com.kh.coddy.common.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @AllArgsConstructor @Getter @Setter @ToString
public class ChatRecord {
	private int chatrNo;
	private int chatNo;
	private String chatrSender;
	private String chatrMsg;
	private String chatrInsert;
	private String chatrUpdate;
	private String chatrDelete;
}