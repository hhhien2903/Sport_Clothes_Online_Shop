package springMVC.BigHomework.DTO;

import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

public class UserDTO {
	@Pattern(regexp = "^[\\p{L} .'-]+$",message = "Tên không được rỗng và không chứa ký tự số!<br/><br/>")
	private String fullName;
	@NotNull(message = "Số điện thoại không được rỗng!</br>")
	@Pattern(regexp = "((84|0)[3|5|7|8|9])+([0-9]{8})",message = "Số điện thoại phải gồm 10 chữ số!<br/><br/>")
	private String phoneNumber;
	@Email(message = "Email không đúng định dạng!<br/><br/>")
	@NotBlank(message = "Email không được rỗng!<br/><br/>")
	private String email;
	private String address;
	@NotBlank(message = "Tên tài khoản không được rỗng!<br/><br/>")
	private String userName;
	@NotBlank(message = "Mật khẩu không được rỗng!<br/><br/>")
    private String passWord;
	@NotBlank(message = "Vui lòng chọn Tình Trạng Tài Khoản! <br/>")
    private String enabled;
	@NotEmpty(message = "Vui lòng chọn ít nhất một Loại Tài Khoản!")
    private List<String> role;
    private String editPassword;
	public UserDTO() {
	}
	
	public String getEditPassword() {
		return editPassword;
	}

	public void setEditPassword(String editPassword) {
		this.editPassword = editPassword;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	public UserDTO(String fullName, String phoneNumber, String email, String address, String userName,
			String passWord) {
		super();
		this.fullName = fullName;
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.address = address;
		this.userName = userName;
		this.passWord = passWord;
	}
	
//	public String getRole() {
//		return role;
//	}
//
//	public void setRole(String role) {
//		this.role = role;
//	}
	

	public String getFullName() {
		return fullName;
	}
	public List<String> getRole() {
		return role;
	}

	public void setRole(List<String> role) {
		this.role = role;
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
    
    
}
