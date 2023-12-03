package com.kh.coddy.board.job.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.coddy.board.job.model.vo.Hattachment;
import com.kh.coddy.board.job.model.vo.Hboard;
import com.kh.coddy.board.job.model.vo.Hrelation;
import com.kh.coddy.common.vo.PageInfo;

@Repository
public class HboardDao {
	public int insertBoard(SqlSessionTemplate sqlSession, Hboard h) { return sqlSession.insert("hboardMapper.insertBoard", h); }
	public int insertTag(SqlSessionTemplate sqlSession, Hrelation hr) { return sqlSession.insert("hboardMapper.insertTag", hr); }
	public int insertThumb(SqlSessionTemplate sqlSession, Hattachment ha) { return sqlSession.insert("hboardMapper.insertThumb", ha); }
	public int selectListCount(SqlSessionTemplate sqlSession) { return sqlSession.selectOne("hboardMapper.selectListCount"); }
	public ArrayList<Hboard> selectList(SqlSessionTemplate sqlSession, PageInfo pi) { int limit = pi.getBoardLimit(); int offset = (pi.getCurrentPage() - 1) * limit; return (ArrayList)sqlSession.selectList("hboardMapper.selectList", null, new RowBounds(offset, limit)); }
}