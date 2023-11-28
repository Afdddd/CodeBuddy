package com.kh.coddy.member.model.service;

import java.util.HashMap;

import com.kh.coddy.common.auth.model.vo.Auth;
import com.kh.coddy.member.model.vo.Member;

public interface MemberService {
	
	// 카카오 로그인
	String getAccessToken(String code);
	
	HashMap<String, Object> getUserInfo(String access_Token);
	
	// 로그인
	Member loginMember(Member m);
	
	// id 체크
	int memberCheck(String checkId);

	// 가입하는중
	int insertMember(Member m);

	int authMake(Auth auth);

	int authCheck(Auth auth);

	String findId(Member findMember);
	

	/*
	int updateMember(Member m, String webPath, String folderPath);
*/
	int deleteMember(String memberId);

	int PwdChangeForm(Member m);
}
