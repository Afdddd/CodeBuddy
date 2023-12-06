package com.kh.coddy.board.recruitment.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.coddy.board.job.model.vo.Hboard;
import com.kh.coddy.board.recruitment.model.vo.Prelation;
import com.kh.coddy.board.recruitment.model.vo.Project;
import com.kh.coddy.board.recruitment.model.vo.Rattachment;
import com.kh.coddy.board.recruitment.model.vo.Recruitment;
import com.kh.coddy.board.recruitment.model.vo.RecruitmentState;
import com.kh.coddy.common.vo.PageInfo;

@Repository
public class RecruitmentDao {
	public int insertRecruitment(SqlSessionTemplate sqlSession, Recruitment r) {
		return sqlSession.insert("recruitmentMapper.insertRecruitment",r);
	}
	public int insertImg(SqlSessionTemplate sqlSession, Rattachment ra) {
		return sqlSession.insert("recruitmentMapper.insertImg",ra);
	}
	public int insertTag(SqlSessionTemplate sqlSession, Prelation rel) {
		return sqlSession.insert("recruitmentMapper.insertTag",rel);
	}
	public int insertState(SqlSessionTemplate sqlSession, RecruitmentState state) {
		return sqlSession.insert("recruitmentMapper.insertState",state);
	}
	public int createProject(SqlSessionTemplate sqlSession, Project p) {
		return sqlSession.insert("recruitmentMapper.createProject",p);
	}
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("recruitmentMapper.selectListCount");
	}
	public ArrayList<Recruitment> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() -1) *limit;			
		return (ArrayList)sqlSession.selectList("recruitmentMapper.selectList", null, new RowBounds(offset, limit)); 
	}
	public Rattachment getThumbOne(SqlSessionTemplate sqlSession, Recruitment r) {
		return sqlSession.selectOne("recruitmentMapper.getThumbOne",r);
	}
	public ArrayList<Prelation> getTagInfo(SqlSessionTemplate sqlSession, Recruitment r){
		 return (ArrayList)sqlSession.selectList("recruitmentMapper.getTagInfo", r); 
	}
//	public int getWishList(SqlSessionTemplate sqlSession, Recruitment r) {
//		return sqlSession.selectOne("hboardMapper.getWishList", r); 
//	}
	
	
	
	
	
		
}
