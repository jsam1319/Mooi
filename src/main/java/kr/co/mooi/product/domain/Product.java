package kr.co.mooi.product.domain;

import kr.co.mooi.common.util.Category;

public class Product {
	int productNo;
	int categoryNo;
	int stock;
	String name;
	String subName;
	String category;
	String price;
	String cost;
	String content;
	String frontImage;
	String regdate;
	String feature;
	String status;
	
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Product(int productNo, int categoryNo, int stock, String name, String subName, String category, String price,
			String cost, String content, String frontImage, String regdate, String feature, String status) {
		super();
		this.productNo = productNo;
		this.categoryNo = categoryNo;
		this.stock = stock;
		this.name = name;
		this.subName = subName;
		this.category = category;
		this.price = price;
		this.cost = cost;
		this.content = content;
		this.frontImage = frontImage;
		this.regdate = regdate;
		this.feature = feature;
		this.status = status;
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
		this.category = Category.valueOfNo(categoryNo).name();
		
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", categoryNo=" + categoryNo + ", stock=" + stock + ", name=" + name
				+ ", subName=" + subName + ", category=" + category + ", price=" + price + ", cost=" + cost
				+ ", content=" + content + ", frontImage=" + frontImage + ", regdate=" + regdate + ", feature="
				+ feature + ", status=" + status + "]";
	}
}
