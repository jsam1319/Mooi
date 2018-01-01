package kr.co.mooi.product.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kr.co.mooi.image.service.ImageService;
import kr.co.mooi.product.domain.Product;
import kr.co.mooi.product.service.ProductService;

@Controller
public class ProductController {

	Logger logger = Logger.getLogger(ProductController.class);
	
	@Inject
	ImageService imageService;
	
	@Inject
	ProductService productService;
	
	@RequestMapping("/product/insertForm")
	public String insertForm() {
		return "product/insert";
	}
	
	@RequestMapping("/product/listForm")
	public String listForm() {
		return "product/list";
	}
	
	@RequestMapping(value="/product/insert", method=RequestMethod.POST)
	public String insert(Product product, MultipartFile image, HttpServletRequest request) throws Exception {
		String frontImage = imageService.uploadImage(image);
		product.setFrontImage(frontImage);
		
		logger.info(productService.insert(product));
		
		return "redirect:/";
	}
}
