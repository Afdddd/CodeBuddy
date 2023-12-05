package com.kh.coddy.board.job.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.coddy.board.job.model.vo.HSearch;
import com.kh.coddy.board.job.model.vo.Hattachment;
import com.kh.coddy.board.job.model.vo.Hboard;
import com.kh.coddy.board.job.model.vo.Hrelation;
import com.kh.coddy.board.job.model.vo.Hwishlist;
import com.kh.coddy.common.vo.PageInfo;

@Repository
public class HboardDao {
	public int insertBoard(SqlSessionTemplate sqlSession, Hboard h) { return sqlSession.insert("hboardMapper.insertBoard", h); }
	public int insertTag(SqlSessionTemplate sqlSession, Hrelation hr) { return sqlSession.insert("hboardMapper.insertTag", hr); }
	public int insertThumb(SqlSessionTemplate sqlSession, Hattachment ha) { return sqlSession.insert("hboardMapper.insertThumb", ha); }
	public int selectListCount(SqlSessionTemplate sqlSession, HSearch hs) { return sqlSession.selectOne("hboardMapper.selectListCount", hs); }
	public ArrayList<Hboard> selectList(SqlSessionTemplate sqlSession, PageInfo pi, HSearch hs) { int limit = pi.getBoardLimit(); int offset = (pi.getCurrentPage() - 1) * limit; return (ArrayList)sqlSession.selectList("hboardMapper.selectList", hs, new RowBounds(offset, limit)); }
	public Hattachment getThumbOne(SqlSessionTemplate sqlSession, Hboard h) { return (Hattachment)sqlSession.selectOne("hboardMapper.getThumbOne", h); }
	public ArrayList<Hrelation> getTagInfo(SqlSessionTemplate sqlSession, Hboard h) { return (ArrayList)sqlSession.selectList("hboardMapper.getTagInfo", h); }
	public int getWishList(SqlSessionTemplate sqlSession, Hboard h) { return sqlSession.selectOne("hboardMapper.getWishList", h); }
	public int getWish(SqlSessionTemplate sqlSession, Hwishlist hw) { return sqlSession.selectOne("hboardMapper.getWish", hw); }
	public int deleteWish(SqlSessionTemplate sqlSession, Hwishlist hw) { return sqlSession.delete("hboardMapper.deleteWish", hw); }
	public int insertWish(SqlSessionTemplate sqlSession, Hwishlist hw) { return sqlSession.insert("hboardMapper.insertWish", hw); }
}