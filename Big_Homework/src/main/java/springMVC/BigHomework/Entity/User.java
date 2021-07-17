package springMVC.BigHomework.Entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Users")
public class User {
	@Id
    private String userName;
    private String passWord;
    private Boolean enabled;
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "user", cascade = {CascadeType.ALL})
    private Set<UserRole> listRole;
    @OneToOne
    @JoinColumn(name = "customerID", unique = true)
    private Customer customer;
    
	public User() {
		super();
	}

	public User(String userName, String passWord, Boolean enabled, Set<UserRole> listRole, Customer customer) {
		super();
		this.userName = userName;
		this.passWord = passWord;
		this.enabled = enabled;
		this.listRole = listRole;
		this.customer = customer;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public Set<UserRole> getListRole() {
		return listRole;
	}

	public void setListRole(Set<UserRole> listRole) {
		this.listRole = listRole;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
    
	
    
    
}
