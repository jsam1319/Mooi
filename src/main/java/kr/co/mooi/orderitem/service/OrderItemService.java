package kr.co.mooi.orderitem.service;

import java.util.List;

import kr.co.mooi.orderitem.domain.OrderItem;

public interface OrderItemService {

	public int insert(OrderItem orderItem);
	
	public OrderItem select(int orderItemNo);
	
	public List<OrderItem> selectByOrdersNo(int ordersNo);
}
