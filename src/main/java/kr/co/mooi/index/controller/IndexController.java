package kr.co.mooi.index.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mooi.product.service.ProductService;

@Controller
public class IndexController {

	@Inject
	ProductService productService;
	
	@RequestMapping("/")
	public ModelAndView root(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("popular", productService.selectPopular());
		mav.addObject("newArrive", productService.selectNewArrive());
		
		mav.setViewName("index");
		
		return mav;
	}
}
