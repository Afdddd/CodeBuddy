package com.kh.coddy.admin.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.coddy.member.model.vo.Member;

@Controller
public class MemberAdminController {
	/* 나중에 삭제할것 */
	@GetMapping(value="adminRegistForm.me") public String adminRegistMember(HttpSession session) { 
		if(session.getAttribute("loginCompany") != null) { session.setAttribute("alertMsg", "관리자만 접근가능합니다."); return "redirect:/"; }
		if(session.getAttribute("loginMember") == null) { session.setAttribute("alertMsg", "로그인 먼저 해주세요."); return "redirect:/"; }
		if(((Member)(session.getAttribute("loginMember"))).getMemberId().equals("admin")) { return "admin/member/adminRegistMember"; }
		else { session.setAttribute("alertMsg", "관리자만 접근 가능합니다."); return "redirect:/"; }
	}
	/* 여기까지 삭제할것 */
}