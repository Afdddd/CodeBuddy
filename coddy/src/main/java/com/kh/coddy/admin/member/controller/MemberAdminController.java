package com.kh.coddy.admin.member.controller;

import java.security.SecureRandom;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.coddy.admin.member.model.service.MemberAdminService;
import com.kh.coddy.member.model.service.MemberService;
import com.kh.coddy.member.model.vo.Member;

@Controller
public class MemberAdminController {
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired private MemberAdminService memberService;
	@Autowired private MemberService ms;
	
	@Autowired private PasswordEncoder pbkdf2;
	private SecureRandom sr = new SecureRandom();
	private final String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	
	@Autowired private JavaMailSender mailSender;
	
	/* 나중에 삭제할것 */
	@GetMapping(value="adminRegistForm.me") public String adminRegistMember(HttpSession session) { 
		if(session.getAttribute("loginCompany") != null) { session.setAttribute("alertMsg", "관리자만 접근가능합니다."); return "redirect:/"; }
		if(session.getAttribute("loginMember") == null) { session.setAttribute("alertMsg", "로그인 먼저 해주세요."); return "redirect:/"; }
		if(((Member)(session.getAttribute("loginMember"))).getMemberId().equals("admin")) { return "admin/member/adminRegistMember"; }
		else { session.setAttribute("alertMsg", "관리자만 접근 가능합니다."); return "redirect:/"; }
	}
	@PostMapping(value="insertForce.me", produces="text/html; charset=UTF-8") @ResponseBody public String insertMemberForce(Member m) {
		m.setMemberPwd(pbkdf2.encode(m.getMemberPwd()));
		int result = ms.insertMember(m);
		if(result > 0) { return "성공"; } else { return "실패"; }
	}
	/* 여기까지 삭제할것 */
}