package kr.co.mooi.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

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
	
	@RequestMapping("/admin/order/listForm")
	public String orderListForm() {
		return "/admin/orderList";
	}
}
