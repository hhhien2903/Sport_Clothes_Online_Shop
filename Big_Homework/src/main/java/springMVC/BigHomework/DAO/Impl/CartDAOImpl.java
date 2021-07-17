package springMVC.BigHomework.DAO.Impl;

import java.util.HashMap;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import springMVC.BigHomework.DAO.CartDAO;
import springMVC.BigHomework.DTO.CartDTO;
import springMVC.BigHomework.Entity.Product;

@Repository
public class CartDAOImpl implements CartDAO{

	@Override
	public HashMap<Integer, CartDTO> addToCart(Product product, HashMap<Integer, CartDTO> cartItems) {
		// TODO Auto-generated method stub
		if(cartItems == null) {
			cartItems = new HashMap<>();
		}
		if(product != null) {
			if (cartItems.containsKey(product.getProductID())) {
				CartDTO item = cartItems.get(product.getProductID());
				item.setProduct(product);
				item.setQuantity(item.getQuantity() + 1);
				cartItems.put(product.getProductID(), item);
			}else {
				CartDTO item = new CartDTO();
				item.setProduct(product);
				item.setQuantity(1);
				cartItems.put(product.getProductID(), item);
			}
		}
		return cartItems;
	}

	@Override
	public HashMap<Integer, CartDTO> editCart(Product product, int quantity, HashMap<Integer, CartDTO> cartItems) {
		// TODO Auto-generated method stub
		if(product != null) {
			if (cartItems.containsKey(product.getProductID())) {
				CartDTO item = cartItems.get(product.getProductID());
				item.setProduct(product);
				item.setQuantity(quantity);
				cartItems.put(product.getProductID(), item);
			}
		}
		return cartItems;
	}

	@Override
	public HashMap<Integer, CartDTO> addToCartInDetail(Product product, int quantity,
			HashMap<Integer, CartDTO> cartItems) {
		// TODO Auto-generated method stub
		if(cartItems == null) {
			cartItems = new HashMap<>();
		}
		if(product != null) {
			if (cartItems.containsKey(product.getProductID())) {
				CartDTO item = cartItems.get(product.getProductID());
				item.setProduct(product);
				item.setQuantity(item.getQuantity() + quantity);
				cartItems.put(product.getProductID(), item);
			}else {
				CartDTO item = new CartDTO();
				item.setProduct(product);
				item.setQuantity(quantity);
				cartItems.put(product.getProductID(), item);
			}
		}
		return cartItems;
	}
	
}
