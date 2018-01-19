package kr.co.mooi.orders.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.mooi.orders.dao.OrdersDao;
import kr.co.mooi.orders.domain.Orders;

@Service
public class OrdersServiceImpl implements OrdersService {

	@Inject
	OrdersDao ordersDao;
	
	@Override
	public int insert(Orders orders) {
		// TODO Auto-generated method stub
		return ordersDao.insert(orders);
	}

	@Override
	public Orders select(int ordersNo) {
		return ordersDao.select(ordersNo);
	}
	
	@Override
	public List<Orders> selectByMemberNo(int memberNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Orders> selectAll() {
		// TODO Auto-generated method stub
		return ordersDao.selectAll();
	}

	@Override
	public List<Orders> selectByDate(String start, String end) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
