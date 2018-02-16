package kr.co.mooi.orders.dao;

import java.util.List;

import kr.co.mooi.orders.domain.Orders;

public interface OrdersDao {

	public int insert(Orders orders);
	
	public Orders select(int ordersNo);
	
	public List<Orders> selectByMemberNo(int memberNo);
	
	public List<Orders> selectAll();
	
	public List<Orders> selectByDate(String start, String end);
	
	public int updateStatus(Orders orders);
}
