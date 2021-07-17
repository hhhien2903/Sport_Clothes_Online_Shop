package springMVC.BigHomework.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import springMVC.BigHomework.DAO.CategoryDAO;
import springMVC.BigHomework.DAO.SupplierDAO;
import springMVC.BigHomework.Entity.Category;
import springMVC.BigHomework.Entity.Supplier;
import springMVC.BigHomework.Service.BaseService;
@Service
public class BaseServiceImpl implements BaseService{
	@Autowired
	private CategoryDAO categoryDao;
	@Autowired
	private SupplierDAO supplierDao;
	@Override
	@Transactional
	public List<Category> getCategoryMenu() {
		// TODO Auto-generated method stub
		return categoryDao.getAllCategory();
	}

	@Override
	@Transactional
	public List<Supplier> getSupplierMenu() {
		return supplierDao.getAllSupplier();
	}

}
