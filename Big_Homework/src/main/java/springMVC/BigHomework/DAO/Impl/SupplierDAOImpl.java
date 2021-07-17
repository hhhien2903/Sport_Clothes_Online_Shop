package springMVC.BigHomework.DAO.Impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import springMVC.BigHomework.DAO.SupplierDAO;
import springMVC.BigHomework.Entity.Category;
import springMVC.BigHomework.Entity.Supplier;
@Repository
public class SupplierDAOImpl implements SupplierDAO{
	@Autowired
    private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Supplier> getAllSupplier() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<Supplier> listSuppliers = session.createQuery("from Supplier").list();
		// TODO Auto-generated method stub
		return listSuppliers;
	}

	@Override
	public Supplier getSupplierByID(int supplierID) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Supplier supplier = session.find(Supplier.class, supplierID);
		return supplier;
	}

	@Override
	public int addSupplier(Supplier supplier) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return (Integer) session.save(supplier);
	}

	@Override
	public boolean deleteSupplier(int supplierID) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		try {
			session.remove(session.find(Supplier.class, supplierID));
			return true;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean editSupplier(Supplier supplier) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		try {
			session.saveOrUpdate(supplier);
			return true;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Supplier> searchSupplier(String input) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<Object> listQuery = session.createSQLQuery("SELECT S.supplierID from Suppliers S"
				+ " WHERE S.supplierID LIKE N'%"+input+"%' OR S.supplierName LIKE N'%"+input+"%' OR S.supplierEmail LIKE N'%"+input+"%'")
				.list();
		List<Supplier> listSuppliers = new ArrayList<Supplier>();
		for(Object obj: listQuery) {
			Supplier supplier = session.find(Supplier.class, Integer.parseInt(obj.toString()));
			listSuppliers.add(supplier);
		}
		return listSuppliers;
	}

}
