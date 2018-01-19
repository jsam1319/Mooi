package kr.co.mooi.orderitem.dao;

import java.util.List;

import kr.co.mooi.orderitem.domain.OrderItem;

public interface OrderItemDao {

	public int insert(OrderItem orderItem);
	
	public OrderItem select(int orderItemNo);
	
	public List<OrderItem> selectByOrdersNo(int ordersNo);
	
}
