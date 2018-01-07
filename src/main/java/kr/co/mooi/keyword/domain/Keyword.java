package kr.co.mooi.keyword.domain;

public class Keyword {

	int keywordNo;
	int productNo;
	String name;
	int hitCount;
	
	public Keyword() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Keyword(int keywordNo, int productNo, String name, int hitCount) {
		super();
		this.keywordNo = keywordNo;
		this.productNo = productNo;
		this.name = name;
		this.hitCount = hitCount;
	}

	public int getKeywordNo() {
		return keywordNo;
	}

	public void setKeywordNo(int keywordNo) {
		this.keywordNo = keywordNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getHitCount() {
		return hitCount;
	}

	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}

	@Override
	public String toString() {
		return "Keyword [keywordNo=" + keywordNo + ", productNo=" + productNo + ", name=" + name + ", hitCount="
				+ hitCount + "]";
	}
}
