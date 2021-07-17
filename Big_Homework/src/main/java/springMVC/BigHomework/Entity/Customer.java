package springMVC.BigHomework.Entity;

import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Customers")
public class Customer {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int customerID;
	@Column(columnDefinition = "nvarchar(100)")
	private String fullName;
	@Column(nullable = true, columnDefinition = "varchar(12)")
	private String phoneNumber;
	@Column(columnDefinition = "varchar(100)")
	private String email;
	@Column(columnDefinition = "nvarchar(255)")
	private String address;
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "customer")
	private Set<Order> listOrders;
	
	public Customer() {
		
	}
	public Customer(int customerID, String fullName, String phoneNumber, String email, String address) {
		super();
		this.customerID = customerID;
		this.fullName = fullName;
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.address = address;
	}
	public int getCustomerID() {
		return customerID;
	}
	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Set<Order> getListOrders() {
		return listOrders;
	}
	public void setListOrders(Set<Order> listOrders) {
		this.listOrders = listOrders;
	}
	
}
