package com.btec.dto;

import java.sql.Time;
import java.sql.Date;

public class AsmDTO extends AbstractDTO<AsmDTO>{
	private Long asmId;
	private String asmName;
	private String asmBrief;
	private Date asmDateDue;
	private Time asmTimeDue;
	private Integer limitItem;
	private String subType;
	private String feedback;
	private Long classId;
	
	
	public void setAsmBrief(String asmBrief) {
		this.asmBrief = asmBrief;
	}
	
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	public void setAsmId(Long asmId) {
		this.asmId = asmId;
	}
	public Long getAsmId() {
		return asmId;
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
	public void setBrief(String asmBrief) {
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
	public Long getClassId() {
		return classId;
	}
	public void setClassId(Long classId) {
		this.classId = classId;
	}
	public String getSubType() {
		return subType;
	}
	public void setSubType(String subType) {
		this.subType = subType;
	}

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
	
}
