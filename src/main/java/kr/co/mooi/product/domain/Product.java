package kr.co.mooi.product.domain;

public class Product {
	int productNo;
	int categoryNo;
	String name;
	String price;
	String cost;
	String content;
	String frontImage;
	
	
	
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product(int productNo, int categoryNo, String name, String price, String cost, String content,
			String frontImage) {
		super();
		this.productNo = productNo;
		this.categoryNo = categoryNo;
		this.name = name;
		this.price = price;
		this.cost = cost;
		this.content = content;
		this.frontImage = frontImage;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {
		this.cost = cost;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFrontImage() {
		return frontImage;
	}
	public void setFrontImage(String frontImage) {
		this.frontImage = frontImage;
	}
	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", categoryNo=" + categoryNo + ", name=" + name + ", price=" + price
				+ ", cost=" + cost + ", content=" + content + ", frontImage=" + frontImage + "]";
	}
	
	
}
