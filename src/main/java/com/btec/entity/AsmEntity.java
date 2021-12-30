package com.btec.entity;


import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

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

@Entity
@Table(name = "asm")
public class AsmEntity extends BaseEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long asmId;
	
	@Column(name = "asmName")
	private String asmName;
	
	@Column(name = "asmBrief")
	private String asmBrief;
	
	@Column(name = "asmDateDue")
	private Date asmDateDue;
	
	@Column(name = "asmTimeDue")
	private Time asmTimeDue;
	
	@Column(name = "subtype")
	private String subType;
	
	@Column(name = "limitItem")
	private Integer limitItem;
	
	@Column(name = "feedback" , columnDefinition = "TEXT")
	private String feedback;
	
	@OneToMany(mappedBy = "asm")
	private List<SubasmEntity> subasms = new ArrayList<>();
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "classId")
    private ClassEntity classs;
	
	public Date getAsmDateDue() {
		return asmDateDue;
	}

	public void setAsmDateDue(Date asmDateDue) {
		this.asmDateDue = asmDateDue;
	}

	public Time getAsmTimeDue() {
		return asmTimeDue;
	}

	public void setAsmTimeDue(Time asmTimeDue) {
		this.asmTimeDue = asmTimeDue;
	}

	public String getSubType() {
		return subType;
	}

	public void setSubType(String subType) {
		this.subType = subType;
	}

	public ClassEntity getClasss() {
		return classs;
	}

	public void setClasss(ClassEntity classs) {
		this.classs = classs;
	}

	public String getAsmName() {
		return asmName;
	}

	public void setAsmName(String asmName) {
		this.asmName = asmName;
	}

	public String getAsmBrief() {
		return asmBrief;
	}

	public void setAsmBrief(String asmBrief) {
		this.asmBrief = asmBrief;
	}

	public Integer getLimitItem() {
		return limitItem;
	}

	public void setLimitItem(Integer limitItem) {
		this.limitItem = limitItem;
	}

	public String getFeedback() {
		return feedback;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

	public Long getAsmId() {
		return asmId;
	}

	public List<SubasmEntity> getSubasms() {
		return subasms;
	}

	public void setSubasms(List<SubasmEntity> subasms) {
		this.subasms = subasms;
	}

	public void setAsmId(Long asmId) {
		this.asmId = asmId;
	}
	
	
}
