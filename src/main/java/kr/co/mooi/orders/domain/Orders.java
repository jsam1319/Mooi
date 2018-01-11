package kr.co.mooi.orders.domain;

public class Orders {

	int orderNo;
	int memberNo;
	String price;
	String name;
	String phone;
	String address;
	String remainAddr;
	String postcode;
	String content;
	String regdate;
	String cof;
	String ordererName;
	String ordererPhone;
	
	
	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Orders(int orderNo, int memberNo, String price, String name, String phone, String address, String remainAddr,
			String postcode, String content, String regdate, String cof, String ordererName, String ordererPhone) {
		super();
		this.orderNo = orderNo;
		this.memberNo = memberNo;
		this.price = price;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.remainAddr = remainAddr;
		this.postcode = postcode;
		this.content = content;
		this.regdate = regdate;
		this.cof = cof;
		this.ordererName = ordererName;
		this.ordererPhone = ordererPhone;
	}

	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRemainAddr() {
		return remainAddr;
	}
	public void setRemainAddr(String remainAddr) {
		this.remainAddr = remainAddr;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getCof() {
		return cof;
	}
	public void setCof(String cof) {
		this.cof = cof;
	}
	public String getOrdererName() {
		return ordererName;
	}
	public void setOrdererName(String ordererName) {
		this.ordererName = ordererName;
	}
	public String getOrdererPhone() {
		return ordererPhone;
	}
	public void setOrdererPhone(String ordererPhone) {
		this.ordererPhone = ordererPhone;
	}

	@Override
	public String toString() {
		return "Orders [orderNo=" + orderNo + ", memberNo=" + memberNo + ", price=" + price + ", name=" + name
				+ ", phone=" + phone + ", address=" + address + ", remainAddr=" + remainAddr + ", postcode=" + postcode
				+ ", content=" + content + ", regdate=" + regdate + ", cof=" + cof + ", ordererName=" + ordererName
				+ ", ordererPhone=" + ordererPhone + "]";
	}
	
}
