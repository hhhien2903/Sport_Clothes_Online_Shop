package springMVC.BigHomework.DAO.Impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import springMVC.BigHomework.DAO.UserDAO;
import springMVC.BigHomework.DTO.UserDTO;
import springMVC.BigHomework.Entity.Customer;
import springMVC.BigHomework.Entity.Product;
import springMVC.BigHomework.Entity.User;
@Repository
public class UserDAOImpl implements UserDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public User findByUserName(String username) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
        List<User> users = session.createQuery("from User U where U.userName = :username")
                .setParameter("username", username)
                .list();
        if(users.size() > 0){
            return users.get(0);
        }else{
            return null;
        }
	}

	@Override
	public Customer findByCustomerID(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Customer customer = session.find(Customer.class, id);
		return customer;
	}
	
	

	@Override
	public String addUser(User user) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String username = (String) session.save(user);
		return username;
	}

	@Override
	public int addCustomer(Customer customer) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Integer id = (Integer) session.save(customer);
		return id;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getOnlyUserRole() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<Object[]> listQuery = session.createSQLQuery("SELECT U.userName,U.passWord,U.enabled,U.customerID FROM Users U JOIN UserRoles UR ON U.userName = UR.userName WHERE UR.role = 'ROLE_USER'").list();
		List<User> listUsers = new ArrayList<User>();
		for(Object[] obj : listQuery) {
			User user = new User();
			user.setUserName(obj[0].toString());
			user.setPassWord(obj[1].toString());
			user.setEnabled(obj[2].toString().equalsIgnoreCase("true") ? true : false);
			user.setCustomer(session.find(Customer.class, Integer.parseInt(obj[3].toString())));
			listUsers.add(user);
		}
		return listUsers;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getAllUsers() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<User> listUsers = session.createQuery("FROM User U").list();
		return listUsers;
	}

	@Override
	public boolean editUser(User user) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		try {
			Customer customer = user.getCustomer();
			session.saveOrUpdate(customer);
			Query q = session.createQuery("DELETE FROM UserRole UR WHERE UR.user.userName = '"+user.getUserName()+"'");
			q.executeUpdate();
			session.saveOrUpdate(user);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean deleteUser(String username) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		User user = session.find(User.class, username);
		try {
			session.delete(user.getCustomer());
			session.delete(user);
			return true;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> searchUser(String input) {
		// TODO Auto-generated method stub
		List<Object> listQuery;
		Session session = sessionFactory.getCurrentSession();
		if(input.equalsIgnoreCase("Hoạt Động")) {
			listQuery = session.createSQLQuery("SELECT DISTINCT U.userName FROM Users U"
					+ " WHERE U.enabled = 1")
					.list();
		}else if(input.equalsIgnoreCase("Ngừng Hoạt Động")) {
			listQuery = session.createSQLQuery("SELECT DISTINCT U.userName FROM Users U"
					+ " WHERE U.enabled = 0")
					.list();
		}else {
			listQuery = session.createSQLQuery("SELECT DISTINCT U.userName FROM Users U JOIN"
					+ " UserRoles UR ON U.userName = UR.userName JOIN"
					+ " Customers C ON U.customerID = C.customerID WHERE C.customerID LIKE N'%"+input+"%'"
					+ " OR C.fullName LIKE N'%"+input+"%'"
					+ " OR C.phoneNumber LIKE '%"+input+"%' OR C.email LIKE N'%"+input+"%' OR C.address LIKE N'%"+input+"%'"
					+ " OR U.userName LIKE '%"+input+"%' OR UR.role LIKE '%"+input+"%'")
					.list();
		}
		List<User> list = new ArrayList<User>();
		for(Object obj: listQuery) {
			User user = session.find(User.class,obj.toString());
			list.add(user);
		}
		return list;
	}

	@Override
	public boolean updateUser(User user) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(user);
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Customer> getAllCustomer() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<Customer> listCustomers = session.createQuery("from Customer C").list();
		return listCustomers;
	}

	
}
