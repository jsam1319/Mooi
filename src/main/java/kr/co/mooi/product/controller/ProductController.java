package kr.co.mooi.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {

	@RequestMapping("/product/insertForm")
	public String insertForm() {
		return "product/insert";
	}
	
	@RequestMapping("/product/listForm")
	public String listForm() {
		return "product/list";
	}
}
