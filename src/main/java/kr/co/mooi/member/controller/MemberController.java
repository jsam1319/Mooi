package kr.co.mooi.member.controller;

import java.security.Key;
import java.sql.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import kr.co.mooi.member.domain.Member;
import kr.co.mooi.member.service.MemberService;
import kr.co.mooi.member.util.RSAKeySet;

@Controller
public class MemberController {
	
	@Inject
	MemberService memberService;

	@RequestMapping("/member/loginForm")
	public String loginForm(Model model, HttpSession session) throws Exception {
		RSAKeySet keySet = new RSAKeySet();
		
		/* 세션에 개인키 저장 */
		session.setAttribute("RSA_private", keySet.getPrivateKey());
		
		/* Front Side로 공개키 전달 */
		model.addAttribute("Modulus", keySet.getPublicKeyModulus());
		model.addAttribute("Exponent", keySet.getPublicKeyExponent());
		
		return "member/login";
	}
	
	@RequestMapping("/member/registForm")
	public String registForm(Model model, HttpSession session) throws Exception {
		RSAKeySet keySet = new RSAKeySet();
		
		/* 세션에 개인키 저장 */
		session.setAttribute("RSA_private", keySet.getPrivateKey());
		
		/* Front Side로 공개키 전달 */
		model.addAttribute("Modulus", keySet.getPublicKeyModulus());
		model.addAttribute("Exponent", keySet.getPublicKeyExponent());
		
		return "member/regist";
	}
	
	@RequestMapping(value="/member/regist", method=RequestMethod.POST)
	public String regist(Member member, HttpSession session) throws Exception {
		String resultPage = "error";
		
		if(session.getAttribute("RSA_private") != null) {
			if(memberService.regist(member, (Key)session.getAttribute("RSA_private")) > 0)
				resultPage = "/member/result";
		}

		session.removeAttribute("RSA_private");
		return "redirect:" + resultPage;
	}
	
	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public String login(Member member, HttpSession session, String isAutoLogin, HttpServletResponse response) throws Exception {
		String resultPage = "/error";
		
		if(session.getAttribute("RSA_private") != null) {
			member = memberService.login(member, (Key)session.getAttribute("RSA_private"));
			
			if(member != null)
				/* Session에 Login 정보 추가 */
				session.setAttribute("login", member.getMemberNo());
			
				if(isAutoLogin != null) {
					int amount = 60 * 60 * 24 * 7;
					
					Cookie cookie = new Cookie("loginCookie", session.getId());
					cookie.setPath("/");
					cookie.setMaxAge(amount);
					response.addCookie(cookie);
					
					Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));
					
					member.setSessionKey(session.getId());
					member.setSessionLimit(sessionLimit.toString());
					
					System.out.println(member);
					
					System.out.println(memberService.updateSession(member));
				}
				
				resultPage = "/";
		}
		
		session.removeAttribute("RSA_private");
		return "redirect:" + resultPage;
	}
	
	@RequestMapping(value="/member/logout", method=RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request) {
		Member member = new Member();
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		
		member.setMemberNo((int)session.getAttribute("login"));
		member.setSessionKey("null");
		member.setSessionLimit(new Date(System.currentTimeMillis()).toString());
		
		memberService.updateSession(member);
		
		session.removeAttribute("login");
		loginCookie.setMaxAge(0);
		
		return "redirect:/index";
	}
	
}
