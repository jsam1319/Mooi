package kr.co.mooi.orders.controller;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import kr.co.mooi.member.service.MemberService;
import kr.co.mooi.orders.service.OrdersService;

@Controller
public class OrdersController {
	
	@Inject
	OrdersService ordersService;
	
	@Inject
	MemberService memberService;

	@RequestMapping(value="/orderForm", method=RequestMethod.GET)
	public ModelAndView orderForm(HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		if(session.getAttribute("login") != null) {
			mav.addObject("member", memberService.select((int)session.getAttribute("login")));
		}
		
		mav.setViewName("/order/order");
		
		if(WebUtils.getCookie(request, "orderCookie") == null) {
			mav.setViewName("/error/404");
		}
		
		return mav;
	}
	
	@RequestMapping(value="/order/ordersCookie", method=RequestMethod.POST)
	@ResponseBody
	public String setOrdersCookie(String ordersData, HttpServletResponse response) {
		Cookie orderCookie = new Cookie("orderCookie", ordersData);
		orderCookie.setPath("/");
		orderCookie.setMaxAge(20);
		
		response.addCookie(orderCookie);
		
		return "SUCCESS";
	}
}
