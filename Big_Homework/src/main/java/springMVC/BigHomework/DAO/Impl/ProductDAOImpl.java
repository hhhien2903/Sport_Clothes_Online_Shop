package springMVC.BigHomework.DAO.Impl;

import java.util.ArrayList;
import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import springMVC.BigHomework.DAO.ProductDAO;
import springMVC.BigHomework.DTO.ProductDTO;
import springMVC.BigHomework.Entity.Product;
import springMVC.BigHomework.Entity.Supplier;
@Repository
public class ProductDAOImpl implements ProductDAO {
	@Autowired
    	private SessionFactory sessionFactory;
	static String MYSQL_DIALECT = "org.hibernate.dialect.MySQL8Dialect";
	static String SQL_SERVER_DIALECT = "org.hibernate.dialect.SQLServer2012Dialect";

	
	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getAllProduct() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<Product> listProducts = session.createQuery("FROM Product P").list();
		return listProducts;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> getProductByNumber(int pageID, int nextRow) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		int offset;
		if(pageID == 1) {
			offset = 0;
		}else {
			offset = (pageID - 1) * 9;
		}
		List<ProductDTO> listProducts = new ArrayList<ProductDTO>();
		List<Object[]> listQuery = session.createSQLQuery
				("SELECT P.productID, max(P.productName) as productName, MAX(unitPrice) as unitPrice, min(P.quantityInStock) as quantityInStock, min(I.imageName) as imageName "
						+ "FROM Products P JOIN Images I ON P.productID = I.productID WHERE  P.discontinued = 0 GROUP BY P.productID")
				.setFirstResult(offset).setMaxResults(nextRow).list();
		for(Object obj[]: listQuery) {
//			ProductDTO dto = new ProductDTO(Integer.parseInt(obj[0].toString()), (obj[1]).toString(), Integer.parseInt(obj[2].toString()),Integer.parseInt(obj[3].toString()), obj[4].toString());
			ProductDTO dto = new ProductDTO();
			dto.setProductID(Integer.parseInt(obj[0].toString()));
			dto.setProductName(obj[1].toString());
			dto.setUnitPrice(obj[2].toString());
			dto.setQuantityInStock(obj[3].toString());
			dto.setImageName(obj[4].toString());
			listProducts.add(dto);
		}
		// TODO Auto-generated method stub
		int count = ((BigInteger) session.createSQLQuery("select count(P.productID) from Products P").uniqueResult()).intValue();
		List<Object> data = new ArrayList<Object>();
		data.add(listProducts);
		data.add(count);
		return data;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> getAllProductByCategory(int categoryID, int pageID, int nextRow) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		int offset;
		if(pageID == 1) {
			offset = 0;
		}else {
			offset = (pageID - 1) * 9;
		}
		List<Product> listProducts = session.createQuery("from Product P WHERE P.category.categoryID = :categoryID AND  P.discontinued = 0")
				.setParameter("categoryID", categoryID)
				.setFirstResult(offset)
				.setMaxResults(nextRow)
				.list();
		int count = ((Long) (session.createQuery("select count(P.productID) from Product P WHERE P.category.categoryID = :categoryID AND  P.discontinued = 0")
				.setParameter("categoryID", categoryID)
				.uniqueResult()))
				.intValue(); 
		List<Object> data = new ArrayList<Object>();
		data.add(listProducts);
		data.add(count);
		return data;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> getAllProductBySupplier(int supplierID, int pageID, int nextRow) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		int offset;
		if(pageID == 1) {
			offset = 0;
		}else {
			offset = (pageID - 1) * 9;
		}
		List<Product> listProducts = session.createQuery("from Product P WHERE P.supplier.supplierID = :supplierID AND  P.discontinued = 0")
				.setParameter("supplierID", supplierID)
				.setFirstResult(offset)
				.setMaxResults(nextRow)
				.list();
		int count = ((Long) (session.createQuery("select count(P.productID) from Product P WHERE P.supplier.supplierID = :supplierID AND P.discontinued = 0")
				.setParameter("supplierID", supplierID)
				.uniqueResult()))
				.intValue(); 
		
		List<Object> data = new ArrayList<Object>();
		data.add(listProducts);
		data.add(count);
		return data;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> getAllProductByCategorySupplier(int categoryID, int supplierID, int pageID, int nextRow) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		int offset;
		if(pageID == 1) {
			offset = 0;
		}else {
			offset = (pageID - 1) * 9;
		}
		List<Product> listProducts = session.createQuery("from Product P WHERE P.category.categoryID = :categoryID AND P.supplier.supplierID = :supplierID AND  P.discontinued = 0")
				.setParameter("categoryID", categoryID)
				.setParameter("supplierID", supplierID)
				.setFirstResult(offset)
				.setMaxResults(nextRow)
				.list();
		
		int count = ((Long) (session.createQuery("select count(P.productID) from Product P WHERE P.category.categoryID = :categoryID AND P.supplier.supplierID = :supplierID AND  P.discontinued = 0")
				.setParameter("categoryID", categoryID)
				.setParameter("supplierID", supplierID)
				.uniqueResult()))
				.intValue(); 
		List<Object> data = new ArrayList<Object>();
		data.add(listProducts);
		data.add(count);
		return data;
	}

	@Override
	public Product getProductByID(int productID) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.find(Product.class, productID);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getFeatureItems(int number) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Dialect dialect = ((SessionFactoryImplementor) sessionFactory).getJdbcServices().getDialect();
		String orderBy = "";
		if (dialect.toString().equalsIgnoreCase(MYSQL_DIALECT)) {
			orderBy = "RAND()";
		}
		if (dialect.toString().equalsIgnoreCase(SQL_SERVER_DIALECT)) {
			orderBy = "NEWID()";
		}
		List<Product> listProducts = session
				.createQuery("FROM Product P WHERE P.discontinued = 0 ORDER BY " + orderBy)
				.setMaxResults(number).list();
		return listProducts;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> searchProduct(String input, int pageID, int nextRow) {
		Session session = sessionFactory.getCurrentSession();
		int offset;
		if(pageID == 1) {
			offset = 0;
		}else {
			offset = (pageID - 1) * 9;
		}
		List<ProductDTO> listProducts = new ArrayList<ProductDTO>();
		List<Object[]> listQuery = session.createSQLQuery
				("SELECT P.productID, max(P.productName) as productName, MAX(unitPrice) as unitPrice,min(P.quantityInStock) as quantityInStock, min(I.imageName) as imageName FROM"
						+ " Products P JOIN Images I ON P.productID = I.productID"
						+ " JOIN Suppliers S ON P.supplierID = S.supplierID WHERE  P.discontinued = 0 AND (P.productName LIKE N'%"+input+"%' OR S.supplierName LIKE N'%"+input+"%') GROUP BY P.productID")
				.setFirstResult(offset).setMaxResults(nextRow).list();
		
		for(Object obj[]: listQuery) {
//			ProductDTO dto = new ProductDTO(Integer.parseInt(obj[0].toString()), (obj[1]).toString(), Integer.parseInt(obj[2].toString()), Integer.parseInt(obj[3].toString()), obj[4].toString());
			ProductDTO dto = new ProductDTO();
			dto.setProductID(Integer.parseInt(obj[0].toString()));
			dto.setProductName(obj[1].toString());
			dto.setUnitPrice(obj[2].toString());
			dto.setQuantityInStock(obj[3].toString());
			dto.setImageName(obj[4].toString());
			listProducts.add(dto);
		}
		// TODO Auto-generated method stub
		int count = ((BigInteger) session.createSQLQuery("SELECT count(P.productID) FROM Products P JOIN Suppliers S ON P.supplierID = S.supplierID WHERE P.discontinued = 0 AND (P.productName LIKE N'%"+input+"%' OR S.supplierName LIKE N'%"+input+"%')").uniqueResult()).intValue();
		List<Object> data = new ArrayList<Object>();
		data.add(listProducts);
		data.add(count);
		return data;
		
	}

	@Override
	public int addProduct(Product product) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return (Integer) session.save(product);
	}

	@Override
	public boolean editProduct(Product product) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		try {
			session.saveOrUpdate(product);
			return true;
		}catch (Exception e) {
			// TODO: handle exception
			return false;
		} 
	}

	@Override
	public boolean deleteProduct(int productID) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		try {
			session.delete(session.find(Product.class, productID));
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> searchProductDB(String input) {
		// TODO Auto-generated method stub
		List<Object> listQuery;
		Session session = sessionFactory.getCurrentSession();
		if(input.equalsIgnoreCase("Ngừng Bán")) {
			listQuery = session.createSQLQuery("SELECT P.productID from Products P"
					+ " WHERE P.discontinued = 1")
					.list();
		}else if(input.equalsIgnoreCase("Còn Bán")) {
			listQuery = session.createSQLQuery("SELECT P.productID from Products P"
					+ " WHERE P.discontinued = 0")
					.list();
		}else {
			listQuery = session.createSQLQuery("SELECT P.productID from Products P JOIN Categories C ON P.categoryID = C.categoryID JOIN Suppliers S ON P.supplierID = S.supplierID"
				+ " WHERE P.productID LIKE N'%"+input+"%' OR P.productName LIKE N'%"+input+"%' OR C.categoryName LIKE N'%"+input+"%' OR S.supplierName LIKE N'%"+input+"%'")
				.list();
		}
		List<Product> list = new ArrayList<Product>();
		for(Object obj: listQuery) {
			Product product = session.find(Product.class,Integer.parseInt(obj.toString()));
			list.add(product);
		}
		return list;
	}



	
	
}
