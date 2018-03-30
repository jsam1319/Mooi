package kr.co.mooi.orders.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.mooi.cart.service.CartService;
import kr.co.mooi.member.domain.Member;
import kr.co.mooi.member.service.MemberService;
import kr.co.mooi.orderitem.domain.OrderItem;
import kr.co.mooi.orderitem.service.OrderItemService;
import kr.co.mooi.orders.domain.Orders;
import kr.co.mooi.orders.service.OrdersService;
import kr.co.mooi.orders.util.OrderStatus;
import kr.co.mooi.product.domain.Product;
import kr.co.mooi.product.service.ProductService;

@Controller
public class OrdersController {
	
	@Inject
	OrdersService ordersService;
	
	@Inject
	MemberService memberService;
	
	@Inject
	OrderItemService orderItemService;
	
	@Inject
	ProductService productService;
	
	@Inject
	CartService cartService;
	
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
		
		System.out.println(WebUtils.getCookie(request, "orderCookie").getValue());
		
		return mav;
	}
	
	@RequestMapping(value="/order/nonMemberForm", method=RequestMethod.GET)
	public String nonMemberListForm() {
		return "/member/nonMemberOrderList";
	}
	
	@RequestMapping(value="/order/ordersCookie", method=RequestMethod.POST)
	@ResponseBody
	public String setOrdersCookie(String ordersData, String cartNos, HttpServletResponse response) {
		Cookie orderCookie = new Cookie("orderCookie", ordersData);
		orderCookie.setPath("/");
		orderCookie.setMaxAge(60);
		
		response.addCookie(orderCookie);
		
		if(cartNos != null) {
			Cookie cartRemoveCookie = new Cookie("cartRemoveCookie", cartNos);
			cartRemoveCookie.setPath("/");
		
			response.addCookie(cartRemoveCookie);
		}
		
		return "SUCCESS";
	}
	
	
	@RequestMapping(value="/order", method=RequestMethod.POST)
	public String insert(Orders orders, String ordersCookie, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws NumberFormatException, Exception {
		ObjectMapper mapper = new ObjectMapper();
		System.out.println("orderCookie : " + ordersCookie);
		OrderItem[] orderItems = mapper.readValue(ordersCookie, OrderItem[].class);
		/* 비회원 주문 시 */
		int memberNo = -99;
		
		if(session.getAttribute("login") != null) {
			memberNo = (int)session.getAttribute("login");
		}
		
		orders.setStatus(OrderStatus.OC.name());
		orders.setMemberNo(memberNo);
		ordersService.insert(orders);
		
		for (OrderItem orderItem : orderItems) {
			orderItem.setOrdersNo(orders.getOrdersNo());
			orderItemService.insert(orderItem);
			
			/* 재고 업데이트 */
			Product product = productService.select(orderItem.getProductNo());
			product.setStock(product.getStock() - orderItem.getAmount());
			
			productService.updateStock(product);
		}
		
		/* 장바구니에서 주문 했을 시 주문한 상품 장바구니에서 삭제 */
		Cookie cartRemoveCookie = WebUtils.getCookie(request, "cartRemoveCookie");
		if(cartRemoveCookie != null) {
			String[] cartNos = mapper.readValue(cartRemoveCookie.getValue(), String[].class);
			
			for (String cartNo : cartNos) {
				cartService.delete(request, response, Integer.parseInt(cartNo));
			}
			
			cartRemoveCookie.setMaxAge(1);
			cartRemoveCookie.setPath("/");
			
			response.addCookie(cartRemoveCookie);
		}
		
		return "/order/result";
	}
	
	@RequestMapping(value="/order", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> selectAll() {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		List<Orders> orderList = ordersService.selectAll();
		resultMap.put("list", orderList);

		return resultMap;
	}
	
	@RequestMapping(value="/order/{ordersNo}", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> select(@PathVariable int ordersNo) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		Orders orders = ordersService.select(ordersNo);
		List<OrderItem> items = orderItemService.selectByOrdersNo(ordersNo);
		List<Product> products = new ArrayList<Product>();
		
		for (OrderItem orderItem : items) {
			products.add(productService.select(orderItem.getProductNo()));
		}
		
		resultMap.put("orders", orders);
		resultMap.put("items", items);
		resultMap.put("products", products);
		
		return resultMap;
	}
	
	@RequestMapping(value="/order/{ordersNo}", method=RequestMethod.PUT)
	@ResponseBody
	public Map<String, Object> updateStatus(@PathVariable int ordersNo) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		Orders orders = ordersService.select(ordersNo);
		orders.setStatus(OrderStatus.changeStatus(OrderStatus.valueOf(orders.getStatus())).name());
		ordersService.updateStatus(orders);
		
		resultMap.put("result", "SUCCESS");
		resultMap.put("status", OrderStatus.valueOf(orders.getStatus()).getName());
		
		return resultMap;
	}
	
	@RequestMapping(value="/order/member/{memberNo}", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> selectByMemberNo(@PathVariable int memberNo) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		List<Orders> orderList = ordersService.selectByMemberNo(memberNo);
		resultMap.put("orders", orderList);

		for (Orders orders : orderList) {
			List<OrderItem> items = orderItemService.selectByOrdersNo(orders.getOrdersNo());
			List<Product> products = new ArrayList<Product>();
			
			for (OrderItem orderItem : items) {
				products.add(productService.select(orderItem.getProductNo()));
			}
			
			resultMap.put(String.valueOf(orders.getOrdersNo()),products);				
		}

		return resultMap;
	}
	
	@RequestMapping(value="/order/nonMember", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> selectByNonMember(Member member) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		List<Orders> orderList = ordersService.selectByNonMember(member);

		resultMap.put("orders", orderList);

		for (Orders orders : orderList) {
			List<OrderItem> items = orderItemService.selectByOrdersNo(orders.getOrdersNo());
			List<Product> products = new ArrayList<Product>();
			
			for (OrderItem orderItem : items) {
				products.add(productService.select(orderItem.getProductNo()));
			}
			
			resultMap.put(String.valueOf(orders.getOrdersNo()),products);				
		}

		return resultMap;
	}
}
