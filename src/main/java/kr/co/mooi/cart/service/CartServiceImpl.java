package kr.co.mooi.cart.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.util.WebUtils;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.mooi.cart.dao.CartDao;
import kr.co.mooi.cart.domain.Cart;
import kr.co.mooi.product.dao.ProductDao;
import kr.co.mooi.product.domain.Product;

@Service
public class CartServiceImpl implements CartService {

	Logger logger = Logger.getLogger(this.getClass());
	
	@Inject
	CartDao cartDao;
	
	@Inject
	ProductDao productDao;
	
	@Override
	public int insert(HttpServletRequest request, HttpServletResponse response, Cart cart) throws Exception {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("login") != null) {
			List<Cart> carts = cartDao.selectByMemberNo((int)session.getAttribute("login"));
			
			for (Cart cCart : carts) {
				if(cCart.getProductNo() == cart.getProductNo()) {
					cCart.setAmount(cart.getAmount() + cCart.getAmount());
					
					cartDao.update(cCart);
					return 1;
				}
			}
			
			cart.setMemberNo((int)session.getAttribute("login"));
			return cartDao.insert(cart);
		}
		
		else {
			Cookie cartCookie = WebUtils.getCookie(request, "cartCookie");
			ObjectMapper mapper = new ObjectMapper();
			
			if(cartCookie != null) {
				List<Cart> carts = mapper.readValue(cartCookie.getValue(), new TypeReference<List<Cart>>(){});
				for (Cart cCart : carts) {
					if(cCart.getProductNo() == cart.getProductNo()) {
						cCart.setAmount(cCart.getAmount() + cart.getAmount());
						
						cartCookie.setValue(mapper.writeValueAsString(carts));
						response.addCookie(cartCookie);
						
						return 1;
					}
				}
				
				cart.setCartNo(System.identityHashCode(cart));
				carts.add(cart);
				
				cartCookie.setValue(mapper.writeValueAsString(carts));
				cartCookie.setPath("/");
				cartCookie.setMaxAge(60 * 60 * 24 * 30);
				response.addCookie(cartCookie);
				
				return 1;
			}
			
			else {
				List<Cart> carts = new ArrayList<Cart>();
				cart.setCartNo(System.identityHashCode(cart));
				carts.add(cart);

				Cookie newCartCookie = new Cookie("cartCookie", mapper.writeValueAsString(carts));
				newCartCookie.setPath("/");
				
				response.addCookie(newCartCookie);
			}
		
			return 1;
		}
	}

	@Override
	public int delete(HttpServletRequest request, HttpServletResponse response, int cartNo) throws Exception {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("login") != null) {
			return cartDao.delete(cartNo);
		}
		
		else {
			Cookie cartCookie = WebUtils.getCookie(request, "cartCookie");
			ObjectMapper mapper = new ObjectMapper();

			List<Cart> carts = mapper.readValue(cartCookie.getValue(), new TypeReference<List<Cart>>(){});
			
			for (int i=0; i<carts.size(); i++) {
				if(carts.get(i).getCartNo() == cartNo) {
					carts.remove(i);
				}
			}
				
			if(carts.size() == 0) cartCookie.setMaxAge(0);
			
			cartCookie.setValue(mapper.writeValueAsString(carts));
			cartCookie.setPath("/");
			response.addCookie(cartCookie);
				
			return 1;
			
		}
	}
	
	@Override
	public int update(HttpServletRequest request, Cart cart) throws Exception {
		return cartDao.update(cart);
	}

	@Override
	public List<Cart> selectByMemberNo(int memberNo) {
		return cartDao.selectByMemberNo(memberNo);
	}

	@Override
	public List<Cart> selectByNonMember(HttpServletRequest request) throws Exception {
		Cookie cartCookie = WebUtils.getCookie(request, "cartCookie");
		ObjectMapper mapper = new ObjectMapper();
		
		List<Cart> carts = mapper.readValue(cartCookie.getValue(), new TypeReference<List<Cart>>(){});
		
		return carts;
	}
	
	
}
