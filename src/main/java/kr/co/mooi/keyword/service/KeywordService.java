package kr.co.mooi.keyword.service;

import java.util.List;

import kr.co.mooi.keyword.domain.Keyword;

public interface KeywordService {
	
	public int insert(Keyword keyword);
	
	public List<Keyword> selectByProductNo(int productNo);
	
	public void deleteByProductNo(int productNo);
}
