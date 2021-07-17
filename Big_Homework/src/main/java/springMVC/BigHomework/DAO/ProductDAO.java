package springMVC.BigHomework.DAO;

import java.util.List;

import springMVC.BigHomework.DTO.ProductDTO;
import springMVC.BigHomework.Entity.Product;

public interface ProductDAO {
	public List<Product> getAllProduct();
	public List<Object> getAllProductByCategory(int categoryID, int pageID, int nextRow);
	public List<Object> getProductByNumber(int pageID, int nextRow);
	public List<Product> getFeatureItems(int number);
	public List<Object> getAllProductBySupplier(int supplierID, int pageID, int nextRow);
	public List<Object> getAllProductByCategorySupplier(int categoryID, int supplierID, int pageID, int nextRow);
	public Product getProductByID(int productID);
	public List<Object> searchProduct(String input, int pageID, int nextRow);
	public int addProduct(Product product);
	public boolean editProduct(Product product);
	public boolean deleteProduct(int productID);
	public List<Product> searchProductDB(String input);
}
