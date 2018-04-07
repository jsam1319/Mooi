package kr.co.mooi.keyword.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import kr.co.mooi.keyword.dao.KeywordDao;
import kr.co.mooi.keyword.domain.Keyword;
import kr.co.mooi.keyword.util.HangulSeperator;

@Service
public class KeywordServiceImpl implements KeywordService {

	Logger logger = Logger.getLogger(this.getClass());
	
	@Inject
	KeywordDao keywordDao;
	
	@Override
	public int insert(Keyword keyword) {
		// TODO Auto-generated method stub
		logger.info(keyword);
		
		keyword.setName(HangulSeperator.seperate(keyword.getName()));
		
		return keywordDao.insert(keyword);
	}

	@Override
	public List<Keyword> selectByProductNo(int productNo) {
		// TODO Auto-generated method stub
		List<Keyword> keywords = keywordDao.selectByProductNo(productNo);
		
		for (Keyword keyword : keywords) {
			keyword.setName(HangulSeperator.conHangul(keyword.getName()));
		}
				
		return keywords;
	}
	
	@Override
	public void deleteByProductNo(int productNo) {
		// TODO Auto-generated method stub
		keywordDao.deleteByProductNo(productNo);
	}
}
