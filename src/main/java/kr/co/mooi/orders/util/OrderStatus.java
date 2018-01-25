package kr.co.mooi.orders.util;

public enum OrderStatus {
	OC("주문완료", 0),
	PC("결제완료", 1),
	DR("배송준비중", 2),
	DC("발송완료", 3),
	RE("반품", 4),
	ER("취소", 5),
	NF("찾지못함", 100);
	
	String statusName;
	int orderSeq;
	
	OrderStatus(String statusName, int orderSeq) {
		this.statusName = statusName;
		this.orderSeq = orderSeq;
	}
	
	public static OrderStatus changeStatus(OrderStatus orderStatus) {
		if(orderStatus.orderSeq < 4) return OrderStatus.getStatusBySeq(orderStatus.orderSeq+1);
		else						 return OrderStatus.NF;
	}
	
	public static OrderStatus getStatusBySeq(int orderSeq) {
		OrderStatus[] values = OrderStatus.values();
		
		for (OrderStatus orderStatus : values) {
			if(orderStatus.orderSeq == orderSeq) return orderStatus;
		}
		
		return OrderStatus.NF;
	}
}
