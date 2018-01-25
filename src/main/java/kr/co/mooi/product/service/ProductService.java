package kr.co.mooi.product.service;

import java.util.List;

import kr.co.mooi.product.domain.PageBuilder;
import kr.co.mooi.product.domain.Product;

public interface ProductService {

	public int insert(Product product); 
	
	public List<Product> selectByCategory(PageBuilder pageBuilder);
	
	public Product select(int productNo);
	
	public List<Product> selectAll();

	public int updateStock(Product product);

	public List<Product> selectNewArrive();
	
	public List<Product> selectPopular();
}

