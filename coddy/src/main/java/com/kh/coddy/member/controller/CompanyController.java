package com.kh.coddy.member.controller;

import java.io.IOException;
import java.security.SecureRandom;

import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.coddy.common.Keys;
import com.kh.coddy.member.model.service.CompanyService;

@Controller
public class CompanyController {
	private Logger log = LoggerFactory.getLogger(getClass());
	@Autowired private CompanyService companyService;
	@Autowired private PasswordEncoder pbkdf2;
	private SecureRandom sr = new SecureRandom();
	private final String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	@Autowired private JavaMailSender mailSender;
	
	@GetMapping(value="loginPage.co") public String loginPageCompany(HttpSession session) { if(session.getAttribute("loginMember") != null) { session.setAttribute("alertMsg", "로그아웃후 이용해주세요."); return "redirect:/"; } else { return "company/login"; } }
	@GetMapping(value="signupPage.co") public String signupPageCompany(HttpSession session) { 
		if(session.getAttribute("loginMember") != null) { session.setAttribute("alertMsg", "로그아웃후 이용해주세요."); return "redirect:/"; } 
		else { 
			String gKey = "";
			try { gKey = Keys.read(new ClassPathResource("keys/recaptcha2.json").getURL().getPath(), "key"); }
			catch (IOException | ParseException e) { e.printStackTrace(); }
			session.setAttribute("gKey", gKey);
			return "company/signup"; 
		} 
	}
	@RequestMapping(value="companyCheck.co", produces="text/html; charset=UTF-8") @ResponseBody public String companyCheck(String id) { int count = companyService.companyCheck(id); if(count > 0) { return "NNNNN"; } else { return "NNNNY"; } }
}