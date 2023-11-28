package com.kh.coddy.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coddy.common.auth.model.vo.Auth;
import com.kh.coddy.member.model.dao.MemberDao;
import com.kh.coddy.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao memberDao;
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	@Override public Member loginMember(Member m) { return memberDao.loginMember(sqlSession, m); }
	@Override public int memberCheck(String checkId) { return memberDao.memberCheck(sqlSession, checkId); }
	@Override public int insertMember(Member m) { return memberDao.insertMember(sqlSession, m); }
	@Override public int authMake(Auth auth) { return memberDao.authMake(sqlSession, auth); }
	@Override public int authCheck(Auth auth) { return memberDao.authCheck(sqlSession, auth); }
	@Override public String findId(Member findMember) { return memberDao.findId(sqlSession, findMember); }


/*
	@Override
	public int updateMember(Member m, String webPath, String folderPath) {
		return memberDao.updateMember(sqlSession, m, webPath, folderPath);
	}
*/
	@Override
	public int deleteMember(String memberId) {
		
		return memberDao.deleteMember(sqlSession, memberId);
	}

	@Override
	public int PwdChangeForm(Member m) {
		return memberDao.PwdChangeForm(sqlSession, m);
	}



	@Override public int findPwd(Member findMember) { return memberDao.findPwd(sqlSession, findMember); }
	@Override public int setNewPassword(Member newMember) { return memberDao.setNewPassword(sqlSession, newMember); }
	@Override public String findEmail(Member findMember) { return memberDao.findEmail(sqlSession, findMember); }

}
