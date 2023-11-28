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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@RequestMapping("myPage.me") // 마이페이지 화면 포워딩
	public String myPage() {
		return "member/myPage";
	}
	/*
	@RequestMapping("update.me") // 수정하기
	public String updateMember(Member m , HttpSession session, Model model, HttpServletRequest req) {
		
		
	
		String webPath = "/resources/image/profile/";
		String folderPath = req.getSession().getServletContext().getRealPath(webPath);
		
		int result = memberService.updateMember(m, webPath, folderPath);
		
	if(result > 0) { // 수정 성공
		
		Member updateMem = memberService.loginMember(m);
		
		session.setAttribute("loginUser", updateMem);
		
		// 일회성 알람 문구
		session.setAttribute("alertMsg", "회원정보 변경 성공!");
		
		return "redirect:/myPage.me";
	} else { // 수정 실패
		
		model.addAttribute("errorMsg", "회원 정보 변경 실패");
		
		return "common/errorPage";
	}
	
	
}
	*/
	
	// 비밀번호 페이지만 보여주는거
	@RequestMapping("pwdChange.me")
	public String PwdChange() throws Exception{
		return "member/PwdChange";
	}
	
	// 비밀번호 업데이트
	@RequestMapping(value="pwd.me" , method=RequestMethod.POST)
	public String PwdChangeForm(Member m, HttpSession session) throws Exception {
		
		
		String encPwd = ((Member)session.getAttribute("loginMember")).getMemberPwd();
		
		int result = memberService.PwdChangeForm(m);
		
		if(pbkdf2.matches(m.getMemberPwd(), encPwd)) {
			
		
			
			if(result > 0) {
				
				m.setMemberPwd(pbkdf2.encode(m.getMemberPwd()));
				
				session.setAttribute("alertMsg", "성공적으로 변경되었습니다.");
				
				return "redirect:/pwdChange.me";
				
			} else {
				
				session.setAttribute("alertMsg", "변경을 하지 못했습니다.");
				
				return "redirect:/pwdChange.me";
			}
		
		}
		else {
			
			session.setAttribute("alertMsg", "비밀번호가 일치하지 않습니다.");
			
			return "redirect:/pwdChange.me";
		}
	
	}
	
	@RequestMapping("delete.me")
	public String deleteId() {
		
		return "member/deleteForm";
	}
	
	
	@RequestMapping("deleteForm.me")
	public String DeleteForm(String memberId, String memberPwd, HttpSession session, Model model) {
		String encPwd = ((Member)session.getAttribute("loginMember")).getMemberPwd();
	
		if(pbkdf2.matches(memberPwd, encPwd)) {
			int result = memberService.deleteMember(memberId); 
			
			if(memberId.equals("admin")) {
				result = 0;
			}

			if(result > 0) {

				session.removeAttribute("loginMember");
				session.setAttribute("alertMsg", "그동안 이용해주셔서 감사합니다.");
	
				return "redirect:/";
			} else {
				
				
				model.addAttribute("errorMsg", "회원 탈퇴에 실패했습니다.");
				
				if(memberId.equals("admin")) {
					model.addAttribute("errorMsg", "운영자는 탈퇴 안됨");
				}
				return "common/errorPage";
			}
		} else { 
			
			// 비밀번호가 일치하지 않을 경우
			session.setAttribute("alertMsg", "비밀번호를 잘 못 입력하였습니다.");
		
			return "redirect:/delete.me";
		}
		
		
		
	}
	
	@RequestMapping("written.me")
	public String Written() {
		
		return "member/writtenBoard";
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
