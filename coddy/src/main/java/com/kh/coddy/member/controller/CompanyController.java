package com.kh.coddy.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.coddy.common.Keys;
import com.kh.coddy.common.auth.model.vo.Auth;
import com.kh.coddy.member.model.service.CompanyService;
import com.kh.coddy.member.model.service.MemberService;
import com.kh.coddy.member.model.vo.Company;

@Controller
public class CompanyController {
	private Logger log = LoggerFactory.getLogger(getClass());
	@Autowired private CompanyService companyService;
	@Autowired private MemberService memberService;
	@Autowired private PasswordEncoder pbkdf2;
	// private SecureRandom sr = new SecureRandom();
	// private final String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	@Autowired private JavaMailSender mailSender;
	private final int[] AUTH_KEY = { 1, 3, 7, 1, 3, 7, 1, 3, 5 };
	
	@GetMapping(value="loginPage.co") public String loginPageCompany(HttpSession session) { if(session.getAttribute("loginMember") != null && session.getAttribute("loginCompany") != null) { session.setAttribute("alertMsg", "로그아웃후 이용해주세요."); return "redirect:/"; } else { return "company/login"; } }
	@GetMapping(value="signupPage.co") public String signupPageCompany(HttpSession session) { 
		if((session.getAttribute("loginMember") != null) || (session.getAttribute("loginCompany") != null)) { session.setAttribute("alertMsg", "로그아웃후 이용해주세요."); return "redirect:/"; } 
		else { 
			String gKey = "";
			try { gKey = Keys.read(new ClassPathResource("keys/recaptcha2.json").getURL().getPath(), "key"); }
			catch (IOException | ParseException e) { e.printStackTrace(); }
			session.setAttribute("gKey", gKey);
			return "company/signup"; 
		} 
	}
	@RequestMapping(value="companyCheck.co", produces="text/html; charset=UTF-8") @ResponseBody public String companyCheck(String id) { int count = companyService.companyCheck(id); if(count > 0) { return "NNNNN"; } else { return "NNNNY"; } }
	@PostMapping(value="companyBnoCheck.co", produces="text/html; charset=UTF-8") @ResponseBody public String companyBnoCheck(String companyBno) {
		int numberAuth = 0;
		/*
		try { Integer.valueOf(companyBno); }
		catch(Exception e) { e.printStackTrace(); return "not a number"; }
		*/
		for(int i=0; i<9; i++) { numberAuth += AUTH_KEY[i] * Integer.valueOf(companyBno.charAt(i) - '0'); }
		numberAuth += (int)((Integer.valueOf(companyBno.charAt(8) - '0') * AUTH_KEY[8]) / 10);
		if(10 - (numberAuth % 10) != Integer.valueOf(companyBno.charAt(9) - '0')) { return "not a valid"; }
		else { return "success"; }
	}
	@PostMapping(value="companyEmailCheck.co", produces="text/html; charset=UTF-8") @ResponseBody public String companyEmailCheck(String companyEmail) {
		int r = (int)(Math.random() * 90000000 + 10000000);
		int isSuccess = memberService.authMake(new Auth("", String.valueOf(r), companyEmail));
		if(isSuccess > 0) { 
			SimpleMailMessage message = new SimpleMailMessage(); message.setTo(companyEmail);
			message.setCc("coddy@coddy.com"); message.setSubject("Coddy 사이트 인증번호."); message.setText("인증번호 : " + r); mailSender.send(message);
			return String.valueOf(r); 
		}
		else { return "failed"; }
	}
	@PostMapping(value="signup.co") public String signup(Company c, HttpSession session, Model model) {
		if((session.getAttribute("loginMember") != null) || (session.getAttribute("loginCompany") != null)) { session.setAttribute("alertMsg", "로그아웃후 이용해주세요."); return "redirect:/"; } 
		else { c.setCompanyPwd(pbkdf2.encode(c.getCompanyPwd()));
			int result = companyService.insertCompany(c); 
			if(result > 0) { log.info("insertCompanyId={}", c.getCompanyId()); session.setAttribute("alertMsg", "성공적으로 회원가입이 완료되었습니다. 로그인을 진행해주세요."); return "redirect:/loginPage.co"; } 
			else { model.addAttribute("errorMsg", "회원가입 실패"); return "common/errorPage"; } } }
	@PostMapping(value="login.co") public String login(Company c, HttpSession session, Model model, HttpServletRequest request) {
		if((session.getAttribute("loginMember") != null) || (session.getAttribute("loginCompany") != null)) { session.setAttribute("alertMsg", "로그아웃후 이용해주세요."); return "redirect:/"; } 
		else {
			Company loginCompany = companyService.login(c);
			if((loginCompany==null) || !(pbkdf2.matches(c.getCompanyPwd(), loginCompany.getCompanyPwd()))) { model.addAttribute("errorMsg","로그인 실패!"); return "common/errorPage"; }
			else {
				session.setAttribute("loginCompany", loginCompany);
				session.setAttribute("alertMsg", "기업 로그인 성공");
				log.info("loginCompany={}, ip={}",loginCompany, request.getRemoteAddr());
				return "redirect:/";
			}
		}
	}
	@GetMapping(value="logout.co") public String logout(HttpSession session) { 
		if(session.getAttribute("loginMember") != null) { session.setAttribute("alertMsg", "이미 로그인된 회원이 있습니다."); }
		else if(session.getAttribute("loginCompany") != null) { session.removeAttribute("loginCompany"); session.setAttribute("alertMsg", "로그아웃됨"); }
		else { session.setAttribute("alertMsg", "잘못된 요청입니다."); }
		return "redirect:/";
	}
}