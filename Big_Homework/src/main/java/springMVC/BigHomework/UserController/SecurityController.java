package springMVC.BigHomework.UserController;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import springMVC.BigHomework.DTO.UserDTO;
import springMVC.BigHomework.Entity.Customer;
import springMVC.BigHomework.Entity.User;
import springMVC.BigHomework.Entity.UserRole;
import springMVC.BigHomework.Service.UserService;

@Controller
public class SecurityController {

	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/login-handle")
    public String loginHandle(Principal principal, Authentication authentication) {
		User user = userService.findByUserName(principal.getName());
		if(user.getListRole().size() > 1) {
			return "redirect:/admin/dashboard";
		}else {
			for(UserRole ur: user.getListRole()) {
				if(ur.getRole().equalsIgnoreCase("ROLE_USER")) {
					return "redirect:/user/info";
				}else {
					return "redirect:/admin/dashboard";
				}
			}
		}
		return "redirect:/user-login";
		
    }
	
	@RequestMapping(value = "/user-login", method = RequestMethod.GET)
    public String loginUserForm(Model model,@RequestParam(required=false) boolean error, @RequestParam(required = false) boolean registerSuccessfully) {
		if(error) {
			model.addAttribute("error",error);
		}
		if(registerSuccessfully) {
			model.addAttribute("registerSuccessfully",registerSuccessfully);
		}
        return "login-UserForm";
    }
	
	@RequestMapping(value = "/user/logout")
    public String logout() {
        return "redirect:/user-login";
    }

	
//	@RequestMapping(value = "/admin-login", method = RequestMethod.GET)
//    public String loginAdminForm(Model model, @RequestParam(required=false) boolean error) {
//		if(error) {
//			model.addAttribute("error",error);
//		}
//        return "login-AdminForm";
//    }
//	
//	@RequestMapping(value = "/admin/logout")
//    public String logoutAdmin(HttpSession session) {
//		session.removeAttribute("loggedAdmin");
//        return "redirect:/admin-login";
//    }
	
	
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Model model, @RequestParam(required = false) boolean dupplicateUser) {
		if(dupplicateUser) {
			model.addAttribute("dupplicateUser",true);
		}
		model.addAttribute("user", new UserDTO());
		return "register";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String processRegister(@Valid @ModelAttribute("user") UserDTO userDTO, Errors errors, Model model) {
		if(errors.hasErrors()) {
			return "register";
		}else{
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
		user.setEnabled(true);
		
		UserRole userRole = new UserRole();
		userRole.setUser(user);
		userRole.setRole("ROLE_USER");
		authorities.add(userRole);
		user.setListRole(authorities);
		try {
			userService.addUser(user);
			int customerID = userService.addCustomer(customer);
			User userInDB = userService.findByUserName(user.getUserName());
			userInDB.setCustomer(userService.findByCustomerID(customerID));
			userService.updateUser(userInDB);
		} catch (Exception e) {
			// TODO: handle exception
			return "redirect:/register?dupplicateUser=true";
		}
		return ("redirect:/user-login?registerSuccessfully=true");
		}
	}
	
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied(Principal user) {
	   ModelAndView model = new ModelAndView();
	   if (user != null) {
		   model.addObject("msg", "Xin lỗi " + user.getName() + ". Bạn không có quyền truy cập tài nguyên này!");
	   } else {
		   model.addObject("msg", "Xin lỗi. Bạn không có quyền truy cập tài nguyên này!");
	   }
	   model.setViewName("403");
	   return model;
	}
}
