package com.kh.coddy.member.controller;


import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.coddy.common.Keys;
import com.kh.coddy.common.auth.model.vo.Auth;
import com.kh.coddy.member.model.service.MemberService;
import com.kh.coddy.member.model.vo.Member;

@Controller
public class MemberController {
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private MemberService memberService;
	
	@Autowired private PasswordEncoder pbkdf2;
	
	@GetMapping(value="/kakaoLogin.me")
	public String KakakoLogin(String code, HttpSession session) {
		String access_Token = memberService.getAccessToken(code);
		HashMap<String, Object> userInfo = memberService.getUserInfo(access_Token);	
		session.setAttribute("nickname",userInfo.get("nickname"));
		return "redirect:/";	
	}	
	
	@GetMapping(value="kakaoLogout.me")
	public String kakaoLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";				
	}
	
	@RequestMapping("myPage.me")
	public String myPage() {
		return "member/myPage";
	}
	
	@GetMapping(value="signup.me") public String signup(HttpSession session) {
		if(session.getAttribute("loginMember") != null) { session.setAttribute("alertMsg", "로그아웃 후 이용해주세요."); return "redirect:/"; }
		try { session.setAttribute("googleKey", Keys.read(new ClassPathResource("keys/recaptcha2.json").getURL().getPath(), "key")); } 
		catch (IOException | ParseException e) { e.printStackTrace(); } 
		return "member/signupPage"; }

	@PostMapping(value="insert.me") public String insertMember(Member m, Model model, HttpSession session) { 
		m.setMemberPwd(pbkdf2.encode(m.getMemberPwd()));
		int result = memberService.insertMember(m); 
		if(result > 0) { log.info("insertMemberId={}", m.getMemberId()); session.setAttribute("alertMsg", "성공적으로 회원가입이 완료되었습니다. 로그인을 진행해주세요."); return "redirect:/"; } 
		else { model.addAttribute("errorMsg", "회원가입 실패"); return "common/errorPage"; } }

	@RequestMapping(value="memberCheck.me", produces="text/html; charset=UTF-8") @ResponseBody public String memberCheck(String checkIds) { int count = memberService.memberCheck(checkIds); if(count > 0) { return "NNNNN"; } else { return "NNNNY"; } }
	
	@PostMapping(value="/login.me")
	public String loginMember(@ModelAttribute Member m, Model model, HttpSession session, HttpServletRequest request) {
		Member loginMember = memberService.loginMember(m);
		
		if((loginMember==null) || !(pbkdf2.matches(m.getMemberPwd(), loginMember.getMemberPwd()))) { model.addAttribute("errorMsg","로그인 실패!"); return "common/errorPage"; }
		else {
			session.setAttribute("loginMember", loginMember);
			session.setAttribute("alertMsg", loginMember.getMemberName() + "님! 로그인에 성공하셨습니다.");
			log.info("loginMember={}, ip={}",loginMember, request.getRemoteAddr());
			return "redirect:/";	
		}
	}
	
	@RequestMapping(value="logout.me") public String logoutMember(HttpSession session, HttpServletRequest request) { 
		if(session.getAttribute("loginMember") != null) { 
			log.info("logoutMember={}, ip={}",session.getAttribute("loginMember"), request.getRemoteAddr()); 
			session.invalidate(); } else { session.setAttribute("alertMsg", "로그인된 유저만 가능해요!"); 
		} 
		return "redirect:/";
	}
	
	@RequestMapping(value="authMake.me", produces="text/html; charset=UTF-8") @ResponseBody 
	public String authMake(String email) {
		int r = (int)(Math.random() * 900000 + 100000);
		if(memberService.authMake(new Auth("", String.valueOf(r), email)) > 0) { return String.valueOf(r); }
		else { return authMake(email); }
	}
	
	@RequestMapping(value="authCheck.me", produces="text/html; charset=UTF-8") @ResponseBody
	public String authCheck(String email, String number) {
		if(email != null && number != null) {
			if(memberService.authCheck(new Auth("", number, email)) > 0) { return "Y"; }
			else { return "N"; }
		}
		else { return "N"; }
	}
	
	@GetMapping(value="findIdForm.me") public String findIdForm(HttpSession session) { 
		if(session.getAttribute("loginMember") != null) { session.setAttribute("alertMsg", "이미 로그인 되어있습니다."); return "redirect:/"; }
		else { return "member/findIdForm"; }
	}
	
	@RequestMapping(value="findId.me", produces="text/html; charset=UTF-8") @ResponseBody
	public String findId(String memberName, String memberEmail) { Member findMember = new Member(); findMember.setMemberEmail(memberEmail); findMember.setMemberName(memberName); return memberService.findId(findMember); }
}
