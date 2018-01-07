package kr.co.mooi.product.dao;

import java.util.List;

import kr.co.mooi.product.domain.Product;

public interface ProductDao {

	public int insert(Product product);
	
	public List<Product> selectByCategory(int categoryNo);
	
	public Product select(int productNo);
	
	public List<Product> selectAll();
	
}
