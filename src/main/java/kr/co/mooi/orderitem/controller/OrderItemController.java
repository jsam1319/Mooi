package kr.co.mooi.orderitem.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.mooi.orderitem.domain.OrderItem;
import kr.co.mooi.orderitem.service.OrderItemService;

@Controller
public class OrderItemController {

	@Inject
	OrderItemService orderItemService;
	
	@RequestMapping(value="/orderitem", method=RequestMethod.POST)
	@ResponseBody
	public String insert(OrderItem orderItem) {
		orderItemService.insert(orderItem);
		
		return "SUCCESS";
	}
	
}
