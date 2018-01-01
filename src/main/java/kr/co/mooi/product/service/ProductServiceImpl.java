package kr.co.mooi.product.service;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import kr.co.mooi.product.dao.ProductDao;
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
}
