package com.kh.coddy.board.intro.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coddy.board.intro.model.dao.IntroDao;
import com.kh.coddy.board.intro.model.vo.IBoard;
import com.kh.coddy.board.intro.model.vo.Iattachment;
import com.kh.coddy.board.intro.model.vo.Isearch;
import com.kh.coddy.board.recruitment.model.vo.Prelation;
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
	public ArrayList<IBoard> selectList(PageInfo pi, Isearch is) {


		return introDao.selectList(sqlSession, pi, is);
	}

	@Override
	public int increaseCount(int iboardNo) {
		
		return introDao.increaseCount(sqlSession, iboardNo);
	}

	@Override
	public Iattachment selectattachment(int iboardNo) {
		
		return introDao.selectattachment(sqlSession, iboardNo);
	}

	@Override
	public ArrayList<Prelation> getTagInfo(IBoard ib) {
		
		return introDao.getTagInfo(sqlSession, ib);
	}

	@Override
	public Boolean getWishList(IBoard ib, int mno) {
		
		ib.setIboardContent(String.valueOf(mno)); return introDao.getWishList(sqlSession, ib) > 0 ? true : false;
	}

	@Override
	public int selectListCount(Isearch is) {
		
		return introDao.selectListCount(sqlSession, is);
	}

}