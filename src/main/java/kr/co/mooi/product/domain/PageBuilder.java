package kr.co.mooi.product.domain;

public class PageBuilder {

	int categoryNo;
	int page;
	int count;
	
	public PageBuilder() {
		/* default 10 */
		count = 8;
	}

	public PageBuilder(int categoryNo, int page, int count) {
		super();
		this.categoryNo = categoryNo;
		this.page = page;
		this.count = count;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "PageBuilder [categoryNo=" + categoryNo + ", page=" + page + ", count=" + count + "]";
	}

	
	
}
