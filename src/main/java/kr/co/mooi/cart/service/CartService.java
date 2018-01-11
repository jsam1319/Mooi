package kr.co.mooi.cart.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.mooi.cart.domain.Cart;

public interface CartService {

	public int insert(HttpServletRequest request, HttpServletResponse response, Cart cart) throws Exception;
	
	public int delete(HttpServletRequest request, int cartNo) throws Exception;
	
	public int update(HttpServletRequest request, Cart cart) throws Exception;
	
	public List<Cart> selectByMemberNo(int memberNo);
	
	public List<Cart> selectByNonMember(HttpServletRequest request) throws Exception;
	
}
