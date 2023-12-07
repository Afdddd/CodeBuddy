package com.kh.coddy.board.intro.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.coddy.board.intro.model.vo.IBoard;
import com.kh.coddy.board.intro.model.vo.Iattachment;
import com.kh.coddy.common.vo.PageInfo;

@Repository
public class IntroDao {

	public int insertBoard(SqlSessionTemplate sqlSession, IBoard i) {
		
		return sqlSession.insert("introMapper.insertBoard", i);
		
	}

	public int insertBoardImg(SqlSessionTemplate sqlSession, Iattachment ia) {
		
		return sqlSession.insert("introMapper.insertBoardImg", ia);
	}

	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("introMapper.selectListCount");
		
	}

	public ArrayList<IBoard> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("introMapper.selectList", null, rowBounds);
		
	}
	
}