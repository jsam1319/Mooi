package kr.co.mooi.keyword.dao;

import java.util.List;

import kr.co.mooi.keyword.domain.Keyword;

public interface KeywordDao {

	public int insert(Keyword keyword);
	
	public List<Keyword> selectByProductNo(int productNo);
	
	public void deleteByProductNo(int productNo);
}
