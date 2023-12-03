package com.kh.coddy.board.job.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coddy.board.job.model.dao.HboardDao;
import com.kh.coddy.board.job.model.vo.Hboard;
import com.kh.coddy.board.job.model.vo.Hrelation;

@Service
public class HboardServiceImpl implements HboardService {
	@Autowired private SqlSessionTemplate sqlSession;
	@Autowired private HboardDao hboardDao;
	
	@Override public int insertBoard(Hboard h) { return hboardDao.insertBoard(sqlSession, h); }
	@Override public boolean insertTag(Hrelation hr) { int result = hboardDao.insertTag(sqlSession, hr); if(result > 0) return true; else return false; }
}