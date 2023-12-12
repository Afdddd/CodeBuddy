package com.kh.coddy.board.free.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Fboard {
			
	private int fboardNo;			//	FBOARD_NO   NUMBER
	private String fboardTitle;		//	FBOARD_TITLE    VARCHAR2(400)
	private String fboardContent;	//	FBOARD_CONTENT  VARCHAR2(4000)
	private String fboardWriter;		//	FBOARD_WRITER   NUMBER
	private String fboardInsert;	//	FBOARD_INSERT   DATE
	private String fboardUpdate;	//	FBOARD_UPDATE   DATE
	private String fboardDelte;		//	FBOARD_DELETE   DATE
	private int fboardViews;		//	FBOARD_VIEWS    NUMBER
	private String originName;		//	ORIGIN_NAME	VARCHAR2(100 BYTE)
	private String changeName;		//	CHANGE_NAME	VARCHAR2(100 BYTE)
	
}
