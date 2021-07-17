package springMVC.BigHomework.DAO.Impl;


import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import springMVC.BigHomework.DAO.OrderDAO;
import springMVC.BigHomework.Entity.Order;
import springMVC.BigHomework.Entity.OrderDetail;
import springMVC.BigHomework.Entity.Product;

@Repository
public class OrderDAOImpl implements OrderDAO {
	
	@Autowired
    private SessionFactory sessionFactory;

	@Override
	public int addOrder(Order order) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		for(OrderDetail orderDetail: order.getListOrderDetails()) {
			Product product = session.find(Product.class, orderDetail.getProduct().getProductID());
			product.setQuantityInStock(product.getQuantityInStock() - orderDetail.getQuantity());
			session.saveOrUpdate(product);
		}
		return (Integer) session.save(order);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> getAllOrderByCustomerID(int customerID) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<Order> listOrders = session.createQuery("from Order O WHERE O.customer.customerID = :customerID AND O.orderStatus != :orderStatus")
				.setParameter("customerID", customerID)
				.setParameter("orderStatus", "Hoàn Thành")
				.list();
		return listOrders;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Order> getOrderHistoryByCustomerID(int customerID) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<Order> listOrders = session.createQuery("from Order O WHERE O.customer.customerID = :customerID AND O.orderStatus = :orderStatus")
				.setParameter("customerID", customerID)
				.setParameter("orderStatus", "Hoàn Thành")
				.list();
		return listOrders;
	}

	@Override
	public Order getOrderByID(int orderID) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.find(Order.class, orderID);
	}

	@Override
	public boolean deleteOrder(int orderID) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Order order = session.find(Order.class, orderID);
		for(OrderDetail orderDetail: order.getListOrderDetails()) {
			Product product = session.find(Product.class, orderDetail.getProduct().getProductID());
			product.setQuantityInStock(product.getQuantityInStock() + orderDetail.getQuantity());
			session.saveOrUpdate(product);
		}
		session.remove(order);
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> getAllOrders() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<Order> listOrders = session.createQuery("from Order O")
				.list();
		return listOrders;
	}

	@Override
	public boolean editOrder(Order order) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		try {
			session.saveOrUpdate(order);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> searchOrder(String input) {
		// TODO Auto-generated method stub
		List<Object> listQuery;
		Session session = sessionFactory.getCurrentSession();
		
		listQuery = session.createSQLQuery("SELECT O.orderID FROM Orders O "
				+ "WHERE O.orderID LIKE N'%"+input+"%' OR O.ordererName LIKE N'%"+input+"%' "
				+ "OR O.ordererPhoneNumber LIKE N'%"+input+"%' OR O.receiverName LIKE N'%"+input+"%' "
				+ "OR O.receiverPhoneNumber LIKE N'%"+input+"%' OR O.receiverAddress LIKE N'%"+input+"%' "
				+ "OR O.customerID LIKE N'%"+input+"%' "
				+ "OR O.orderStatus LIKE N'%"+input+"%' "
				+ "OR convert(varchar,O.orderDate,103) LIKE N'%"+input+"%'")
				.list();
		
		List<Order> list = new ArrayList<Order>();
		for(Object obj: listQuery) {
			Order order = session.find(Order.class,Integer.parseInt(obj.toString()));
			list.add(order);
		}
		return list;
	}
	


}
