package kr.co.mooi.cart.dao;

import java.util.List;

import kr.co.mooi.cart.domain.Cart;

public interface CartDao {

	public int insert(Cart cart);
	
	public int delete(int cartNo);
	
	public int update(Cart cart);
	
	public List<Cart> selectByMemberNo(int memberNo);
}
