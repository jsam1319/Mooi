package kr.co.mooi.statis.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.mooi.statis.domain.Statis;
import kr.co.mooi.statis.domain.StatisDate;
import kr.co.mooi.statis.service.StatisService;

@Controller
public class StatisController {

	@Inject
	StatisService statisService;
	
	@RequestMapping(value="/statis", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> calStatis(StatisDate statisDate) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		List<Statis> statises = statisService.selectByDate(statisDate);
		resultMap.put("list", statises);
		
		return resultMap;
	}
}
