package com.btec.dto;

public class ClassDTO extends AbstractDTO<ClassDTO> {
	@Override
	public String toString() {
		return "ClassDTO [classId=" + classId + ", className=" + className + ", password=" + password + ", contentId="
				+ contentId + ", username=" + username + ", subjectId=" + subjectId + "]";
	}
	private Long classId;
	private String className;
	private String password;
	private Long contentId;
	private String username;
	private String oldusername;
	public String getOldusername() {
		return oldusername;
	}
	public void setOldusername(String oldusername) {
		this.oldusername = oldusername;
	}
	private Long subjectId;
	
	
	public Long getClassId() {
		return classId;
	}
	public void setClassId(Long classId) {
		this.classId = classId;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Long getContentId() {
		return contentId;
	}
	public void setContentId(Long contentId) {
		this.contentId = contentId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Long getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(Long subjectId) {
		this.subjectId = subjectId;
	}
	
}
