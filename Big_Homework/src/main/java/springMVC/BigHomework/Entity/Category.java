package springMVC.BigHomework.Entity;

import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name = "Categories")
public class Category {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int categoryID;
	@Column(columnDefinition = "nvarchar(100)")
	@NotBlank(message = "Tên danh mục không được rỗng! <br/>")
	private String categoryName;
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "category")
	private Set<Product> listProducts;
	
	public Category() {
		
	}
	public Category(int categoryID, String categoryName) {
		super();
		this.categoryID = categoryID;
		this.categoryName = categoryName;
	}
	public int getCategoryID() {
		return categoryID;
	}
	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public Set<Product> getListProducts() {
		return listProducts;
	}
	public void setListProducts(Set<Product> listProducts) {
		this.listProducts = listProducts;
	}
	
	
	
}
