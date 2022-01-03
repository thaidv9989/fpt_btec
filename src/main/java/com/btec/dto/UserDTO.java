package com.btec.dto;

import java.sql.Date;

public class UserDTO extends AbstractDTO<UserDTO> {
	private String username;
	private String password;
	private String fullName;
	private String phoneNumber;
	private String email;
	private Date dob;
	private String gender;
	private String country;
	private Integer userStatus;
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public Integer getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(Integer userStatus) {
		this.userStatus = userStatus;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public Long getRoleId() {
		return RoleId;
	}
	public void setRoleId(Long roleId) {
		RoleId = roleId;
	}
	private Long RoleId;
	
	@Override
	public String toString() {
		return "UserDTO [username=" + username + ", password=" + password + ", fullName=" + fullName + ", phoneNumber="
				+ phoneNumber + ", email=" + email + ", dob=" + dob + ", RoleId=" + RoleId + "]";
	}
}
