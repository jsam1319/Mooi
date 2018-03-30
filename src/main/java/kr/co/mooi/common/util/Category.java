package kr.co.mooi.common.util;

public enum Category {
	ETC(0, "나머지"),
	
	EARRING(110, "귀걸이"),
	PIERCING(120, "피어싱"),
	
	NECKLACE(210, "목걸이"), 
	BRACELET(220, "팔찌"),
	
	RING(310, "맨투맨"), 
	
	HAIRITEM(410, "헤어용품"); 

	int categoryNo;
	String koreanName;
	
	Category(int categoryNo, String koreanName) {
		this.categoryNo = categoryNo;
		this.koreanName = koreanName;
	}

	public static Category valueOfNo(int categoryNo) {
		Category[] categories = Category.values();
		
		for (Category category : categories) {
			if(category.categoryNo == categoryNo)
				return category;
		}
		
		return Category.ETC;
	}
	
	public static Category valueOfKorean(String koreanName) {
		Category[] categories = Category.values();
		
		for (Category category : categories) {
			if(category.koreanName.equals(koreanName))
				return category;
		}
		
		return Category.ETC;
	}
	
	public int getCategoryNo() {
		return categoryNo;
	}

	public String getKoreanName() {
		return koreanName;
	}
}
