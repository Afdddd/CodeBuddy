package com.kh.coddy.board.intro.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @AllArgsConstructor @Setter @Getter @ToString
public class IBoard {

	
	private int iboardNo;		//	IBOARD_NO	NUMBER
	private String iboardTitle;		//	IBOARD_TITLE	VARCHAR2(400 BYTE)
	private String iboardContent;		//	IBOARD_CONTENT	VARCHAR2(4000 BYTE)
	private String iboardWriter;		//	IBOARD_WRITER	NUMBER
	private String iboardInsert;		//	IBOARD_INSERT	DATE
	private Date iboardUpade;		//	IBOARD_UPDATE	DATE
	private Date iboardDelete;		//	IBOARD_DELETE	DATE
	private int projectNo;		//	PROJECT_NO	NUMBER
	private int iboardViews;		//	IBOARD_VIEWS	NUMBER
	
	// 필요한 정보들
	private int recruitMentNo;
	private int memberNo;
}
