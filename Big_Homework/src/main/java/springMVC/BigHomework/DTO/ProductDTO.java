package springMVC.BigHomework.DTO;

import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.springframework.web.multipart.MultipartFile;

public class ProductDTO {
	private int productID;
	@NotBlank(message = "Tên Sản Phẩm không được rỗng!<br/>")
	private String productName;
	@Pattern(regexp = "^0$|^[1-9][0-9]*$",message = "Đơn Giá không được rỗng và phải là ký tự số! <br/>")
	private String unitPrice;
	@Pattern(regexp = "^0$|^[1-9][0-9]*$",message = "Số Lượng không được rỗng và phải là ký tự số! <br/>")
	private String quantityInStock;
	private String imageName;
	private List<String> listImage;
	@NotBlank(message = "Vui lòng chọn Danh Mục! <br/>")
	private String category;
	@NotBlank(message = "Vui lòng chọn Nhà Cung Cấp! <br/>")
	private String supplier;
	private String description;
	private int discontinued;
	private List<MultipartFile> files;
	
	public ProductDTO() {
		super();
	}

	


	public List<MultipartFile> getFiles() {
		return files;
	}




	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}




	@Override
	public String toString() {
		return "ProductDTO [productID=" + productID + ", productName=" + productName + ", unitPrice=" + unitPrice
				+ ", quantityInStock=" + quantityInStock + ", imageName=" + imageName + ", listImage=" + listImage
				+ ", category=" + category + ", supplier=" + supplier + ", description=" + description
				+ ", discontinued=" + discontinued + "]";
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


	public String getUnitPrice() {
		return unitPrice;
	}


	public void setUnitPrice(String unitPrice) {
		this.unitPrice = unitPrice;
	}


	public String getQuantityInStock() {
		return quantityInStock;
	}


	public void setQuantityInStock(String quantityInStock) {
		this.quantityInStock = quantityInStock;
	}


	public String getImageName() {
		return imageName;
	}


	public void setImageName(String imageName) {
		this.imageName = imageName;
	}


	public List<String> getListImage() {
		return listImage;
	}


	public void setListImage(List<String> listImage) {
		this.listImage = listImage;
	}


	

	public String getCategory() {
		return category;
	}




	public void setCategory(String category) {
		this.category = category;
	}




	public String getSupplier() {
		return supplier;
	}




	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}




	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public int getDiscontinued() {
		return discontinued;
	}


	public void setDiscontinued(int discontinued) {
		this.discontinued = discontinued;
	}
	
	
	
	
	
	
}
