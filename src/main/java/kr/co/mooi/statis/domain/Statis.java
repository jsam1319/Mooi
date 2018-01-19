package kr.co.mooi.statis.domain;

public class Statis {
	int productNo;
	String name;
	/* 판매량 */
	int volume;
	/* 매출액 */
	int sales;
	/* 순이익 = 매출액 - 원가 */
	int income;
	
	public Statis() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Statis(int productNo, String name, int volume, int sales, int income) {
		super();
		this.productNo = productNo;
		this.name = name;
		this.volume = volume;
		this.sales = sales;
		this.income = income;
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

	public int getVolume() {
		return volume;
	}

	public void setVolume(int volume) {
		this.volume = volume;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

	public int getIncome() {
		return income;
	}

	public void setIncome(int income) {
		this.income = income;
	}

	@Override
	public String toString() {
		return "Statis [productNo=" + productNo + ", name=" + name + ", volume=" + volume + ", sales=" + sales
				+ ", income=" + income + "]";
	}
	
}
