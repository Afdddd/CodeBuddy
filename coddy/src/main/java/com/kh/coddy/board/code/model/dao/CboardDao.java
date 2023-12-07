package com.kh.coddy.board.code.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.coddy.board.code.model.vo.Cboard;
import com.kh.coddy.board.code.model.vo.Creply;
import com.kh.coddy.common.vo.PageInfo;

@Repository
public class CboardDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("boardMapper.selectListCount");
	}
	
	public ArrayList<Cboard> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", null, rowBounds);
	}
	
	public int insertBoard(SqlSessionTemplate sqlSession, Cboard c) {
		
		return sqlSession.insert("boardMapper.insertBoard", c);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int cboardNo) {
		
		return sqlSession.update("boardMapper.increaseCount", cboardNo);
	}
	
	public Cboard selectBoard(SqlSessionTemplate sqlSession, int cboardNo) {
		
		return sqlSession.selectOne("boardMapper.selectBoard", cboardNo);
	}
	
	public int deleteBoard(SqlSessionTemplate sqlSession, int cboardNo) {
		
		return sqlSession.update("boardMapper.deleteBoard", cboardNo);
	}
	
	public int updateBoard(SqlSessionTemplate sqlSession, Cboard c) {
		
		return sqlSession.update("boardMapper.updateBoard", c);
	}
	
	public ArrayList<Creply> selectReplyList(SqlSessionTemplate sqlSession, int cboardNo) {
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectReplyList", cboardNo);
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, Creply r) {
	
		return sqlSession.insert("boardMapper.insertReply", r);
	}
	
	public ArrayList<Cboard> selectTopBoardList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectTopBoardList");
	}


}
