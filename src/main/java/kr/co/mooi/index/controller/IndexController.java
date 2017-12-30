package kr.co.mooi.index.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	@RequestMapping("/")
	public String root(HttpSession session) {
		
		return "index";
	}
	
	@RequestMapping("/index")
	public String index(HttpSession session) {
		
		return "index";
	}
}
