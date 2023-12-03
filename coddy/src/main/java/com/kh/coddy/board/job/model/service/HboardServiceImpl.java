package com.kh.coddy.board.job.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coddy.board.job.model.dao.HboardDao;
import com.kh.coddy.board.job.model.vo.Hattachment;
import com.kh.coddy.board.job.model.vo.Hboard;
import com.kh.coddy.board.job.model.vo.Hrelation;

@Service
public class HboardServiceImpl implements HboardService {
	@Autowired private SqlSessionTemplate sqlSession;
	@Autowired private HboardDao hboardDao;
	
	@Override public int insertBoard(Hboard h) { return hboardDao.insertBoard(sqlSession, h); }
	@Override public boolean insertTag(Hrelation hr) { return (hboardDao.insertTag(sqlSession, hr) > 0 ? true : false); }
	@Override public int insertThumb(Hattachment ha) { return hboardDao.insertThumb(sqlSession, ha); }
}