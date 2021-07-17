package springMVC.BigHomework.DAO;

import java.util.List;

import springMVC.BigHomework.Entity.Category;

public interface CategoryDAO {
	public List<Category> getAllCategory();
	public Category getCategoryByID(int categoryID);
	public int addCategory(Category category);
	public boolean deleteCategory(int categoryID);
	public boolean editCategory(Category category);
	public List<Category> searchCategory(String input);
}

