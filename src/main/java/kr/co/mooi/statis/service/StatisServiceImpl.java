package kr.co.mooi.statis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.mooi.statis.dao.StatisDao;
import kr.co.mooi.statis.domain.Statis;
import kr.co.mooi.statis.domain.StatisDate;

@Service
public class StatisServiceImpl implements StatisService {

	@Inject
	StatisDao statisDao;
	
	@Override
	public List<Statis> selectByDate(StatisDate statisDate) {
		// TODO Auto-generated method stub
		return statisDao.selectByDate(statisDate);
	}

	
}
