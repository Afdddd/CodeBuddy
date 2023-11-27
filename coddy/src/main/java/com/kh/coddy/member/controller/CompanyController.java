package com.kh.coddy.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.coddy.common.Keys;

@Controller
public class CompanyController {
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
}