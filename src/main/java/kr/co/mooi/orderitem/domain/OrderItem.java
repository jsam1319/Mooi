package kr.co.mooi.orderitem.domain;

public class OrderItem {

	int orderItemNo;
	int ordersNo;
	int productNo;
	int amount;
	
	
	public OrderItem() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public OrderItem(int orderItemNo, int ordersNo, int productNo, int amount) {
		super();
		this.orderItemNo = orderItemNo;
		this.ordersNo = ordersNo;
		this.productNo = productNo;
		this.amount = amount;
	}

	public int getOrderItemNo() {
		return orderItemNo;
	}
	public void setOrderItemNo(int orderItemNo) {
		this.orderItemNo = orderItemNo;
	}
	public int getOrdersNo() {
		return ordersNo;
	}
	public void setOrdersNo(int ordersNo) {
		this.ordersNo = ordersNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "OrderItem [orderItemNo=" + orderItemNo + ", ordersNo=" + ordersNo + ", productNo=" + productNo
				+ ", amount=" + amount + "]";
	}

	
	
}
