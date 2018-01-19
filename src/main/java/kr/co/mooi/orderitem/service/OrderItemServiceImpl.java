package kr.co.mooi.orderitem.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.mooi.orderitem.dao.OrderItemDao;
import kr.co.mooi.orderitem.domain.OrderItem;

@Service
public class OrderItemServiceImpl implements OrderItemService {

	@Inject
	OrderItemDao orderItemDao;
	
	@Override
	public int insert(OrderItem orderItem) {
		// TODO Auto-generated method stub
		return orderItemDao.insert(orderItem);
	}

	@Override
	public OrderItem select(int orderItemNo) {
		// TODO Auto-generated method stub
		return orderItemDao.select(orderItemNo);
	}

	@Override
	public List<OrderItem> selectByOrdersNo(int ordersNo) {
		// TODO Auto-generated method stub
		return orderItemDao.selectByOrdersNo(ordersNo);
	}
}
