package com.kh.coddy.board.job.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.coddy.board.job.model.vo.Hattachment;
import com.kh.coddy.board.job.model.vo.Hboard;
import com.kh.coddy.board.job.model.vo.Hrelation;

@Repository
public class HboardDao {
	public int insertBoard(SqlSessionTemplate sqlSession, Hboard h) { return sqlSession.insert("hboardMapper.insertBoard", h); }
	public int insertTag(SqlSessionTemplate sqlSession, Hrelation hr) { return sqlSession.insert("hboardMapper.insertTag", hr); }
	public int insertThumb(SqlSessionTemplate sqlSession, Hattachment ha) { return sqlSession.insert("hboardMapper.insertThumb", ha); }
}