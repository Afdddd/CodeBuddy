package com.kh.coddy.board.recruitment.model.vo;

import java.util.ArrayList;

import com.kh.coddy.common.vo.PageInfo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @AllArgsConstructor @Getter @Setter @ToString
public class TestDto {
	private PageInfo pi;
	private ArrayList<Recruitment> list;
	private ArrayList<ArrayList<Prelation>> tg_list;
	private ArrayList<ArrayList<RecruitmentState>> pos_list;
	private ArrayList<Boolean> ws_list;
}
