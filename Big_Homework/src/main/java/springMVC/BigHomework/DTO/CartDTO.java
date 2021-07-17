package springMVC.BigHomework.DTO;

import springMVC.BigHomework.Entity.Product;

public class CartDTO {
	private int quantity;
	private Product product;
	
	
	public CartDTO() {
		super();
	}
	
	public CartDTO(int quantity, Product product) {
		super();
		this.quantity = quantity;
		this.product = product;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}

	@Override
	public String toString() {
		return "CartDTO [quantity=" + quantity + ", product=" + product + "]";
	}
	
	
}
