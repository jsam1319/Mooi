package kr.co.mooi.visitor.listener;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import kr.co.mooi.visitor.domain.VisitorLog;
import kr.co.mooi.visitor.service.VisitorLogService;

public class VisitorLogListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent event) {
		HttpSession session = event.getSession(); 

		int memberNo = -1;
		
		if(session.getAttribute("login") != null) {
			memberNo = (int)session.getAttribute("login");
		}
		
		ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext()); 
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		VisitorLogService visitorLogService = (VisitorLogService)context.getBean("visitorLogServiceImpl");

		String addr = request.getHeader("X-FROWARDED-FOR");
		if(addr == null) addr = request.getRemoteAddr();
		
		VisitorLog visitorLog = new VisitorLog();
		visitorLog.setMemberNo(memberNo);
		visitorLog.setIpAddr(addr);

		visitorLogService.insert(visitorLog);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		
	}
	
	
}
