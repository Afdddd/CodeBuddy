package com.kh.coddy.board.recruitment.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor @NoArgsConstructor @Setter @Getter @ToString
public class Recruitment {
	private int recruitmentNo;			//	RECRUITMENT_NO
	private String recruitmentTitle;	//	RECRUITMENT_TITLE
	private String recruitmentContent;	//	RECRUITMENT_CONTENT
	private String recruitmentWriter;	//	RECRUITMENT_WRITER
	private String recruitmentInsert;	//	RECRUITMENT_INSERT
	private String recruitmentUpdate;	//	RECRUITMENT_UPDATE
	private String recruitmentDelete;	//	RECRUITMENT_DELETE
	private int recruitmentView;		//	RECRUITMENT_VIEWS
	private String recruitmentStart;	//	RECRUITMENT_START
	private String recruitmentEnd;		//	RECRUITMENT_END
	private String recruitmentLocation;	//	RECRUITMENT_LOCATION
}
