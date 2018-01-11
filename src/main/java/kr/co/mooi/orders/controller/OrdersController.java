package kr.co.mooi.orders.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mooi.orders.service.OrdersService;

@Controller
public class OrdersController {
	
	@Inject
	OrdersService ordersService;

	@RequestMapping(value="/orderForm", method=RequestMethod.GET)
	public ModelAndView orderForm() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/order/order");

		return mav;
	}
	
	@RequestMapping(value="/order/ordersCookie", method=RequestMethod.POST)
	@ResponseBody
	public String setOrdersCookie(String ordersData) {
		return ordersData;
	}
}
