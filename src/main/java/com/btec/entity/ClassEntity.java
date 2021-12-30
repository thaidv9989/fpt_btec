package com.btec.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "class")
public class ClassEntity extends BaseEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long classId;
	
	@Column(name = "classname")
	private String className;
	
	@Column(name = "password")
	private String password;
	
	@ManyToOne
    @JoinColumn(name = "subjectId")
    private SubjectEntity subject;
	
	@ManyToOne
    @JoinColumn(name = "contentId")
    private ContentEntity content;
	
	@ManyToMany(mappedBy = "classuser")
    private List<UserEntity> userclass = new ArrayList<>();
	
	@OneToMany(mappedBy = "classs")
	private List<AsmEntity> asms = new ArrayList<>();

	public List<UserEntity> getUserclass() {
		return userclass;
	}

	public void setUserclass(List<UserEntity> userclass) {
		this.userclass = userclass;
	}

	public List<AsmEntity> getAsms() {
		return asms;
	}

	public void setAsms(List<AsmEntity> asms) {
		this.asms = asms;
	}

	public SubjectEntity getSubject() {
		return subject;
	}

	public void setSubject(SubjectEntity subject) {
		this.subject = subject;
	}

	public ContentEntity getContent() {
		return content;
	}

	public void setContent(ContentEntity content) {
		this.content = content;
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

	public Long getClassId() {
		return classId;
	}
	
	
}
