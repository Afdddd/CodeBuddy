package com.kh.coddy.board.recruitment.model.service;

import java.util.ArrayList;

import com.kh.coddy.board.recruitment.model.vo.Prelation;
import com.kh.coddy.board.recruitment.model.vo.Project;
import com.kh.coddy.board.recruitment.model.vo.Rattachment;
import com.kh.coddy.board.recruitment.model.vo.Recruitment;
import com.kh.coddy.board.recruitment.model.vo.RecruitmentState;
import com.kh.coddy.board.recruitment.model.vo.RecruitmentWishList;
import com.kh.coddy.common.vo.PageInfo;

public interface RecruitmentService {
	int insertRecruitment(Recruitment r);
	int insertImg(Rattachment ra);
	int insertTag(Prelation rel);
	int insertState(RecruitmentState state);
	int selectListCount();
	ArrayList<Recruitment> selectList(PageInfo pi);
	Rattachment getThumbOne(Recruitment r);
	ArrayList<Prelation> getTagInfo(Recruitment r);
//	public Boolean getWishList(Recruitment r, int mno);
	
	//프로젝트 생성
	int createProject(Project p);
}
