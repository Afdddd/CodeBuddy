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

		return sqlSession.selectOne("cboardMapper.selectListCount");
	}
	
	public ArrayList<Cboard> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
//		(ArrayList)sqlSession.selectList("cboardMapper.selectList", null, rowBounds);
		return null;
	}
	
	public int insertBoard(SqlSessionTemplate sqlSession, Cboard c) {
//		sqlSession.insert("boardMapper.insertBoard", c);
		return 0;
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int cboardNo) {
//		sqlSession.update("boardMapper.increaseCount", cboardNo);
		return 0;
	}
	
	public Cboard selectBoard(SqlSessionTemplate sqlSession, int cboardNo) {
//		sqlSession.selectOne("boardMapper.selectBoard", cboardNo);
		return null;
	}
	
	public int deleteBoard(SqlSessionTemplate sqlSession, int cboardNo) {
//		sqlSession.update("boardMapper.deleteBoard", cboardNo);
		return 0;
	}
	
	public int updateBoard(SqlSessionTemplate sqlSession, Cboard c) {
//		sqlSession.update("boardMapper.updateBoard", c);
		return 0;
	}
	
	public ArrayList<Creply> selectReplyList(SqlSessionTemplate sqlSession, int cboardNo) {
//		(ArrayList)sqlSession.selectList("boardMapper.selectReplyList", cboardNo);
		return null;
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, Creply r) {
//		sqlSession.insert("boardMapper.insertReply", r);
		return 0;
	}
	
	public ArrayList<Cboard> selectTopBoardList(SqlSessionTemplate sqlSession) {
//		(ArrayList)sqlSession.selectList("boardMapper.selectTopBoardList");
		return null;
	}


}
