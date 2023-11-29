package com.kh.coddy.board.code.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Creply {

	private int creplyNo; 		 	//	REPLY_NO	NUMBER
	private int memberNo;			//	MEMBER_NO  NUMBER
	private int cboardNo;			//	CBOARD_NO  NUMBER
	private int creplyParent;		//	CREPLY_PARENT  NUMBER
	private String creplyContent;	//	CREPLY_CONTENT  VARCHAR2(2000)
	private String creplyInsert;	//	CREPLY_INSERT  DATE
	private String creplyUpdate;	//	CREPLY_UPDATE  DATE
	private String creplyDelete;	//	CREPLY_DELETE  DATE

}
