package kr.co.mooi.cart.domain;

public class Cart {

	int cartNo;
	int memberNo;
	int productNo;
	int amount;
	
	
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Cart(int cartNo, int memberNo, int productNo, int amount) {
		super();
		this.cartNo = cartNo;
		this.memberNo = memberNo;
		this.productNo = productNo;
		this.amount = amount;
	}

	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
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
		return "Cart [cartNo=" + cartNo + ", memberNo=" + memberNo + ", productNo=" + productNo + ", amount=" + amount
				+ "]";
	}
	
	
}
