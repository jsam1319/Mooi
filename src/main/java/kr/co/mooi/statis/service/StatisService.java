package kr.co.mooi.statis.service;

import java.util.List;

import kr.co.mooi.statis.domain.Statis;
import kr.co.mooi.statis.domain.StatisDate;

public interface StatisService {

	public List<Statis> selectByDate(StatisDate statisDate);
}
