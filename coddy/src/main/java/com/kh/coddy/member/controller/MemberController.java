package com.kh.coddy.member.controller;


import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.coddy.member.model.service.MemberService;
import com.kh.coddy.member.model.vo.Member;

@Controller
public class MemberController {
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping(value="/kakaoLogin.me")
	public String KakakoLogin(String code, HttpSession session) {
		String access_Token = memberService.getAccessToken(code);
		HashMap<String, Object> userInfo = memberService.getUserInfo(access_Token);	
		session.setAttribute("nickname",userInfo.get("nickname"));
		return "redirect:/";	
	}	
	
	@GetMapping("kakaoLogout.me")
	public String kakaoLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";				
	}
	
	@PostMapping("/login.me")
	public String loginMember(@ModelAttribute Member m, Model model, HttpSession session) {
		
		Member loginMember = memberService.loginMember(m);
		
		if(loginMember==null) {
			
			model.addAttribute("errorMsg","로그인 실페!");
			return "common/errorPage";
		}else {
			session.setAttribute("loginMember", loginMember);
			log.info("loginMember={}",loginMember);
			return "redirect:/";	
		}
	
			
	}
	
	

}
