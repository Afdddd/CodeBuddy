package com.kh.coddy.board.recruitment.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coddy.board.job.model.vo.Hboard;
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
//	
//	@Override 
//	public Boolean getWishList(Recruitment r, int mno) { 
////		r.setHboardContent(String.valueOf(mno)); 
//		return rDao.getWishList(sqlSession, r) > 0 ? true : false; 
//	}
	


	
	
	

}
