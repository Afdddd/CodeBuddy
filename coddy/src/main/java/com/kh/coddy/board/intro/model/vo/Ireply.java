package com.kh.coddy.board.intro.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @AllArgsConstructor @Setter @Getter @ToString
public class Ireply {

	private int ireplyNo;		//	IREPLY_NO	NUMBER
	private int memberNo;		//	MEMBER_NO	NUMBER
	private int iboardNo;		//	IBOARD_NO	NUMBER
	private int ireplyParent;		//	IREPLY_PARENT	NUMBER
	private String ireplyContent;		//	IREPLY_CONTENT	VARCHAR2(2000 BYTE)
	private Date ireplyInsert;		//	IREPLY_INSERT	DATE
	private Date ireplyUpdate;		//	IREPLY_UPDATE	DATE
	private Date ireplyDelete;		//	IREPLY_DELETE	DATE
}
