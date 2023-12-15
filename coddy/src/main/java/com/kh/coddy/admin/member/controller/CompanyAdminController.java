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

import com.kh.coddy.admin.member.model.service.CompanyAdminService;
import com.kh.coddy.member.model.service.CompanyService;
import com.kh.coddy.member.model.vo.Company;
import com.kh.coddy.member.model.vo.Member;

@Controller
public class CompanyAdminController {
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired private CompanyAdminService companyService;
	@Autowired private CompanyService cs;
	
	@Autowired private PasswordEncoder pbkdf2;
	private SecureRandom sr = new SecureRandom();
	private final String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	
	@Autowired private JavaMailSender mailSender;
	
	@GetMapping(value="adminRegistForm.cp") public String adminRegistFormCompany(HttpSession session) {
		if(session.getAttribute("loginCompany") != null) { session.setAttribute("alertMsg", "관리자만 접근가능합니다."); return "redirect:/"; }
		if(session.getAttribute("loginMember") == null) { session.setAttribute("alertMsg", "로그인 먼저 해주세요."); return "redirect:/"; }
		if(((Member)(session.getAttribute("loginMember"))).getMemberId().equals("admin")) { return "admin/member/adminRegistCompany"; }
		else { session.setAttribute("alertMsg", "관리자만 접근 가능합니다."); return "redirect:/"; }
	}
	@PostMapping(value="adminRegist.cp", produces="text/html; charset=UTF-8") @ResponseBody public String adminRegistCompany(HttpSession session, Company co) {
		co.setCompanyPwd(pbkdf2.encode(co.getCompanyPwd()));
		if(cs.insertCompany(co) > 0) return "기업 가입 성공"; else return "기업 가입 실패";
	}
	@GetMapping(value="adminList.cp") public String adminListViewCompany(HttpSession session) {
		if(session.getAttribute("loginCompany") != null) { session.setAttribute("alertMsg", "관리자만 접근가능합니다."); return "redirect:/"; }
		if(session.getAttribute("loginMember") == null) { session.setAttribute("alertMsg", "로그인 먼저 해주세요."); return "redirect:/"; }
		if(((Member)(session.getAttribute("loginMember"))).getMemberId().equals("admin")) { return "admin/member/adminListViewCompany"; }
		else { session.setAttribute("alertMsg", "관리자만 접근 가능합니다."); return "redirect:/"; }
	}
}