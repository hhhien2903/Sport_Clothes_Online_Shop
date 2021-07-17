package springMVC.BigHomework.UserController;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import springMVC.BigHomework.DTO.ProductDTO;
import springMVC.BigHomework.DTO.UserDTO;
import springMVC.BigHomework.Entity.Category;
import springMVC.BigHomework.Entity.Customer;
import springMVC.BigHomework.Entity.Order;
import springMVC.BigHomework.Entity.Product;
import springMVC.BigHomework.Entity.Supplier;
import springMVC.BigHomework.Entity.User;
import springMVC.BigHomework.Entity.UserRole;
import springMVC.BigHomework.Service.CategoryService;
import springMVC.BigHomework.Service.OrderService;
import springMVC.BigHomework.Service.ProductService;
import springMVC.BigHomework.Service.SupplierService;
import springMVC.BigHomework.Service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private UserService userService;
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private SupplierService supplierService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private ServletContext servletContext;
	
	@GetMapping("/dashboard")
	public String showDashbord(Model model,Principal principal, HttpSession session) {
		if(principal != null) {
			User user = userService.findByUserName(principal.getName());
			session.setAttribute("loggedAdmin", user);
		}
		model.addAttribute("listProducts", productService.getAllProduct());
		model.addAttribute("listUsers", userService.getOnlyUserRole());
		model.addAttribute("listOrders",orderService.getAllOrders());
		return "/admin/admin_dashboard";
	}
	
	
	//Product Control
	@GetMapping("/product")
	public String productManager(Model model,Principal principal, HttpSession session) {
		if(principal != null) {
			User user = userService.findByUserName(principal.getName());
			session.setAttribute("loggedAdmin", user);
		}
		model.addAttribute("list", productService.getAllProduct());
		model.addAttribute("title", "Sản Phẩm");
		return "/admin/product_manager";
	}
	
	@GetMapping("/product/add")
	public String addProduct(Model model,Principal principal, HttpSession session) {
		if(principal != null) {
			User user = userService.findByUserName(principal.getName());
			session.setAttribute("loggedAdmin", user);
		}
		model.addAttribute("title", "Sản Phẩm");
		model.addAttribute("listCategories",categoryService.getAllCategory());
		model.addAttribute("listSuppliers", supplierService.getAllSupplier());
		model.addAttribute("productDTO", new ProductDTO());
		return "/admin/product_add";
	}
	
	@PostMapping("/product/add")
	public String addProductPost(Model model,@Valid @ModelAttribute("productDTO") ProductDTO productDTO, Errors errors) {
		if(errors.hasErrors()) {
			model.addAttribute("listCategories",categoryService.getAllCategory());
			model.addAttribute("listSuppliers", supplierService.getAllSupplier());
			return "/admin/product_add";
		}else {
			List<MultipartFile> files = productDTO.getFiles();
			List<String> listImages = new ArrayList<String>();
			for(MultipartFile file : files) {
				String fileName = saveImage(file);
				listImages.add(fileName);
			}
			Product product = new Product();
			product.setProductName(productDTO.getProductName());
			product.setQuantityInStock(Integer.parseInt(productDTO.getQuantityInStock()));
			product.setUnitPrice(Integer.parseInt(productDTO.getUnitPrice()));
			product.setDescription(productDTO.getDescription());
			product.setCategory(categoryService.getCategoryByID(Integer.parseInt(productDTO.getCategory())));
			product.setSupplier(supplierService.getSupplierByID(Integer.parseInt(productDTO.getSupplier())));
			product.setDiscontinued(productDTO.getDiscontinued() == 1 ? true : false);
			product.setListImages(listImages);
			productService.addProduct(product);
			return "redirect:/admin/product";
		}
	}
	
	
	@GetMapping("/product/delete")
	public String deleteProduct(Model model, @RequestParam("productID") int productID) {
		try {
			productService.deleteProduct(productID);
		}catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("msgError", "Không thể xoá Sản Phẩm này vì đã có Người Dùng đặt hàng! Nếu muốn ẩn Sản Phẩm, hãy chuyển Trạng Thái Sản Phẩm sang Ngừng Bán!");
			return "/admin/error";
		}
		
		return "redirect:/admin/product";
	}
	
	@GetMapping("/product/edit")
	public String editProduct(Model model,Principal principal, HttpSession session, @RequestParam("productID") int productID) {
		if(principal != null) {
			User user = userService.findByUserName(principal.getName());
			session.setAttribute("loggedAdmin", user);
		}
		model.addAttribute("title", "Sản Phẩm");
		model.addAttribute("listCategories",categoryService.getAllCategory());
		model.addAttribute("listSuppliers", supplierService.getAllSupplier());
		model.addAttribute("product",productService.getProductByID(productID));
		session.setAttribute("listEditImage", productService.getProductByID(productID).getListImages());
		model.addAttribute("productDTO", new ProductDTO());
		return "/admin/product_edit";
	}
	
	@PostMapping("/product/edit")
	public String editProductPost(HttpSession session,Model model,@Valid @ModelAttribute("productDTO") ProductDTO productDTO, Errors errors) {
		if(errors.hasErrors()) {
			model.addAttribute("listCategories",categoryService.getAllCategory());
			model.addAttribute("listSuppliers", supplierService.getAllSupplier());
			return "/admin/product_edit";
		}else {
			List<MultipartFile> files = productDTO.getFiles();
			List<String> listImages = new ArrayList<String>();
			for(MultipartFile file : files) {
				if(!file.isEmpty()) {
					String fileName = saveImage(file);
					listImages.add(fileName);
				}
			}
			
			Product product = productService.getProductByID(productDTO.getProductID());
			product.setProductName(productDTO.getProductName());
			product.setQuantityInStock(Integer.parseInt(productDTO.getQuantityInStock()));
			product.setUnitPrice(Integer.parseInt(productDTO.getUnitPrice()));
			product.setDescription(productDTO.getDescription());
			product.setCategory(categoryService.getCategoryByID(Integer.parseInt(productDTO.getCategory())));
			product.setSupplier(supplierService.getSupplierByID(Integer.parseInt(productDTO.getSupplier())));
			product.setDiscontinued(productDTO.getDiscontinued() == 1 ? true : false);
			if(listImages.size() > 0) {
				product.getListImages().clear();
				product.setListImages(listImages);
			}
			productService.editProduct(product);
			session.removeAttribute("listEditImage");
			return "redirect:/admin/product";
			
		}
	}
	
	private String saveImage(MultipartFile multipartFile) {
		try {
			byte[] bytes = multipartFile.getBytes();
//			Path path = Paths.get("D:\\Workspace\\Third year - Semester 2\\WWW\\Big_Homework\\src\\main\\webapp\\WEB-INF\\assets\\user\\images\\product_image\\" + multipartFile.getOriginalFilename());
			Path path = Paths.get(servletContext.getRealPath("/WEB-INF/assets/user/images/product_image/" + multipartFile.getOriginalFilename()));
			Files.write(path, bytes);
			return multipartFile.getOriginalFilename();
		} catch (IOException e) {
			return null;
		}
	}
	
	@GetMapping("/product/search")
	public String searchProduct(Model model, @RequestParam("input") String input) {
		model.addAttribute("list", productService.searchProductDB(input));
		model.addAttribute("title", "Sản Phẩm");
		return "/admin/product_manager";
	}
	
	//Order Control
	@GetMapping("/order")
	public String orderManager(Model model,Principal principal, HttpSession session) {
		if(principal != null) {
			User user = userService.findByUserName(principal.getName());
			session.setAttribute("loggedAdmin", user);
		}
		model.addAttribute("list", orderService.getAllOrders());
		model.addAttribute("title", "Đơn Hàng");
		return "/admin/order_manager";
	}
	
	@GetMapping("/order/view-detail")
	public String orderDetail(Model model, @RequestParam("orderID") int orderID) {
		model.addAttribute("orderID",orderID);
		model.addAttribute("list", orderService.getOrderByID(orderID).getListOrderDetails());
		model.addAttribute("title", "Đơn Hàng");
		return "/admin/order_detail";
	}
	
	@GetMapping("/order/delete")
	public String deleteOrder(Model model, @RequestParam("orderID") int orderID) {
		orderService.deleteOrder(orderID);
		return "redirect:/admin/order";
	}
	
	@GetMapping("/order/edit")
	public String editOrder(Model model,Principal principal, HttpSession session, @RequestParam("orderID") int orderID) {
		if(principal != null) {
			User user = userService.findByUserName(principal.getName());
			session.setAttribute("loggedAdmin", user);
		}
		model.addAttribute("title", "Đơn Hàng");
		Order orderInDB = orderService.getOrderByID(orderID);
		model.addAttribute("orderInDB", orderInDB);
		session.setAttribute("editCustomerID", orderInDB.getCustomer().getCustomerID());
		session.setAttribute("editOrderDate", orderInDB.getOrderDate());
		session.setAttribute("editOrderTotal", orderInDB.getOrderTotal());
		session.setAttribute("editOrderStatus", orderInDB.getOrderStatus());
		model.addAttribute("order", new Order());
		return "/admin/order_edit";
	}
	
	@PostMapping("/order/edit")
	public String editOrderPost(@Valid @ModelAttribute("order") Order order, Errors error, HttpSession session) {
		if(error.hasErrors()) {
			return "/admin/order_edit";
		}else {
			
			Order orderInDB = orderService.getOrderByID(order.getOrderID());
			orderInDB.setOrdererPhoneNumber(order.getOrdererPhoneNumber());
			orderInDB.setOrdererName(order.getOrdererName());
			orderInDB.setReceiverName(order.getReceiverName());
			orderInDB.setReceiverPhoneNumber(order.getReceiverPhoneNumber());
			orderInDB.setReceiverAddress(order.getReceiverAddress());
			orderInDB.setOrderStatus(order.getOrderStatus());
			orderService.editOrder(orderInDB);
			session.removeAttribute("editCustomerID");
			session.removeAttribute("editOrderDate");
			session.removeAttribute("editOrderTotal");
			session.removeAttribute("editOrderStatus");
			return "redirect:/admin/order";
		}
	}
	
	@GetMapping("/order/search")
	public String searchOrder(Model model, @RequestParam("input") String input) {
		model.addAttribute("list", orderService.searchOrder(input));
		model.addAttribute("title", "Đơn Hàng");
		return "/admin/order_manager";
	}
	
	
	//Category Control
	@GetMapping("/category")
	public String categoryManager(Model model,Principal principal, HttpSession session) {
		if(principal != null) {
			User user = userService.findByUserName(principal.getName());
			session.setAttribute("loggedAdmin", user);
		}
		model.addAttribute("list", categoryService.getAllCategory());
		String[] tableHead = {"Mã Danh Mục","Tên Danh Mục"};
		model.addAttribute("tableHead", tableHead);
		model.addAttribute("title", "Danh Mục");
		return "/admin/category_manager";
	}
	
	@GetMapping("/category/add")
	public String addCategory(Model model,Principal principal, HttpSession session) {
		if(principal != null) {
			User user = userService.findByUserName(principal.getName());
			session.setAttribute("loggedAdmin", user);
		}
		model.addAttribute("title", "Danh Mục");
		model.addAttribute("category", new Category());
		return "/admin/category_add";
	}
	
	@PostMapping("/category/add")
	public String addCategoryPost(@Valid @ModelAttribute("category") Category category, Errors errors ) {
		if(errors.hasErrors()) {
			return "/admin/category_add";
		}else {
			categoryService.addCategory(category);
			return "redirect:/admin/category";
		}
		
	}
	
	@GetMapping("/category/delete")
	public String deleteCategory(Model model, @RequestParam("categoryID") int categoryID) {
		try {
			categoryService.deleteCategory(categoryID);
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("msgError", "Không thể xoá vì đã có Sản Phẩm nằm trong Danh Mục này, hãy xoá những Sản Phẩm đó trước!");
			return "/admin/error";
		}
		
		return "redirect:/admin/category";
	}
	
	@GetMapping("/category/edit")
	public String editCategory(Model model,Principal principal, HttpSession session, @RequestParam("categoryID") int categoryID) {
		if(principal != null) {
			User user = userService.findByUserName(principal.getName());
			session.setAttribute("loggedAdmin", user);
		}
		model.addAttribute("title", "Danh Mục");
		model.addAttribute("categoryInDB", categoryService.getCategoryByID(categoryID));
		model.addAttribute("category", new Category());
		return "/admin/category_edit";
	}
	
	@PostMapping("/category/edit")
	public String editCategoryPost(@Valid @ModelAttribute("category") Category category, Errors errors) {
		if(errors.hasErrors()) {
			return "/admin/category_edit";
		}else {
			categoryService.editCategory(category);
			return "redirect:/admin/category";
		}
		
	}
	
	@GetMapping("/category/search")
	public String searchCategory(Model model, @RequestParam("input") String input) {
		model.addAttribute("list", categoryService.searchCategory(input));
		String[] tableHead = {"Mã Danh Mục","Tên Danh Mục"};
		model.addAttribute("tableHead", tableHead);
		model.addAttribute("title", "Danh Mục");
		return "/admin/category_manager";
	}
	
	//Supplier Control

	@GetMapping("/supplier")
	public String supplierManager(Model model,Principal principal, HttpSession session) {
		if(principal != null) {
			User user = userService.findByUserName(principal.getName());
			session.setAttribute("loggedAdmin", user);
		}
		model.addAttribute("list", supplierService.getAllSupplier());
		String[] tableHead = {"Mã Nhà Cung Cấp","Tên Nhà Cung Cấp","Email"};
		model.addAttribute("tableHead", tableHead);
		model.addAttribute("title", "Nhà Cung Cấp");
		return "/admin/supplier_manager";
	}
	
	@GetMapping("/supplier/add")
	public String addSupplier(Model model,Principal principal, HttpSession session) {
		if(principal != null) {
			User user = userService.findByUserName(principal.getName());
			session.setAttribute("loggedAdmin", user);
		}
		model.addAttribute("title", "Nhà Cung Cấp");
		model.addAttribute("supplier", new Supplier());
		return "/admin/supplier_add";
	}
	
	@PostMapping("/supplier/add")
	public String addSupplierPost(@Valid @ModelAttribute("supplier") Supplier supplier, Errors errors) {
		if(errors.hasErrors()) {
			return "/admin/supplier_add";
		}else {
			supplierService.addSupplier(supplier);
			return "redirect:/admin/supplier";
		}
		
	}
	
	@GetMapping("/supplier/delete")
	public String deleteSupplier(Model model, @RequestParam("supplierID") int supplierID) {
		try {
			supplierService.deleteSupplier(supplierID);
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("msgError","Không thể xoá vì đã có Sản Phẩm thuộc Nhà Cung Cấp Này, hãy xoá các Sản Phẩm đó trước!");
			return "/admin/error";
		}
		
		return "redirect:/admin/supplier";
	}
	
	@GetMapping("/supplier/edit")
	public String editSupplier(Model model,Principal principal, HttpSession session, @RequestParam("supplierID") int supplierID) {
		if(principal != null) {
			User user = userService.findByUserName(principal.getName());
			session.setAttribute("loggedAdmin", user);
		}
		model.addAttribute("title", "Nhà Cung Cấp");
		model.addAttribute("supplierInDB", supplierService.getSupplierByID(supplierID));
		model.addAttribute("supplier", new Supplier());
		return "/admin/supplier_edit";
	}
	
	@PostMapping("/supplier/edit")
	public String editSupplierPost(@Valid @ModelAttribute("supplier") Supplier supplier, Errors errors) {
		if(errors.hasErrors()) {
			return "/admin/supplier_edit";
		}else {
			supplierService.editSupplier(supplier);
			return "redirect:/admin/supplier";
		}
		
	}
	

	@GetMapping("/supplier/search")
	public String searchSupplier(Model model, @RequestParam("input") String input) {
		model.addAttribute("list", supplierService.searchSupplier(input));
		String[] tableHead = {"Mã Nhà Cung Cấp","Tên Nhà Cung Cấp","Email"};
		model.addAttribute("tableHead", tableHead);
		model.addAttribute("title", "Nhà Cung Cấp");
		return "/admin/supplier_manager";
	}
	
	//User Control
	
	@GetMapping("/account")
	public String accountManager(Model model,Principal principal, HttpSession session) {
		if(principal != null) {
			User user = userService.findByUserName(principal.getName());
			session.setAttribute("loggedAdmin", user);
		}
		model.addAttribute("list", userService.getAllUsers());
		model.addAttribute("title", "Người Dùng");
		return "/admin/account_manager";
	}
	
	
	@GetMapping("/account/add")
	public String addAccount(Model model,Principal principal, HttpSession session) {
		if(principal != null) {
			User user = userService.findByUserName(principal.getName());
			session.setAttribute("loggedAdmin", user);
		}
		model.addAttribute("title", "Người Dùng");
		model.addAttribute("userDTO", new UserDTO());
		return "/admin/account_add";
	}
	
	@PostMapping("/account/add")
	public String addAccountPost(Model model,@Valid@ModelAttribute("userDTO") UserDTO userDTO, Errors errror) {
		if(errror.hasErrors()) {
			return "/admin/account_add";
		}else {
			
			Customer customer = new Customer();
			customer.setFullName(userDTO.getFullName());
			customer.setPhoneNumber(userDTO.getPhoneNumber());
			customer.setEmail(userDTO.getEmail());
			customer.setAddress(userDTO.getAddress());
			String encodedPassword = new BCryptPasswordEncoder().encode(userDTO.getPassWord());
			Set<UserRole> authorities = new HashSet<UserRole>();
			User user = new User();
			user.setUserName(userDTO.getUserName());
			user.setPassWord(encodedPassword);
			user.setEnabled(userDTO.getEnabled().equalsIgnoreCase("1") ? true : false);
			for(String role : userDTO.getRole()) {
				UserRole userRole = new UserRole();
				userRole.setUser(user);
				userRole.setRole(role);
				authorities.add(userRole);
			}
			
			user.setListRole(authorities);
			try {
				userService.addUser(user);
				int customerID = userService.addCustomer(customer);
				User userInDB = userService.findByUserName(user.getUserName());
				userInDB.setCustomer(userService.findByCustomerID(customerID));
				userService.updateUser(userInDB);
			} catch (Exception e) {
				// TODO: handle exception
				model.addAttribute("msgError","Tên Tài Khoản bị trùng với một Người Dùng đã đăng ký. Hãy chọn Tên Tài Khoản khác!");
				return "/admin/error";
			}
		
			return "redirect:/admin/account";
		}
	}
	
	@GetMapping("/account/delete")
	public String deleteAccount(Model model, @RequestParam("username") String username) {
		try {
			userService.deleteUser(username);
		}catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("msgError","Người Dùng này đã đặt hàng nên không thể xoá. Hãy xoá tất cả các Đơn Hàng của Người Dùng này trước!");
			return "/admin/error";
		}
		
		return "redirect:/admin/account";
	}
	
	@GetMapping("/account/edit")
	public String editAccount(Model model,Principal principal, HttpSession session, @RequestParam("username") String username) {
		if(principal != null) {
			User user = userService.findByUserName(principal.getName());
			session.setAttribute("loggedAdmin", user);
		}
		model.addAttribute("title", "Người Dùng");
		model.addAttribute("user", userService.findByUserName(username));
		model.addAttribute("userDTO", new UserDTO());
		return "/admin/account_edit";
	}
	
	@PostMapping("/account/edit")
	public String editAccountPost(HttpSession session,@Valid @ModelAttribute("userDTO") UserDTO userDTO, Errors error) {
		if(error.hasErrors()) {
			
			return "/admin/account_edit";
		}else {
			
			User user = userService.findByUserName(userDTO.getUserName());
			Customer customer = user.getCustomer();
			customer.setFullName(userDTO.getFullName());
			customer.setPhoneNumber(userDTO.getPhoneNumber());
			customer.setEmail(userDTO.getEmail());
			customer.setAddress(userDTO.getAddress());
			
			if(!userDTO.getEditPassword().isBlank()) {
				String encodedPassword = new BCryptPasswordEncoder().encode(userDTO.getEditPassword());
				user.setPassWord(encodedPassword);
			}
			Set<UserRole> authorities = new HashSet<UserRole>();
			user.setEnabled(userDTO.getEnabled().equalsIgnoreCase("1") ? true : false);
			for(String role: userDTO.getRole()) {
				UserRole userRole = new UserRole();
				userRole.setUser(user);
				userRole.setRole(role);
				authorities.add(userRole);
			}
			
			user.setListRole(authorities);
			
			userService.editUser(user);
			return "redirect:/admin/account";
		}
	}
	
	@GetMapping("/account/search")
	public String searchAccount(Model model, @RequestParam("input") String input) {
		model.addAttribute("list", userService.searchUser(input));
		model.addAttribute("title", "Người Dùng");
		return "/admin/account_manager";
	}
	
}
