package springMVC.BigHomework.Entity;

import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
@Entity
@Table(name = "Orders")
public class Order {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int orderID;
	@Column(columnDefinition = "date")
	private Date orderDate;
	
	@Column(columnDefinition = "nvarchar(100)")
	@Pattern(regexp = "^[\\p{L} .'-]+$",message = "Tên phải đúng định dạng và không được rỗng!<br/><br/>")
	private String ordererName;
	
	@Column(columnDefinition = "varchar(12)")
	@NotNull(message = "Số điện thoại không được rỗng!</br>")
	@Pattern(regexp = "((84|0)[3|5|7|8|9])+([0-9]{8})",message = "Số điện thoại phải gồm 10 chữ số!<br/><br/>")
	private String ordererPhoneNumber;
	
	
	@Column(columnDefinition = "nvarchar(100)")
	@Pattern(regexp = "^[\\p{L} .'-]+$",message = "Tên phải đúng định dạng và không được rỗng!<br/><br/>")
	private String receiverName;
	
	@Column(columnDefinition = "nvarchar(100)")
	@NotBlank(message = "Địa chỉ không được rỗng!<br/>")
	private String receiverAddress;
	
	@Column(columnDefinition = "varchar(12)")
	@NotNull(message = "Số điện thoại không được rỗng!</br>")
	@Pattern(regexp = "(84|0[3|5|7|8|9])+([0-9]{8})",message = "Số điện thoại phải gồm 10 chữ số!<br/><br/>")
	private String receiverPhoneNumber;
	
	@Column(columnDefinition = "nvarchar(100)")
	private String orderStatus;
	private int orderTotal;
	
	@ManyToOne
	@JoinColumn(name = "customerID")
	private Customer customer;
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "order", cascade = {CascadeType.ALL})
	private Set<OrderDetail> listOrderDetails;
	
	public Order() {
		
	}
	public Order(int orderID, Date orderDate, String ordererName, String ordererPhoneNumber, String receiverName,
			String receiverAddress, String receiverPhoneNumber, String orderStatus, int orderTotal) {
		super();
		this.orderID = orderID;
		this.orderDate = orderDate;
		this.ordererName = ordererName;
		this.ordererPhoneNumber = ordererPhoneNumber;
		this.receiverName = receiverName;
		this.receiverAddress = receiverAddress;
		this.receiverPhoneNumber = receiverPhoneNumber;
		this.orderStatus = orderStatus;
		this.orderTotal = orderTotal;
	}
	
	public int getOrderTotal() {
		return orderTotal;
	}
	public void setOrderTotal(int orderTotal) {
		this.orderTotal = orderTotal;
	}
	public int getOrderID() {
		return orderID;
	}
	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrdererName() {
		return ordererName;
	}
	public void setOrdererName(String ordererName) {
		this.ordererName = ordererName;
	}
	public String getOrdererPhoneNumber() {
		return ordererPhoneNumber;
	}
	public void setOrdererPhoneNumber(String ordererPhoneNumber) {
		this.ordererPhoneNumber = ordererPhoneNumber;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getReceiverAddress() {
		return receiverAddress;
	}
	public void setReceiverAddress(String receiverAddress) {
		this.receiverAddress = receiverAddress;
	}
	public String getReceiverPhoneNumber() {
		return receiverPhoneNumber;
	}
	public void setReceiverPhoneNumber(String receiverPhoneNumber) {
		this.receiverPhoneNumber = receiverPhoneNumber;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Set<OrderDetail> getListOrderDetails() {
		return listOrderDetails;
	}
	public void setListOrderDetails(Set<OrderDetail> listOrderDetails) {
		this.listOrderDetails = listOrderDetails;
	}
	
	
	
	
	
}
