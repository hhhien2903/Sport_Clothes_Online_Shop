package springMVC.BigHomework.Service.Impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springMVC.BigHomework.DAO.CartDAO;
import springMVC.BigHomework.DTO.CartDTO;
import springMVC.BigHomework.Entity.Product;
import springMVC.BigHomework.Service.CartService;
@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDAO cardDAO;
	@Override
	public HashMap<Integer, CartDTO> addToCart(Product product, HashMap<Integer, CartDTO> cartItems) {
		// TODO Auto-generated method stub

		return cardDAO.addToCart(product, cartItems);
	}
	@Override
	public HashMap<Integer, CartDTO> editCart(Product product, int quantity, HashMap<Integer, CartDTO> cartItems) {
		// TODO Auto-generated method stub
		return cardDAO.editCart(product, quantity, cartItems);
	}
	@Override
	public HashMap<Integer, CartDTO> addToCartInDetail(Product product, int quantity,
			HashMap<Integer, CartDTO> cartItems) {
		// TODO Auto-generated method stub
		return cardDAO.addToCartInDetail(product, quantity, cartItems);
	}

}
