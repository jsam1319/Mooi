package kr.co.mooi.orders.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.mooi.member.service.MemberService;
import kr.co.mooi.orderitem.domain.OrderItem;
import kr.co.mooi.orderitem.service.OrderItemService;
import kr.co.mooi.orders.domain.Orders;
import kr.co.mooi.orders.service.OrdersService;
import kr.co.mooi.orders.util.OrderStatus;

@Controller
public class OrdersController {
	
	@Inject
	OrdersService ordersService;
	
	@Inject
	MemberService memberService;
	
	@Inject
	OrderItemService orderItemService;

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
	
	
	@RequestMapping(value="/order", method=RequestMethod.POST)
	public String insert(Orders orders, String ordersCookie, HttpSession session) throws JsonParseException, JsonMappingException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		OrderItem[] orderItems = mapper.readValue(ordersCookie, OrderItem[].class);

		orders.setStatus(OrderStatus.OC.name());
		orders.setMemberNo((int)session.getAttribute("login"));
		ordersService.insert(orders);
		
		for (OrderItem orderItem : orderItems) {
			orderItem.setOrdersNo(orders.getOrdersNo());
			orderItemService.insert(orderItem);
		}
		
		return "/order/result";
	}
	
	@RequestMapping(value="/order", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> selectAll() throws JsonParseException, JsonMappingException, IOException {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		List<Orders> orderList = ordersService.selectAll();
		resultMap.put("list", orderList);

		return resultMap;
	}
}
