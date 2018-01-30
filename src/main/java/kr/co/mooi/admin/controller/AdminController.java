package kr.co.mooi.admin.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mooi.product.service.ProductService;

@Controller
public class AdminController {

	@Inject
	ProductService productService;
	
	@RequestMapping("/admin")
	public String adminIndex() {
		return "/admin/index";
	}
	
	@RequestMapping("/admin/product/listForm")
	public String productListForm() {
		return "/admin/productList";
	}
	
	@RequestMapping("/admin/product/salesForm")
	public String salesForm() {
		return "/admin/sales";
	}

	@RequestMapping("/admin/product/stockForm")
	public String stockForm() {
		return "/admin/stock";
	}
	
	@RequestMapping("/admin/order/listForm")
	public String orderListForm() {
		return "/admin/orderList";
	}
	
	@RequestMapping("/admin/product/featureForm")
	public ModelAndView featureForm() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("feature", productService.selectFeature());
		mav.setViewName("/admin/feature");
		
		return mav;
	}
	
}
