package com.kh.coddy.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @AllArgsConstructor @Setter @Getter @ToString
public class Member {
	private int memberNo;
	private String memberId;
	private String memberPwd;
	private String memberEmail;
	private String memberName;
	private String memberPhotoExtend;
	private String memberInfo;
	private String memberInsert;
	private String memberDelete;
}