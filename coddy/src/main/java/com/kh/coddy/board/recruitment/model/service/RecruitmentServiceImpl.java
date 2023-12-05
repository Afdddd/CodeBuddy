package com.kh.coddy.board.recruitment.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coddy.board.recruitment.model.dao.RecruitmentDao;
import com.kh.coddy.board.recruitment.model.vo.Rattachment;
import com.kh.coddy.board.recruitment.model.vo.Recruitment;

@Service
public class RecruitmentServiceImpl implements RecruitmentService{

	@Autowired
	private RecruitmentDao rDao;
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertRecruitment(Recruitment r) {
		return rDao.insertRecruitment(sqlSession, r);
	}

	@Override
	public int insertImg(Rattachment ra) {
		return rDao.insertImg(sqlSession,ra);
	}
	

}
