package kr.co.mooi.cart.controller;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.mooi.cart.domain.Cart;
import kr.co.mooi.cart.service.CartService;

@Controller
public class CartController {

	@Inject
	CartService cartService;
	
	@RequestMapping(value = "/cart/listForm", method=RequestMethod.GET)
	public String list() {
		return "/cart/list";
	}
	
	@RequestMapping(value = "/cart", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insert(HttpServletRequest request, HttpServletResponse response, Cart cart) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", "FAIL");
		
		if(cartService.insert(request, response, cart) > 0) {
			resultMap.put("result", "SUCCESS");
		}
		
		return resultMap;
	}
	
	@RequestMapping(value = "/cart/{cartNo}", method=RequestMethod.DELETE)
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest request, HttpServletResponse response, @PathVariable int cartNo) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", "FAIL");
		
		if(cartService.delete(request, response, cartNo) > 0) {
			resultMap.put("result", "SUCCESS");
		}
		
		return resultMap;
	}
	
	@RequestMapping(value = "/cart/{cartNo}", method=RequestMethod.PUT)
	@ResponseBody
	public Map<String, Object> update(HttpServletRequest request, @PathVariable int cartNo, Cart cart) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", "FAIL");
		
		cart.setCartNo(cartNo);
		
		if(cartService.update(request, cart) > 0) {
			resultMap.put("result", "SUCCESS");
		}
		
		return resultMap;
	}
	
	@RequestMapping(value = "/cart", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> selectByMemberNo(HttpSession session, HttpServletRequest request) throws JsonParseException, JsonMappingException, IOException {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", "FAIL");

		List<Cart> carts = null;
		
		/* 회원일 경우 */
		if(session.getAttribute("login") != null) {
			int memberNo = (int)session.getAttribute("login");
			
			carts = cartService.selectByMemberNo(memberNo);
			
			resultMap.put("list", carts);
			resultMap.put("result", "SUCCESS");
		}
		
		/* 비회원일 경우 */
		else {
			Cookie cartCookie = WebUtils.getCookie(request, "cartCookie");
			ObjectMapper mapper = new ObjectMapper();
			
			if(cartCookie != null) {
				carts = mapper.readValue(cartCookie.getValue(), new TypeReference<List<Cart>>(){});
				
				if(carts.size() > 0) {
					resultMap.put("list", carts);
					resultMap.put("result", "SUCCESS");
				}
			}
		}

		return resultMap;
	}
}
