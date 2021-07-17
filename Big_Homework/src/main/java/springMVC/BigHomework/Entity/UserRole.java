package springMVC.BigHomework.Entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "UserRoles", uniqueConstraints = { @UniqueConstraint(columnNames = { "userName", "role" }) })
public class UserRole {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userRoleID;
	@ManyToOne
	@JoinColumn(name = "userName")
	private User user;
	private String role;
	
	public UserRole() {
		
	}
	
	public UserRole(User user, String role) {
		this.user = user;
		this.role = role;
	}
	public int getUserRoleID() {
		return userRoleID;
	}
	public void setUserRoleID(int userRoleID) {
		this.userRoleID = userRoleID;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	
}
