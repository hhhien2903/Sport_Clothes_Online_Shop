package springMVC.BigHomework.Service.Impl;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import springMVC.BigHomework.DAO.OrderDAO;
import springMVC.BigHomework.Entity.Order;
import springMVC.BigHomework.Entity.OrderDetail;
import springMVC.BigHomework.Service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDAO orderDAO;
	@Override
	@Transactional
	public int addOrder(Order order) {
		// TODO Auto-generated method stub
		return orderDAO.addOrder(order);
	}
	@Override
	@Transactional
	public List<Order> getAllOrderByCustomerID(int customerID) {
		// TODO Auto-generated method stub
		return orderDAO.getAllOrderByCustomerID(customerID);
	}
	@Override
	@Transactional
	public Order getOrderByID(int orderID) {
		// TODO Auto-generated method stub
		return orderDAO.getOrderByID(orderID);
	}
	@Override
	@Transactional
	public boolean deleteOrder(int orderID) {
		// TODO Auto-generated method stub
		orderDAO.deleteOrder(orderID);
		return true;
	}
	@Override
	@Transactional
	public List<Order> getAllOrders() {
		// TODO Auto-generated method stub
		return orderDAO.getAllOrders();
	}
	@Override
	@Transactional
	public boolean editOrder(Order order) {
		// TODO Auto-generated method stub
		return orderDAO.editOrder(order);
	}
	@Override
	@Transactional
	public List<Order> getOrderHistoryByCustomerID(int customerID) {
		// TODO Auto-generated method stub
		return orderDAO.getOrderHistoryByCustomerID(customerID);
	}
	@Override
	@Transactional
	public List<Order> searchOrder(String input) {
		// TODO Auto-generated method stub
		return orderDAO.searchOrder(input);
	}

}
