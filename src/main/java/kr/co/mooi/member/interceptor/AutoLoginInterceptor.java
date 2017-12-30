package kr.co.mooi.member.interceptor;

import java.sql.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import kr.co.mooi.member.domain.Member;
import kr.co.mooi.member.service.MemberService;

public class AutoLoginInterceptor extends HandlerInterceptorAdapter {

	@Inject
	MemberService memberService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Cookie cookie = WebUtils.getCookie(request, "loginCookie");
		
		if(session.getAttribute("login") == null) {
			if(cookie != null) {
				Member member = memberService.autoLogin(cookie.getValue());
				
				if(member != null) {
					session.setAttribute("login", member.getMemberNo());
					
					member.setSessionKey(session.getId());
					member.setSessionLimit(new Date(System.currentTimeMillis() + (1000 * 60 * 60 * 24 * 7)).toString());
				
					memberService.updateSession(member);
				}
			}
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

	
}
