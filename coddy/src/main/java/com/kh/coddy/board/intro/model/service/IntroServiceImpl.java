package com.kh.coddy.board.intro.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coddy.board.intro.model.dao.IntroDao;
import com.kh.coddy.board.intro.model.vo.IBoard;
import com.kh.coddy.board.intro.model.vo.Iattachment;
import com.kh.coddy.board.intro.model.vo.Ireply;
import com.kh.coddy.board.intro.model.vo.Isearch;
import com.kh.coddy.board.intro.model.vo.Likes;
import com.kh.coddy.board.job.model.vo.Hattachment;
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

	@Override
	public Iattachment selectattachment(IBoard ib) {

		Iattachment ia = introDao.selectattachment(sqlSession, ib);
		 
		return ia != null ? ia : new Iattachment(-1, ib.getIboardNo(), "white.jpg", "white.jpg", "resources\\image", null, 1);
	}

	@Override
	public int getWish(Likes iw) {

		return introDao.getWish(sqlSession, iw);
	}

	@Override
	public String deleteWish(Likes iw) {

		int result = introDao.deleteWish(sqlSession, iw); return (result > 0) ? "좋아요 제거에 성공함": "좋아요 제거에 실패함";
	}

	@Override
	public String insertWish(Likes iw) {

		int result = introDao.insertWish(sqlSession, iw); return (result > 0) ? "좋아요 추가에 성공함": "좋아요 추가에 실패함";
	}

	@Override
	public int insertReply(Ireply r) {

		return introDao.insertReply(sqlSession, r);
	}

}