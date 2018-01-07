package kr.co.mooi.product.service;

import java.util.List;

import kr.co.mooi.product.domain.Product;

public interface ProductService {

	public int insert(Product product); 
	
	public List<Product> selectByCategory(int categoryNo);
	
	public Product select(int productNo);
	
	public List<Product> selectAll();
}
