package com.kh.coddy.board.recruitment.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.coddy.board.recruitment.model.vo.Prelation;
import com.kh.coddy.board.recruitment.model.vo.Rattachment;
import com.kh.coddy.board.recruitment.model.vo.Recruitment;

@Repository
public class RecruitmentDao {
	public int insertRecruitment(SqlSessionTemplate sqlSession, Recruitment r) {
		return sqlSession.insert("recruitmentMapper.insertRecruitment",r);
	}
	public int insertImg(SqlSessionTemplate sqlSession, Rattachment ra) {
		return sqlSession.insert("recruitmentMapper.insertImg",ra);
	}
	public int insertTag(SqlSessionTemplate sqlSession, Prelation rel) {
		return sqlSession.insert("recruitmentMapper.insertTag",rel);
	}
}
