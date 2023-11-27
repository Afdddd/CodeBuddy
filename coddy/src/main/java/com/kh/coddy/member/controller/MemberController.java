package com.kh.coddy.member.controller;


import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.SecureRandom;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
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
	
	private SecureRandom sr = new SecureRandom();
	
	private final String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	
	@Autowired private JavaMailSender mailSender;
	
	@GetMapping(value="/kakaoLogin.me")
	public String KakakoLogin(String code, HttpSession session) {
		String kakaoClientKey = "";
		try { kakaoClientKey = Keys.read(new ClassPathResource("keys/kakaoLogin.json").getURL().getPath(), "key.kakaoLogin"); }
		catch (IOException | ParseException e) { e.printStackTrace(); }
		String access_Token = getAccessToken(code, kakaoClientKey);
		Member kakaoMember = getUserInfo(access_Token, kakaoClientKey);
		Member checkMember = memberService.loginMember(kakaoMember);
		if(checkMember == null) {
			kakaoMember.setMemberPwd(pbkdf2.encode("000000"));
			int result = memberService.insertMember(kakaoMember);
			if(result > 0) { session.setAttribute("alertMsg", kakaoMember.getMemberName() + "님 환영합니다! 최초 비밀번호는 000000입니다. 변경해주세요!"); return "redirect:/"; }
			else { session.setAttribute("errorMsg", "카카오 로그인 실패"); return "common/errorPage"; }
		}
		else {
			session.setAttribute("loginMember", checkMember);
			session.setAttribute("alertMsg", checkMember.getMemberName() + "님 환영합니다!");
			return "redirect:/";
		}
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
			session.invalidate(); } 
		else { session.setAttribute("alertMsg", "로그인된 유저만 가능해요!"); } 
		return "redirect:/";
	}
	
	@RequestMapping(value="authMake.me", produces="text/html; charset=UTF-8") @ResponseBody 
	public String authMake(String email) {
		int r = (int)(Math.random() * 900000 + 100000);
		if((memberService.authMake(new Auth("", String.valueOf(r), email))) > 0) {
			SimpleMailMessage message = new SimpleMailMessage(); message.setTo(email);
			message.setCc("coddy@coddy.com"); message.setSubject("Coddy 사이트 인증번호."); message.setText("인증번호 : " + r); mailSender.send(message);
			return String.valueOf(r); 
		}
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
	public String findId(String memberName, String memberEmail) { if(memberName.equals("운영자")) { return "권한이 없는 상태"; } Member findMember = new Member(); findMember.setMemberEmail(memberEmail); findMember.setMemberName(memberName); return memberService.findId(findMember); }

	@RequestMapping(value="findPwd.me", produces="text/html; charset=UTF-8") @ResponseBody
	public String findPwd(String memberName, String memberEmail) { if(memberName.equals("운영자")) { return "N"; } 
		Member findMember = new Member(); findMember.setMemberEmail(memberEmail); findMember.setMemberName(memberName); int result = memberService.findPwd(findMember);
		if(result > 0) { sr.setSeed(System.currentTimeMillis()); StringBuffer sb = new StringBuffer();
			for(int i=0; i<10; i++) { sb.append(chars.charAt(sr.nextInt(chars.length()))); }
			String to = memberService.findEmail(findMember);
			SimpleMailMessage message = new SimpleMailMessage(); message.setTo(to);
			message.setCc("coddy@coddy.com"); message.setSubject("Coddy 사이트 새 비밀번호 입니다."); message.setText("새 비밀번호는 " + sb.toString() + "입니다."); mailSender.send(message);
			Member newMember = new Member(); newMember.setMemberEmail(memberEmail); newMember.setMemberPwd(pbkdf2.encode(sb.toString()));
			int answer = memberService.setNewPassword(newMember);
			if(answer > 0) { return "Y"; } else { return "N"; } } 
		else { return "N"; } }
	
	// 메소드 기술
	public String getAccessToken(String code, String kkey) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		try {
			URL url = new URL(reqURL);
            
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
            
			sb.append("&client_id=" + kkey); //본인이 발급받은 key
			sb.append("&redirect_uri=http://localhost:8082/coddy/kakaoLogin.me"); // 본인이 설정한 주소
            
			sb.append("&code=" + code);
			bw.write(sb.toString());
			bw.flush();
            
			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			// System.out.println("responseCode : " + responseCode);
            
			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
            
			while ((line = br.readLine()) != null) { result += line; }
			System.out.println("response body : " + result);
            
			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
            
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();           
            
			br.close();
			bw.close();
		} catch (IOException e) { e.printStackTrace(); }
		return access_Token;
	}
	
	public Member getUserInfo(String access_Token, String kkey) {
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		Member kakaoMember = new Member();
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
			int responseCode = conn.getResponseCode();
			// System.out.println("responseCode : " + responseCode);
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) { result += line; }
			System.out.println("response body : " + result);
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			kakaoMember.setMemberName(nickname); kakaoMember.setMemberEmail(email); kakaoMember.setMemberId(element.getAsJsonObject().get("id").getAsString());
		} catch (IOException e) { e.printStackTrace(); }
		return kakaoMember;
	}
}
