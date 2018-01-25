package kr.co.mooi.visitor.domain;

public class VisitorCount {

	String date;
	int count;
	
	public VisitorCount() {
		super();
		// TODO Auto-generated constructor stub
	}
	public VisitorCount(String date, int count) {
		super();
		this.date = date;
		this.count = count;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "VisitorCount [date=" + date + ", count=" + count + "]";
	}
	
}
