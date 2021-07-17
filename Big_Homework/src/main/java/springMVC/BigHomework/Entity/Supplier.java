package springMVC.BigHomework.Entity;

import java.util.List;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
@Entity
@Table(name = "Suppliers")
public class Supplier {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int supplierID;
	@NotBlank(message = "Tên Nhà Cung Cấp không được rỗng!<br/>")
	private String supplierName;
	@Email(message = "Email không đúng định dạng!<br/>")
	@NotBlank(message = "Email không được rỗng!<br/>")
	private String supplierEmail;
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "supplier")
	private Set<Product> listProducts;
	
	public Supplier() {
		
	}
	
	public Supplier(int supplierID, String supplierName, String supplierEmail) {
		super();
		this.supplierID = supplierID;
		this.supplierName = supplierName;
		this.supplierEmail = supplierEmail;
	}
	public int getSupplierID() {
		return supplierID;
	}
	public void setSupplierID(int supplierID) {
		this.supplierID = supplierID;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public String getSupplierEmail() {
		return supplierEmail;
	}
	public void setSupplierEmail(String supplierEmail) {
		this.supplierEmail = supplierEmail;
	}
	public Set<Product> getListProducts() {
		return listProducts;
	}
	public void setListProducts(Set<Product> listProducts) {
		this.listProducts = listProducts;
	}
	
	
	
}
