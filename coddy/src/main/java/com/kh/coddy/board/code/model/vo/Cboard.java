package com.kh.coddy.board.code.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Cboard {
			
	private int cboardNo;			//	CBOARD_NO   NUMBER
	private String cboardTitle;		//	CBOARD_TITLE    VARCHAR2(400)
	private String cboardContent;	//	CBOARD_CONTENT  VARCHAR2(4000)
	private int cboardWriter;		//	CBOARD_WRITER   NUMBER
	private String cboardInsert;	//	CBOARD_INSERT   DATE
	private String cboardUpdate;	//	CBOARD_UPDATE   DATE
	private String cboardDelte;		//	CBOARD_DELETE   DATE
	private int cboardViews;		//	CBOARD_VIEWS    NUMBER
	private String originName;		//	ORIGIN_NAME	VARCHAR2(100 BYTE)
	private String changeName;		//	CHANGE_NAME	VARCHAR2(100 BYTE)
	
}
