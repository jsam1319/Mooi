package kr.co.mooi.product.dao;

import java.util.List;

import kr.co.mooi.product.domain.PageBuilder;
import kr.co.mooi.product.domain.Product;

public interface ProductDao {

	public int insert(Product product);
	
	public List<Product> selectByCategory(PageBuilder pageBuilder);
	
	public Product select(int productNo);
	
	public List<Product> selectAll();
	
	public int updateStock(Product product);
	
	public List<Product> selectNewArrive();
	
	public List<Product> selectPopular();
	
	public List<Product> selectFeature();
	
	public int addFeature(int productNo);
	
	public int removeFeature(int productNo);
	
}
