package com.kh.coddy.board.recruitment.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.coddy.board.job.model.vo.Hwishlist;
import com.kh.coddy.board.recruitment.model.vo.Prelation;
import com.kh.coddy.board.recruitment.model.vo.Project;
import com.kh.coddy.board.recruitment.model.vo.RSearch;
import com.kh.coddy.board.recruitment.model.vo.Rattachment;
import com.kh.coddy.board.recruitment.model.vo.Recruitment;
import com.kh.coddy.board.recruitment.model.vo.RecruitmentState;
import com.kh.coddy.board.recruitment.model.vo.RecruitmentWishList;
import com.kh.coddy.common.chat.model.vo.ChatMember;
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
//	public int selectListCount(SqlSessionTemplate sqlSession, RSearch rs) {
//		return sqlSession.selectOne("recruitmentMapper.selectListCount", rs);
//	}
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("recruitmentMapper.selectListCount");
	}
//	public ArrayList<Recruitment> selectList(SqlSessionTemplate sqlSession, PageInfo pi, RSearch rs){
//		int limit = pi.getBoardLimit();
//		int offset = (pi.getCurrentPage() -1) *limit;			
//		return (ArrayList)sqlSession.selectList("recruitmentMapper.selectList", rs, new RowBounds(offset, limit)); 
//	}
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
	public ArrayList<RecruitmentState> getState(SqlSessionTemplate sqlSession,Recruitment r) {
		return (ArrayList)sqlSession.selectList("recruitmentMapper.getState",r);
	}
	public int getWishList(SqlSessionTemplate sqlSession, Map<String,Integer> wishMap) {
		return sqlSession.selectOne("recruitmentMapper.getWishList",wishMap);
	}
	public int getWish(SqlSessionTemplate sqlSession, RecruitmentWishList rw) { 
		return sqlSession.selectOne("recruitmentMapper.getWish", rw); 
	}
	public int deleteWish(SqlSessionTemplate sqlSession, RecruitmentWishList rw) { 
		return sqlSession.delete("recruitmentMapper.deleteWish", rw); 
	}
	public int insertWish(SqlSessionTemplate sqlSession, RecruitmentWishList rw) { 
		return sqlSession.insert("recruitmentMapper.insertWish", rw); 
	}
	public ArrayList<Recruitment> selectPopular(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("recruitmentMapper.selectPopular");
	}
	public ArrayList<Rattachment> selectRecent(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("recruitmentMapper.selectRecent");
	}
	public Recruitment selectRecruitment(SqlSessionTemplate sqlSession, int rno) {	
		return sqlSession.selectOne("recruitmentMapper.selectRecruitment",rno);
	}
	public ArrayList<Rattachment> getAttachmentList(SqlSessionTemplate sqlSession,Recruitment r) {
		return (ArrayList)sqlSession.selectList("recruitmentMapper.getAttachmentList",r);
	}
	public Project getProject(SqlSessionTemplate sqlSession,Recruitment r) {
		return sqlSession.selectOne("recruitmentMapper.getProject",r);
	}
	
		
}
