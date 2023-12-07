package com.kh.coddy.board.intro.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coddy.board.intro.model.dao.IntroDao;
import com.kh.coddy.board.intro.model.vo.IBoard;
import com.kh.coddy.board.intro.model.vo.Iattachment;
import com.kh.coddy.common.vo.PageInfo;

@Service
public class IntroServiceImpl implements IntroService {

	@Autowired
	private IntroDao introDao;
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertBoard(IBoard i) {
		
		return introDao.insertBoard(sqlSession , i);
	}

	@Override
	public int insertBoardImg(Iattachment ia) {
		
		return introDao.insertBoardImg(sqlSession, ia);
	}

	@Override
	public int selectListCount() {


		return introDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<IBoard> selectList(PageInfo pi) {


		return introDao.selectList(sqlSession, pi);
	}
	
}