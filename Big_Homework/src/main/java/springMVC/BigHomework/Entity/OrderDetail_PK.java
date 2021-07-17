package springMVC.BigHomework.Entity;

import java.io.Serializable;

import javax.persistence.Embeddable;

@Embeddable
public class OrderDetail_PK implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2353290899175093330L;
	private int order;
	private int product;
	
	public OrderDetail_PK() {
		
	}

	public OrderDetail_PK(int order, int product) {
		super();
		this.order = order;
		this.product = product;
	}

	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	public int getProduct() {
		return product;
	}

	public void setProduct(int product) {
		this.product = product;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + order;
		result = prime * result + product;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrderDetail_PK other = (OrderDetail_PK) obj;
		if (order != other.order)
			return false;
		if (product != other.product)
			return false;
		return true;
	}
	
	
}
