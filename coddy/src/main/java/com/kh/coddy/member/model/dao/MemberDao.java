package com.kh.coddy.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.coddy.common.auth.model.vo.Auth;
import com.kh.coddy.member.model.vo.Member;

@Repository
public class MemberDao {
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) { return sqlSession.selectOne("memberMapper.loginMember", m); }
	public int memberCheck(SqlSessionTemplate sqlSession, String checkId) { return sqlSession.selectOne("memberMapper.memberCheck", checkId); }
	public int insertMember(SqlSessionTemplate sqlSession, Member m) { return sqlSession.insert("memberMapper.insertMember", m); }
	public int authMake(SqlSessionTemplate sqlSession, Auth auth) { return sqlSession.insert("authMapper.authMake", auth); }
	public int authCheck(SqlSessionTemplate sqlSession, Auth auth) { return sqlSession.selectOne("authMapper.authCheck", auth); }
	public String findId(SqlSessionTemplate sqlSession, Member findMember) { return sqlSession.selectOne("memberMapper.findId", findMember); }

	
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {	
		return sqlSession.update("memberMapper.updateMember", m);
	}
	public int deleteMember(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.update("memberMapper.deleteMember", memberId);
	}
	
	public int PwdChangeForm(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.PwdChangeForm", m);	
	}
	

	public int findPwd(SqlSessionTemplate sqlSession, Member findMember) { return sqlSession.selectOne("memberMapper.findPwd", findMember); }
	public int setNewPassword(SqlSessionTemplate sqlSession, Member newMember) { return sqlSession.update("memberMapper.setNewPassword", newMember); }
	public String findEmail(SqlSessionTemplate sqlSession, Member findMember) { return sqlSession.selectOne("memberMapper.findEmail", findMember); }
	public static int uploadFile(SqlSessionTemplate sqlSession, int memberNo) {
		
		return sqlSession.update("memberMapper.uploadFile", memberNo);
	}
	

}