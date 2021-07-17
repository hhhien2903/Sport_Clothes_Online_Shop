package springMVC.BigHomework.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import springMVC.BigHomework.DAO.UserDAO;
import springMVC.BigHomework.Entity.Customer;
import springMVC.BigHomework.Entity.User;
import springMVC.BigHomework.Service.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDAO userDAO;
	@Override
	@Transactional
	public User findByUserName(String username) {
		// TODO Auto-generated method stub
		return userDAO.findByUserName(username);
	}

	@Override
	@Transactional
	public Customer findByCustomerID(int id) {
		// TODO Auto-generated method stub
		return userDAO.findByCustomerID(id);
	}

	@Override
	@Transactional
	public String addUser(User user) {
		// TODO Auto-generated method stub
		return userDAO.addUser(user);
	}

	@Override
	@Transactional
	public int addCustomer(Customer customer) {
		// TODO Auto-generated method stub
		return userDAO.addCustomer(customer);
	}

	@Override
	@Transactional
	public List<User> getOnlyUserRole() {
		// TODO Auto-generated method stub
		return userDAO.getOnlyUserRole();
	}

	@Override
	@Transactional
	public List<User> getAllUsers() {
		// TODO Auto-generated method stub
		return userDAO.getAllUsers();
	}

	@Override
	@Transactional
	public boolean editUser(User user) {
		// TODO Auto-generated method stub
		return userDAO.editUser(user);
	}

	@Override
	@Transactional
	public boolean deleteUser(String username) {
		// TODO Auto-generated method stub
		return userDAO.deleteUser(username);
	}

	@Override
	@Transactional
	public List<User> searchUser(String input) {
		// TODO Auto-generated method stub
		return userDAO.searchUser(input);
	}

	@Override
	@Transactional
	public boolean updateUser(User user) {
		// TODO Auto-generated method stub
		return userDAO.updateUser(user);
	}

	@Override
	@Transactional
	public List<Customer> getAllCustomer() {
		// TODO Auto-generated method stub
		return userDAO.getAllCustomer();
	}
	
	

}
