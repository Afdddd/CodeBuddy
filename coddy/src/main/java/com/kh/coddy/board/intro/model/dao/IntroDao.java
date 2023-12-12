package com.kh.coddy.board.intro.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.coddy.board.intro.model.vo.IBoard;
import com.kh.coddy.board.intro.model.vo.Iattachment;
import com.kh.coddy.board.intro.model.vo.Ireply;
import com.kh.coddy.board.intro.model.vo.Isearch;
import com.kh.coddy.board.intro.model.vo.Likes;
import com.kh.coddy.board.job.model.vo.HSearch;
import com.kh.coddy.board.job.model.vo.Hattachment;
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

	public ArrayList<Iattachment> selectattachment(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("introMapper.selectattachment");
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
		
		return (ArrayList)sqlSession.selectList("introMapper.selectList", is, new RowBounds(offset, limit));

	}

	public Iattachment selectattachment(SqlSessionTemplate sqlSession, IBoard ib) {
		
		return (Iattachment)sqlSession.selectOne("introMapper.selectattachment", ib);
		
	}

	public int getWish(SqlSessionTemplate sqlSession, Likes iw) {
		
		return sqlSession.selectOne("introMapper.getWish", iw);
		
	}

	public int deleteWish(SqlSessionTemplate sqlSession, Likes iw) {
		
		return sqlSession.delete("introMapper.deleteWish", iw);
		
	}

	public int insertWish(SqlSessionTemplate sqlSession, Likes iw) {
		
		return sqlSession.insert("introMapper.insertWish", iw);
		
	}

	public int insertReply(SqlSessionTemplate sqlSession, Ireply r) {
		
		return sqlSession.insert("introMapper.insertWish", r);
	}

	public int plusView(SqlSessionTemplate sqlSession, int ino) {
		
		return sqlSession.update("introMapper.plusView", ino);
		
	}

	public IBoard selectBoard(SqlSessionTemplate sqlSession, int ino) {

		return sqlSession.selectOne("introMapper.selectBoard", ino);
	}

	public ArrayList<Iattachment> getAttachmentList(SqlSessionTemplate sqlSession, IBoard ib) {
	
		return (ArrayList)sqlSession.selectList("introMapper.getAttachmentList", ib);
	}

	public int getAllWish(SqlSessionTemplate sqlSession, int iboardNo) {
		
		return sqlSession.selectOne("introMapper.getAllWish", iboardNo);
	}

	public int deleteForm(SqlSessionTemplate sqlSession, int iboardNo) {
		
		return sqlSession.update("introMapper.deleteForm", iboardNo);
	}



	
}