package kr.co.mooi.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping("/member/loginForm")
	public String loginForm() {
		return "member/login";
	}
	
}
