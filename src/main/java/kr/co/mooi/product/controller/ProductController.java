package kr.co.mooi.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mooi.image.service.ImageService;
import kr.co.mooi.keyword.domain.Keyword;
import kr.co.mooi.keyword.service.KeywordService;
import kr.co.mooi.product.domain.PageBuilder;
import kr.co.mooi.product.domain.Product;
import kr.co.mooi.product.service.ProductService;

@Controller
public class ProductController {

	Logger logger = Logger.getLogger(ProductController.class);
	
	@Inject
	ImageService imageService;
	
	@Inject
	ProductService productService;
	
	@Inject
	KeywordService keywordService;
	
	@RequestMapping(value="/product/{productNo}", method=RequestMethod.GET)
	@ResponseBody
	public Product select(@PathVariable int productNo) {
		return productService.select(productNo);
	}
	
	@RequestMapping(value="/product/{productNo}", method=RequestMethod.DELETE)
	@ResponseBody
	public Map<String, Object> delete(@PathVariable int productNo) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", "FAIL");
		Product product = productService.select(productNo);
		product.setStatus("F");
		
		if(productService.updateStatus(product) > 0) {
			resultMap.put("result", "SUCCESS");
		}
		
		return resultMap;
	}

	
	@RequestMapping("/product/insertForm")
	public String insertForm() {
		return "product/insert";
	}
	
	@RequestMapping("/product/listForm/{categoryNo}")
	public ModelAndView listForm(@PathVariable int categoryNo) {
		ModelAndView mav = new ModelAndView();
	
		mav.addObject("categoryNo", categoryNo);
		mav.setViewName("product/list");
		
		return mav;
	}
	
	@RequestMapping("/product/modifyForm/{productNo}")
	public ModelAndView modifyForm(@PathVariable int productNo) {
		ModelAndView mav = new ModelAndView();
		
		List<Keyword> keywords = keywordService.selectByProductNo(productNo);
		StringBuilder builder = new StringBuilder();
		
		for (Keyword keyword : keywords) {
			builder.append(keyword.getName());
			builder.append(",");
		}

		mav.addObject("keywordString", builder.toString());
		logger.info(builder.toString());
		mav.addObject("product", productService.select(productNo));
		mav.setViewName("product/modify");
		
		return mav;
	}
	
	@RequestMapping("/product/detailForm/{productNo}")
	public ModelAndView detailForm(@PathVariable int productNo) {
		ModelAndView mav = new ModelAndView();
		Product product = productService.select(productNo);
		
		mav.setViewName("/error/404");
		
		if(product != null) {
			mav.addObject("product", product);
			mav.addObject("keyword", keywordService.selectByProductNo(product.getProductNo()));
			mav.setViewName("product/detail");
		}
		
		return mav;
	}
	
	@RequestMapping(value="/product/insert", method=RequestMethod.POST)
	public String insert(Product product, MultipartFile image, HttpServletRequest request, String keywordString) throws Exception {
		String frontImage = imageService.uploadImage(request, image);
		product.setFrontImage(frontImage);
		
		logger.info(productService.insert(product));
		logger.info(product.getProductNo());
		
		String[] keywordNames = keywordString.split(",");
		
		for (String keywordName : keywordNames) {
			Keyword keyword = new Keyword();

			keyword.setProductNo(product.getProductNo());
			keyword.setName(keywordName);
			
			keywordService.insert(keyword);
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/product/modify", method=RequestMethod.POST)
	public String modify(Product product, MultipartFile image, HttpServletRequest request, String keywordString) throws Exception {
		logger.info(product);
		logger.info(productService.modify(product));

		keywordService.deleteByProductNo(product.getProductNo());
		String[] keywordNames = keywordString.split(",");
		
		for (String keywordName : keywordNames) {
			Keyword keyword = new Keyword();

			keyword.setProductNo(product.getProductNo());
			keyword.setName(keywordName);
			
			keywordService.insert(keyword);
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/product/list/{categoryNo}", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> listByCategory(@PathVariable int categoryNo, int page) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		PageBuilder pageBuilder = new PageBuilder();
		pageBuilder.setCategoryNo(categoryNo);
		pageBuilder.setPage(page * 8);
		
		List<Product> products = productService.selectByCategory(pageBuilder);
		
		resultMap.put("result", "FAIL");
		
		if(products.size() != 0) {
			resultMap.put("list", products);
			resultMap.put("result", "SUCCESS");
		}
		
		return resultMap;
	}
	
	@RequestMapping(value="/product/list", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> listAll() {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		List<Product> products = productService.selectAll();
		
		resultMap.put("result", "FAIL");
		
		if(products.size() != 0) {
			resultMap.put("list", products);
			resultMap.put("result", "SUCCESS");
		}
		
		return resultMap;
	}
	
	@RequestMapping(value="/product/stock/{productNo}", method=RequestMethod.PUT)
	@ResponseBody
	public String updateStock(@PathVariable int productNo, @RequestBody String stock) {
		String result = "FAIL";
		Product product = new Product();
		
		product.setProductNo(productNo);
		product.setStock(Integer.parseInt(stock));

		if(productService.updateStock(product) >= 1) result = "SUCCESS";
		
		return result;
	}
	
	@RequestMapping(value="/product/feature/{productNo}", method=RequestMethod.PUT)
	@ResponseBody
	public String addFeature(@PathVariable int productNo) {
		String result = "FAIL";

		if(productService.addFeature(productNo) >= 1) result = "SUCCESS";
		
		return result;
	}
	
	@RequestMapping(value="/product/feature/{productNo}", method=RequestMethod.PATCH)
	@ResponseBody
	public String removeFeature(@PathVariable int productNo) {
		String result = "FAIL";

		if(productService.removeFeature(productNo) >= 1) result = "SUCCESS";
		
		return result;
	}
	
}
