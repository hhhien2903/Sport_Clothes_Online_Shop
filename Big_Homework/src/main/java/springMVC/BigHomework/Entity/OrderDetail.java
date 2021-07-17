package springMVC.BigHomework.Entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@IdClass(OrderDetail_PK.class) //Tạo hai khoá chính trong 1 bảng
@Table(name = "OrderDetails")
public class OrderDetail {
	@Id
	@ManyToOne
	@JoinColumn(name = "orderID")
	private Order order;
	@Id
	@ManyToOne
	@JoinColumn(name = "productID")
	private Product product;
	private int quantity;
	private int unitPrice;
	
	public OrderDetail() {
		
	}
	public OrderDetail(Order order, Product product, int quantity, int unitPrice) {
		super();
		this.order = order;
		this.product = product;
		this.quantity = quantity;
		this.unitPrice = unitPrice;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}
	@Override
	public String toString() {
		return "OrderDetail [order=" + order + ", product=" + product + ", quantity=" + quantity + ", unitPrice="
				+ unitPrice + "]";
	}
		
	
}
