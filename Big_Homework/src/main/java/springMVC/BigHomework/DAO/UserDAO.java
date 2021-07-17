package springMVC.BigHomework.DAO;

import java.util.List;

import springMVC.BigHomework.Entity.Customer;
import springMVC.BigHomework.Entity.User;

public interface UserDAO {
	public User findByUserName(String username);
	public Customer findByCustomerID(int id);
	public int addCustomer(Customer customer);
	public String addUser(User user);
	public List<User> getOnlyUserRole();
	public List<User> getAllUsers();
	public boolean editUser(User user);
	public boolean updateUser(User user);
	public boolean deleteUser(String username);
	public List<User> searchUser(String input);
	public List<Customer> getAllCustomer();
}
