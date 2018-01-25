package kr.co.mooi.visitor.listener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.context.ApplicationContext;
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
		VisitorLogService visitorLogService = (VisitorLogService)context.getBean("visitorLogServiceImpl");
		
		VisitorLog visitorLog = new VisitorLog();
		
		visitorLog.setMemberNo(memberNo);
		System.out.println(visitorLog);
		visitorLogService.insert(visitorLog);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		
	}
	
	
}
