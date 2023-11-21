package com.kh.coddy.member.model.service;

import java.util.HashMap;

import com.kh.coddy.member.model.vo.Member;

public interface MemberService {
	
	// 카카오 로그인
	String getAccessToken(String code);
	
	HashMap<String, Object> getUserInfo(String access_Token);
	
	// 로그인
	Member loginMember(Member m);	
}
