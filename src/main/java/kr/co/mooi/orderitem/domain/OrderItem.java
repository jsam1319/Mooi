package kr.co.mooi.orderitem.domain;

public class OrderItem {

	int orderItemNo;
	int orderNo;
	int productNo;
	int amount;
	
	public OrderItem() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public OrderItem(int orderItemNo, int orderNo, int productNo, int amount) {
		super();
		this.orderItemNo = orderItemNo;
		this.orderNo = orderNo;
		this.productNo = productNo;
		this.amount = amount;
	}

	public int getOrderItemNo() {
		return orderItemNo;
	}
	public void setOrderItemNo(int orderItemNo) {
		this.orderItemNo = orderItemNo;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
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
		return "OrderItem [orderItemNo=" + orderItemNo + ", orderNo=" + orderNo + ", productNo=" + productNo
				+ ", amount=" + amount + "]";
	}
}
