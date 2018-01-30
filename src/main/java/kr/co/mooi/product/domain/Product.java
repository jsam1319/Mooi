package kr.co.mooi.product.domain;

public class Product {
	int productNo;
	int categoryNo;
	int stock;
	String name;
	String subName;
	String price;
	String cost;
	String content;
	String frontImage;
	String regdate;
	String feature;
	
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Product(int productNo, int categoryNo, int stock, String name, String subName, String price, String cost,
			String content, String frontImage, String regdate, String feature) {
		super();
		this.productNo = productNo;
		this.categoryNo = categoryNo;
		this.stock = stock;
		this.name = name;
		this.subName = subName;
		this.price = price;
		this.cost = cost;
		this.content = content;
		this.frontImage = frontImage;
		this.regdate = regdate;
		this.feature = feature;
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


	public int getStock() {
		return stock;
	}


	public void setStock(int stock) {
		this.stock = stock;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getSubName() {
		return subName;
	}


	public void setSubName(String subName) {
		this.subName = subName;
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


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	public String getFeature() {
		return feature;
	}


	public void setFeature(String feature) {
		this.feature = feature;
	}


	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", categoryNo=" + categoryNo + ", stock=" + stock + ", name=" + name
				+ ", subName=" + subName + ", price=" + price + ", cost=" + cost + ", content=" + content
				+ ", frontImage=" + frontImage + ", regdate=" + regdate + ", feature=" + feature + "]";
	}
	
	
}
