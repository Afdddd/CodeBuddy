package com.kh.coddy.board.free.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.coddy.board.free.model.vo.Freply;
import com.kh.coddy.common.vo.PageInfo;
import com.kh.coddy.board.free.model.vo.Fboard;
import com.kh.coddy.board.free.model.vo.Fattachment;


@Repository
public class FboardDao {
    
	public int selectListCount(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("fboardMapper.selectListCount");
	}
	
	public ArrayList<Fboard> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
//		(ArrayList)sqlSession.selectList("fboardMapper.selectList", null, rowBounds);
		return null;
	}
	
	public int insertBoard(SqlSessionTemplate sqlSession, Fboard f, Fattachment attachment) {
//		sqlSession.insert("fboardMapper.insertBoard", f);
		return 0;
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int fboardNo) {
//		sqlSession.update("fboardMapper.increaseCount", cboardNo);
		return 0;
	}
	
	public Fboard selectBoard(SqlSessionTemplate sqlSession, int fboardNo) {
//		sqlSession.selectOne("fboardMapper.selectBoard", fboardNo);
		return null;
	}
	
	public int deleteBoard(SqlSessionTemplate sqlSession, int fboardNo) {
//		sqlSession.update("fboardMapper.deleteBoard", fboardNo);
		return 0;
	}
	
	public int updateBoard(SqlSessionTemplate sqlSession, Fboard f) {
//		sqlSession.update("fboardMapper.updateBoard", f);
		return 0;
	}
	
	public ArrayList<Freply> selectReplyList(SqlSessionTemplate sqlSession, int fboardNo) {
//		(ArrayList)sqlSession.selectList("fboardMapper.selectReplyList", fboardNo);
		return null;
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, Freply fr) {
//		sqlSession.insert("boardMapper.insertReply", fr);
		return 0;
	}
	
	public ArrayList<Fboard> selectTopBoardList(SqlSessionTemplate sqlSession) {
//		(ArrayList)sqlSession.selectList("boardMapper.selectTopBoardList");
		return null;
	}
	
}
