package com.kh.coddy.board.intro.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.coddy.board.intro.model.vo.IBoard;
import com.kh.coddy.board.intro.model.vo.Iattachment;
import com.kh.coddy.board.intro.model.vo.Isearch;
import com.kh.coddy.board.job.model.vo.HSearch;
import com.kh.coddy.board.recruitment.model.vo.Prelation;
import com.kh.coddy.common.vo.PageInfo;

@Repository
public class IntroDao {

	public int insertBoard(SqlSessionTemplate sqlSession, IBoard i) {
		
		return sqlSession.insert("introMapper.insertBoard", i);
		
	}

	public int insertBoardImg(SqlSessionTemplate sqlSession, Iattachment ia) {
		
		return sqlSession.insert("introMapper.insertBoardImg", ia);
	}


	public int increaseCount(SqlSessionTemplate sqlSession, int iboardNo) {
		
		return sqlSession.update("introMapper.increaseCount", iboardNo);
	}

	public ArrayList<Iattachment> selectattachment(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("introMapper.selectattachment");
	}

	public Iattachment selectattachment(SqlSessionTemplate sqlSession, int iboardNo) {
		
		return sqlSession.selectOne("introMapper.selectattachment", iboardNo);
	}

	public ArrayList<Prelation> getTagInfo(SqlSessionTemplate sqlSession, IBoard ib) {
		
		return (ArrayList)sqlSession.selectList("introMapper.getTagInfo", ib);
	}

	public int getWishList(SqlSessionTemplate sqlSession, IBoard ib) {
		
		return sqlSession.selectOne("introMapper.getWishList", ib);
	}

	public int selectListCount(SqlSessionTemplate sqlSession, Isearch is) {
		
		return sqlSession.selectOne("introMapper.selectListCount", is);
	}

	public ArrayList<IBoard> selectList(SqlSessionTemplate sqlSession, PageInfo pi, Isearch is) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("iboardMapper.selectList", is, new RowBounds(offset, limit));

	}
	
}