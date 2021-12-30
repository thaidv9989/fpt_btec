package com.btec.entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "subasm")
public class SubasmEntity extends BaseEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long subasmId;
	
	@Column(name = "subFile")
	private String subFile;
	
	@Column(name = "grade")
	private Integer grade;
	
	@Column(name = "subStatus")
	private Integer subStatus;
	
	@Column(name = "comment" , columnDefinition = "TEXT")
	private String comment;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "asmId")
    private AsmEntity asm;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "username")
    private UserEntity user;
	
	public UserEntity getUser() {
		return user;
	}

	public void setUser(UserEntity user) {
		this.user = user;
	}

	public String getSubFile() {
		return subFile;
	}

	public void setSubFile(String subFile) {
		this.subFile = subFile;
	}

	public Integer getGrade() {
		return grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	public Integer getSubStatus() {
		return subStatus;
	}

	public void setSubStatus(Integer subStatus) {
		this.subStatus = subStatus;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Long getSubasmId() {
		return subasmId;
	}

	public AsmEntity getAsm() {
		return asm;
	}

	public void setAsm(AsmEntity asm) {
		this.asm = asm;
	}

	public void setSubasmId(Long subasmId) {
		this.subasmId = subasmId;
	}

	
}
