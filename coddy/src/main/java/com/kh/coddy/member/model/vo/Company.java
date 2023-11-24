package com.kh.coddy.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @AllArgsConstructor @Setter @Getter @ToString
public class Company {
	private int companyNo;
	private String companyName;
	private String companyOwner;
	private String companyId;
	private String companyPwd;
	private String companyEmail;
	private String companyPhotoExtend;
	private String companyBno;
	private String companyInfo;
	private String companyInsert;
	private String companyDelete;
	private int companyWorker;
	private int companySalary;
}