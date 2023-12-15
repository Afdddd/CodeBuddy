package com.kh.coddy.board.code.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.coddy.board.code.model.vo.Cboard;
import com.kh.coddy.board.code.model.vo.Creply;
import com.kh.coddy.board.intro.model.vo.IBoard;
import com.kh.coddy.board.intro.model.vo.Iattachment;
import com.kh.coddy.board.recruitment.model.vo.Prelation;
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

		return (ArrayList)sqlSession.selectList("cboardMapper.selectList", null, rowBounds);
	}
	
	public int insertBoard(SqlSessionTemplate sqlSession, Cboard c) {
	
		return sqlSession.insert("cboardMapper.insertBoard", c);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int cboardNo) {

		return sqlSession.update("cboardMapper.increaseCount", cboardNo);
	}
	
	public Cboard selectBoard(SqlSessionTemplate sqlSession, int cboardNo) {
	
		return sqlSession.selectOne("cboardMapper.selectBoard", cboardNo);
	}
	
	public int deleteBoard(SqlSessionTemplate sqlSession, int cboardNo) {
		
		return sqlSession.update("cboardMapper.deleteBoard", cboardNo);
	}
	
	public int updateBoard(SqlSessionTemplate sqlSession, Cboard c) {
		
		return sqlSession.update("cboardMapper.updateBoard", c);
	}
	
	public ArrayList<Creply> selectReplyList(SqlSessionTemplate sqlSession, int cboardNo) {
	
		return (ArrayList)sqlSession.selectList("cboardMapper.selectReplyList", cboardNo);
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, Creply r) {
	
		return sqlSession.insert("cboardMapper.insertReply", r);
	}
	
	public ArrayList<Cboard> selectTopBoardList(SqlSessionTemplate sqlSession) {
	
		return (ArrayList)sqlSession.selectList("cboardMapper.selectTopBoardList");
	}

	public ArrayList<Prelation> getTagInfo(SqlSessionTemplate sqlSession, Cboard c) {
		
		return (ArrayList)sqlSession.selectList("cboardMapper.getTagInfo", c);
	}
	
}
