package kr.co.mooi.visitor.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.mooi.visitor.dao.VisitorLogDao;
import kr.co.mooi.visitor.domain.VisitorLog;

@Service
public class VisitorLogServiceImpl implements VisitorLogService {
	
	@Inject
	VisitorLogDao visitorLogDao;
	
	@Override
	public int insert(VisitorLog visitorLog) {
		System.out.println("visitorLog : " + visitorLog);
		
		return visitorLogDao.insert(visitorLog);
	}

	
}
