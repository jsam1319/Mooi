package kr.co.mooi.statis.dao;

import java.util.List;

import kr.co.mooi.statis.domain.Statis;
import kr.co.mooi.statis.domain.StatisDate;

public interface StatisDao {

	public List<Statis> selectByDate(StatisDate statisDate);
	
}
