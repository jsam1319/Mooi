package kr.co.mooi.visitor.dao;

import java.util.List;

import kr.co.mooi.visitor.domain.VisitorCount;
import kr.co.mooi.visitor.domain.VisitorLog;

public interface VisitorLogDao {

	public int insert(VisitorLog visitorLog);
	
	public List<VisitorCount> selectByRange(String startDate, String endDate);
	
}
