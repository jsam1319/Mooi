package kr.co.mooi.product.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import kr.co.mooi.product.dao.ProductDao;
import kr.co.mooi.product.domain.PageBuilder;
import kr.co.mooi.product.domain.Product;

@Service
public class ProductServiceImpl implements ProductService {

	Logger logger = Logger.getLogger(this.getClass());
	
	@Inject
	ProductDao productDao;
	
	@Override
	public int insert(Product product) {
		logger.info(product);
		
		return productDao.insert(product);
	}

	@Override
	public List<Product> selectByCategory(PageBuilder pageBuilder) {
		// TODO Auto-generated method stub
		return productDao.selectByCategory(pageBuilder);
	}

	@Override
	public Product select(int productNo) {
		// TODO Auto-generated method stub
		return productDao.select(productNo);
	}

	@Override
	public List<Product> selectAll() {
		// TODO Auto-generated method stub
		return productDao.selectAll();
	}

	@Override
	public int updateStock(Product product) {
		// TODO Auto-generated method stub
		return productDao.updateStock(product);
	}
	
	@Override
	public List<Product> selectNewArrive() {
		return productDao.selectNewArrive();
	}
	
	@Override
	public List<Product> selectPopular() {
		return productDao.selectPopular();
	}

	@Override
	public List<Product> selectFeature() {
		// TODO Auto-generated method stub
		return productDao.selectFeature();
	}

	@Override
	public int addFeature(int productNo) {
		// TODO Auto-generated method stub
		return productDao.addFeature(productNo);
	}

	@Override
	public int removeFeature(int productNo) {
		// TODO Auto-generated method stub
		return productDao.removeFeature(productNo);
	}
	
	
	
}
