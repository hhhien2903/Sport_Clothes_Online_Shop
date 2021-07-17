package springMVC.BigHomework.Service;

import java.util.List;

import springMVC.BigHomework.Entity.Category;
import springMVC.BigHomework.Entity.Supplier;

public interface BaseService {
	public List<Category> getCategoryMenu();
	public List<Supplier> getSupplierMenu();
}
