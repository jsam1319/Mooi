package kr.co.mooi.error.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {

	@RequestMapping("/error/404page")
	public String error404(HttpServletResponse response, HttpServletRequest request) {
		response.setStatus(HttpServletResponse.SC_OK);
		
		return "redirect:/error/404";
	}
	
	@RequestMapping("/error/404")
	public String redirect404() {
		return "/error/404";
	}
	
	@RequestMapping("/error/500page")
	public String error500(HttpServletResponse response, HttpServletRequest request) {
		response.setStatus(HttpServletResponse.SC_OK);
		
		return "redirect:/error/500";
	}
	
	@RequestMapping("/error/500")
	public String redirect500() {
		return "/error/500";
	}
	
	@RequestMapping("/error/accessPage")
	public String errorAccess() {
		
		return "redirect:/error/access";
	}
	
	@RequestMapping("/error/access")
	public String redirectErrorAccess() {
		
		return "/error/access";
	}
}
