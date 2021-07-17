package springMVC.BigHomework.Entity;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Products")
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int productID;
	@Column(columnDefinition = "nvarchar(255)")
	private String productName;
	private int quantityInStock;
	private int unitPrice;
	@Column(name = "imageName", columnDefinition = "varchar(255)")
	@ElementCollection(fetch = FetchType.EAGER)
	@JoinTable(name = "Images", joinColumns = @JoinColumn(name = "productID"))
	private List<String> listImages;
	@Column(columnDefinition = "nvarchar(500)")
	private String description;
	private boolean discontinued;
	@ManyToOne
	@JoinColumn(name = "categoryID")
	private Category category;
	@ManyToOne
	@JoinColumn(name = "supplierID")
	private Supplier supplier;
	public Product() {
		
	}
	public Product(int productID, String productName, int quantityInStock, int unitPrice,
			String description, boolean discontinued, Category category, Supplier supplier) {
		this.productID = productID;
		this.productName = productName;
		this.quantityInStock = quantityInStock;
		this.unitPrice = unitPrice;
		this.description = description;
		this.discontinued = discontinued;
		this.category = category;
		this.supplier = supplier;
	}
	public int getProductID() {
		return productID;
	}
	public void setProductID(int productID) {
		this.productID = productID;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getQuantityInStock() {
		return quantityInStock;
	}
	public void setQuantityInStock(int quantityInStock) {
		this.quantityInStock = quantityInStock;
	}
	public int getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}
	public List<String> getListImages() {
		return listImages;
	}
	public void setListImages(List<String> listImages) {
		this.listImages = listImages;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public boolean isDiscontinued() {
		return discontinued;
	}
	public void setDiscontinued(boolean discontinued) {
		this.discontinued = discontinued;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public Supplier getSupplier() {
		return supplier;
	}
	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}
	@Override
	public String toString() {
		return "Product [productID=" + productID + ", productName=" + productName + ", quantityInStock="
				+ quantityInStock + ", unitPrice=" + unitPrice + ", listImages=" + listImages + ", description="
				+ description + ", discontinued=" + discontinued + ", category=" + category + ", supplier=" + supplier
				+ "]";
	}
	
	
	
	
	
	
}
