package com.kh.coddy.member.model.service;

import java.util.HashMap;

import com.kh.coddy.common.auth.model.vo.Auth;
import com.kh.coddy.member.model.vo.Member;

public interface MemberService {
	
	// 카카오 로그인
	
	// 로그인
	Member loginMember(Member m);
	
	// id 체크
	int memberCheck(String checkId);

	// 가입하는중
	int insertMember(Member m);

	int authMake(Auth auth);

	int authCheck(Auth auth);

	String findId(Member findMember);

	int findPwd(Member findMember);

	int setNewPassword(Member newMember);
}
