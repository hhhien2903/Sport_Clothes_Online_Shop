package springMVC.BigHomework.DAO.Impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import springMVC.BigHomework.DAO.CategoryDAO;
import springMVC.BigHomework.Entity.Category;

@Repository
public class CategoryDAOImpl implements CategoryDAO{
	@Autowired
    private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Category> getAllCategory() {
		Session session = sessionFactory.getCurrentSession();
		List<Category> listCategories = session.createQuery("from Category").list();
		// TODO Auto-generated method stub
		return listCategories;
	}

	@Override
	public Category getCategoryByID(int categoryID) {
		Session session = sessionFactory.getCurrentSession();
		Category category = session.find(Category.class, categoryID);
		return category;
	}

	@Override
	public int addCategory(Category category) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return (Integer) session.save(category);
	}

	@Override
	public boolean deleteCategory(int categoryID) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		try {
			session.remove(session.find(Category.class, categoryID));
			return true;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
		
	}

	@Override
	public boolean editCategory(Category category) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		try {
			session.saveOrUpdate(category);
			return true;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Category> searchCategory(String input) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<Object> listQuery = session.createSQLQuery("SELECT C.categoryID from Categories C"
				+ " WHERE C.categoryID LIKE N'%"+input+"%' OR C.categoryName LIKE N'%"+input+"%'")
				.list();
		List<Category> listCategories = new ArrayList<Category>();
		for(Object obj: listQuery) {
			Category category = session.find(Category.class, Integer.parseInt(obj.toString()));
			
			listCategories.add(category);
		}
		return listCategories;
	}

}
