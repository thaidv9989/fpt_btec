package com.btec.converter;

import org.springframework.stereotype.Component;

import com.btec.dto.AsmDTO;
import com.btec.entity.AsmEntity;

@Component
public class AsmConverter {

	public AsmDTO toDto(AsmEntity entity) {
		AsmDTO result = new AsmDTO();
		result.setAsmId(entity.getAsmId());
		result.setAsmBrief(entity.getAsmBrief());
		result.setAsmDateDue(entity.getAsmDateDue());
		result.setAsmTimeDue(entity.getAsmTimeDue());
		result.setAsmName(entity.getAsmName());
		result.setFeedback(entity.getFeedback());
		result.setSubType(entity.getSubType());
		result.setLimitItem(entity.getLimitItem());
		result.setClassId(entity.getClasss().getClassId());
		return result;
	}
	
	public AsmEntity toEntity(AsmDTO dto) {
		AsmEntity result = new AsmEntity();
		result.setAsmBrief(dto.getAsmBrief());
		result.setAsmDateDue(dto.getAsmDateDue());
		result.setAsmTimeDue(dto.getAsmTimeDue());
		result.setAsmName(dto.getAsmName());
		result.setFeedback(dto.getFeedback());
		result.setSubType(dto.getSubType());
		result.setLimitItem(dto.getLimitItem());
		return result;
	}
	
	public AsmEntity toEntity(AsmEntity result, AsmDTO dto) {
		result.setAsmBrief(dto.getAsmBrief());
		result.setAsmDateDue(dto.getAsmDateDue());
		result.setAsmTimeDue(dto.getAsmTimeDue());
		result.setAsmName(dto.getAsmName());
		result.setFeedback(dto.getFeedback());
		result.setSubType(dto.getSubType());
		result.setLimitItem(dto.getLimitItem());
		return result;
	}
}
