package com.kh.coddy.board.recruitment.model.service;

import com.kh.coddy.board.recruitment.model.vo.Prelation;
import com.kh.coddy.board.recruitment.model.vo.Rattachment;
import com.kh.coddy.board.recruitment.model.vo.Recruitment;

public interface RecruitmentService {
	int insertRecruitment(Recruitment r);
	int insertImg(Rattachment ra);
	int insertTag(Prelation rel);
}
