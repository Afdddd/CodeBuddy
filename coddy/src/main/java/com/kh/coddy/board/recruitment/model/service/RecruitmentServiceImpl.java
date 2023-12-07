package com.kh.coddy.board.recruitment.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coddy.board.job.model.vo.Hwishlist;
import com.kh.coddy.board.recruitment.model.dao.RecruitmentDao;
import com.kh.coddy.board.recruitment.model.vo.Prelation;
import com.kh.coddy.board.recruitment.model.vo.Project;
import com.kh.coddy.board.recruitment.model.vo.Rattachment;
import com.kh.coddy.board.recruitment.model.vo.Recruitment;
import com.kh.coddy.board.recruitment.model.vo.RecruitmentState;
import com.kh.coddy.board.recruitment.model.vo.RecruitmentWishList;
import com.kh.coddy.common.vo.PageInfo;

@Service
public class RecruitmentServiceImpl implements RecruitmentService{

	@Autowired
	private RecruitmentDao rDao;
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertRecruitment(Recruitment r) {
		return rDao.insertRecruitment(sqlSession, r);
	}
	@Override
	public int insertImg(Rattachment ra) {
		return rDao.insertImg(sqlSession,ra);
	}
	@Override
	public int insertTag(Prelation rel) {
		return rDao.insertTag(sqlSession,rel);
	}
	@Override
	public int insertState(RecruitmentState state) {
		return rDao.insertState(sqlSession,state);
	}
	@Override
	public int createProject(Project p) {
		return rDao.createProject(sqlSession,p);
	}

	@Override 
	public int selectListCount(){ 
		return rDao.selectListCount(sqlSession); 
	}
	@Override
	public ArrayList<Recruitment> selectList(PageInfo pi) {
		return rDao.selectList(sqlSession,pi);
	}
	@Override 
	public Rattachment getThumbOne(Recruitment r) {
		Rattachment ra = rDao.getThumbOne(sqlSession, r);
		return ra != null ? ra : new Rattachment(-1, r.getRecruitmentNo(), "white.jpg", "white.jpg", "resources\\image", null, 1);
	}

	@Override
	public ArrayList<Prelation> getTagInfo(Recruitment r) {
		return rDao.getTagInfo(sqlSession,r);
	}
	
	@Override
	public ArrayList<RecruitmentState> getState(Recruitment r) {
		return rDao.getState(sqlSession, r);
	}
	
	@Override 
	public Boolean getWishList(Map<String,Integer> wishMap) { 
		return rDao.getWishList(sqlSession, wishMap) > 0 ? true : false; 
	}
	@Override
	public int getWish(RecruitmentWishList rw) {
		return rDao.getWish(sqlSession, rw);
	}
	@Override
	public String deleteWish(RecruitmentWishList rw) {
		int result = rDao.deleteWish(sqlSession, rw); return (result > 0) ? "찜목록 제거에 성공함": "찜목록 제거에 실패함";
	}
	@Override
	public String insertWish(RecruitmentWishList rw) {
		int result = rDao.insertWish(sqlSession, rw); return (result > 0) ? "찜목록 추가에 성공함": "찜목록 추가에 실패함"; 
	}
	
	
	


	
	
	

}
