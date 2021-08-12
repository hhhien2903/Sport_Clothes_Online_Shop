package springMVC.BigHomework.UserController;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import springMVC.BigHomework.DTO.CartDTO;
import springMVC.BigHomework.Entity.Customer;
import springMVC.BigHomework.Entity.Order;
import springMVC.BigHomework.Entity.OrderDetail;
import springMVC.BigHomework.Entity.Product;
import springMVC.BigHomework.Entity.User;
import springMVC.BigHomework.Service.BaseService;
import springMVC.BigHomework.Service.CartService;
import springMVC.BigHomework.Service.OrderService;
import springMVC.BigHomework.Service.ProductService;
import springMVC.BigHomework.Service.UserService;

@Controller
public class CartController {
	@Autowired
	private BaseService baseService;
	@Autowired
	private ProductService productService;
	@Autowired
	private CartService cardService;
	@Autowired
	private UserService userService;
	@Autowired
	private OrderService orderService;
	@SuppressWarnings("unchecked")
	@RequestMapping("/cart/add")
	public String addToCard(Model model, HttpServletRequest request, HttpSession session, @RequestParam("productID") int productID) {
		HashMap<Integer, CartDTO> cartItems_old = (HashMap<Integer, CartDTO>) session.getAttribute("myCartItems");
		Product product = productService.getProductByID(productID);
		if(cartItems_old != null && cartItems_old.containsKey(product.getProductID())) {
			if(cartItems_old.get(product.getProductID()).getQuantity() + 1 > product.getQuantityInStock()) {
				return "redirect:/cart/view-cart" ;
			}
		}
		HashMap<Integer, CartDTO> cardItems_current = cardService.addToCart(product, cartItems_old);
		session.setAttribute("myCartItems", cardItems_current);
		session.setAttribute("myCartTotal", totalPrice(cardItems_current));
        session.setAttribute("myCartNum", cardItems_current.size());
//		return "user/test";
       
        return "redirect:" +request.getHeader("Referer");
        
	}
	
	@SuppressWarnings("unchecked")
	@PostMapping("/cart/edit")
	public String editCart(HttpServletRequest request, HttpSession session) {
		HashMap<Integer, CartDTO> cartItems_old = (HashMap<Integer, CartDTO>) session.getAttribute("myCartItems");	
		String[] quantity = request.getParameterValues("quantity");
		String[] productID = request.getParameterValues("productID");
		for(int i = 0; i < cartItems_old.size(); i++) {
			Product productInDB = productService.getProductByID(Integer.parseInt(productID[i]));
			if(Integer.parseInt(quantity[i]) > productInDB.getQuantityInStock()) {
				cartItems_old.get(Integer.parseInt(productID[i])).setQuantity(productInDB.getQuantityInStock());
			}else {
				
				cartItems_old.get(Integer.parseInt(productID[i])).setQuantity(Integer.parseInt(quantity[i]));
			}
		}
		session.setAttribute("myCartItems", cartItems_old);
		session.setAttribute("myCartTotal", totalPrice(cartItems_old));
		session.setAttribute("myCartNum", cartItems_old.size());
		return "redirect:/cart/view-cart";
        
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/cart/delete")
	public String deleteCart(HttpServletRequest request, HttpSession session, @RequestParam("productID") int productID) {
		HashMap<Integer, CartDTO> cartItems_old = (HashMap<Integer, CartDTO>) session.getAttribute("myCartItems");	
		cartItems_old.remove(productID);
		session.setAttribute("myCartItems", cartItems_old);
		session.setAttribute("myCartTotal", totalPrice(cartItems_old));
		session.setAttribute("myCartNum", cartItems_old.size());
        return "redirect:/cart/view-cart";
        
	}
	
	@SuppressWarnings("unchecked")
	@PostMapping("/cart/addInDetail")
	public String addToCardInDetail(Model model, HttpServletRequest request, HttpSession session) {
		HashMap<Integer, CartDTO> cartItems_old = (HashMap<Integer, CartDTO>) session.getAttribute("myCartItems");
		
		String quantity = request.getParameter("quantity");
		String productID = request.getParameter("productID");
		Product product = productService.getProductByID(Integer.parseInt(productID));
		if(cartItems_old != null && cartItems_old.containsKey(product.getProductID())) {
			int totalQuantity = cartItems_old.get(product.getProductID()).getQuantity() + Integer.parseInt(quantity);
			if(totalQuantity > product.getQuantityInStock()) {
				CartDTO item = cartItems_old.get(product.getProductID());
				item.setQuantity(product.getQuantityInStock());
				cartItems_old.put(product.getProductID(), item);
				session.setAttribute("myCartItems", cartItems_old);
				session.setAttribute("myCartTotal", totalPrice(cartItems_old));
		        session.setAttribute("myCartNum", cartItems_old.size());
				return "redirect:/cart/view-cart" ;
			}
		}
		HashMap<Integer, CartDTO> cardItems_current = cardService.addToCartInDetail(product, Integer.parseInt(quantity), cartItems_old);
		session.setAttribute("myCartItems", cardItems_current);
		session.setAttribute("myCartTotal", totalPrice(cardItems_current));
        session.setAttribute("myCartNum", cardItems_current.size());
        
        return "redirect:/cart/view-cart";
        
	}
	
	@RequestMapping("/cart/view-cart")
	public String viewCard(HttpSession session,Model model) {
		session.removeAttribute("quantityFull");
		model.addAttribute("listSuppliers", baseService.getSupplierMenu());
		model.addAttribute("listCategories", baseService.getCategoryMenu());
		return "user/shopping_cart";
	}
	
	
	@RequestMapping("/user/checkout")
	public String checkOut(Model model,Principal principal, HttpSession session) {
		model.addAttribute("listSuppliers", baseService.getSupplierMenu());
		model.addAttribute("listCategories", baseService.getCategoryMenu());
		if(principal != null) {
			User user = userService.findByUserName(principal.getName());
			session.setAttribute("loggedUser", user);
		}
		model.addAttribute("order", new Order());
		return "user/user_checkout";
	}
	
	@SuppressWarnings("unchecked")
	@PostMapping("/user/confirm-checkout")
	public String confirmCheckout(Model model, HttpSession session,@Valid @ModelAttribute("order") Order order, Errors errors) {
		if(errors.hasErrors()) {
			return "user/user_checkout";
		}else {
		HashMap<Integer, CartDTO> cartItems = (HashMap<Integer, CartDTO>) session.getAttribute("myCartItems");
		User user = (User) session.getAttribute("loggedUser");	
		Set<OrderDetail> listOrderItems = new HashSet<OrderDetail>();
		for(Map.Entry<Integer, CartDTO> item: cartItems.entrySet()) {
			OrderDetail orderItem = new OrderDetail();
			orderItem.setOrder(order);
			orderItem.setProduct(item.getValue().getProduct());
			orderItem.setQuantity(item.getValue().getQuantity());
			orderItem.setUnitPrice(item.getValue().getProduct().getUnitPrice());
			listOrderItems.add(orderItem);
		}
		order.setOrderDate(new Date());
		order.setCustomer(user.getCustomer());
		order.setOrderStatus("Đang Xử Lý");
		order.setOrderTotal(totalPrice(cartItems));
		order.setListOrderDetails(listOrderItems);
		orderService.addOrder(order);
		cartItems = new HashMap<>();
        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("myCartTotal", 0);
        session.setAttribute("myCartNum", 0);
        model.addAttribute("listSuppliers", baseService.getSupplierMenu());
		model.addAttribute("listCategories", baseService.getCategoryMenu());
		return "user/user_order_success";
		}
	}
	
	public int totalPrice(HashMap<Integer, CartDTO> cartItems) {
        int total = 0;
        for (Map.Entry<Integer, CartDTO> list : cartItems.entrySet()) {
            total += list.getValue().getProduct().getUnitPrice() * list.getValue().getQuantity();
        }
        return total;
    }
}
