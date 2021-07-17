package springMVC.BigHomework.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import springMVC.BigHomework.DAO.ProductDAO;
import springMVC.BigHomework.DTO.ProductDTO;
import springMVC.BigHomework.Entity.Product;
import springMVC.BigHomework.Service.ProductService;
@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDao;
	@Override
	@Transactional
	public List<Product> getAllProduct() {
		// TODO Auto-generated method stub
		return productDao.getAllProduct();
	}

	@Override
	@Transactional
	public List<Object> getProductByNumber(int pageID, int nextRow) {
		// TODO Auto-generated method stub
		return productDao.getProductByNumber(pageID, nextRow);
	}

	@Override
	@Transactional
	public List<Object> getAllProductByCategory(int categoryID, int pageID, int nextRow) {
		// TODO Auto-generated method stub
		return productDao.getAllProductByCategory(categoryID, pageID, nextRow);
	}

	@Override
	@Transactional
	public List<Object> getAllProductBySupplier(int supplierID, int pageID, int nextRow) {
		// TODO Auto-generated method stub
		return productDao.getAllProductBySupplier(supplierID, pageID, nextRow);
	}

	@Override
	@Transactional
	public List<Object> getAllProductByCategorySupplier(int categoryID, int supplierID, int pageID, int nextRow) {
		// TODO Auto-generated method stub
		return productDao.getAllProductByCategorySupplier(categoryID, supplierID, pageID, nextRow);
	}

	@Override
	@Transactional
	public Product getProductByID(int productID) {
		// TODO Auto-generated method stub
		return productDao.getProductByID(productID);
	}

	@Override
	@Transactional
	public List<Product> getFeatureItems(int number) {
		// TODO Auto-generated method stub
		return productDao.getFeatureItems(number);
	}

	@Override
	@Transactional
	public List<Object> searchProduct(String input, int pageID, int nextRow) {
		// TODO Auto-generated method stub
		return productDao.searchProduct(input, pageID, nextRow);
	}

	@Override
	@Transactional
	public int addProduct(Product product) {
		// TODO Auto-generated method stub
		return productDao.addProduct(product);
	}

	@Override
	@Transactional
	public boolean editProduct(Product product) {
		// TODO Auto-generated method stub
		return productDao.editProduct(product);
	}

	@Override
	@Transactional
	public boolean deleteProduct(int productID) {
		// TODO Auto-generated method stub
		return productDao.deleteProduct(productID);
	}

	@Override
	@Transactional
	public List<Product> searchProductDB(String input) {
		// TODO Auto-generated method stub
		return productDao.searchProductDB(input);
	}


	

}
