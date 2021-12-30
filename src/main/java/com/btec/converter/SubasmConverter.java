package com.btec.converter;

import org.springframework.stereotype.Component;

import com.btec.dto.SubAsmDTO;
import com.btec.entity.SubasmEntity;

@Component
public class SubasmConverter {
	
	public SubAsmDTO toDto(SubasmEntity entity) {
		SubAsmDTO result = new SubAsmDTO();
		result.setSubAsmId(entity.getSubasmId());
		result.setComment(entity.getComment());
		result.setGrade(entity.getGrade());
		result.setSubStatus(entity.getSubStatus());
		result.setUsername(entity.getUser().getFullName());
		result.setFileName(entity.getSubFile());
		return result;
	}
	
	public SubasmEntity toEntity(SubasmEntity result, SubAsmDTO dto) {
		result.setComment(dto.getComment());
		result.setGrade(dto.getGrade());
		result.setSubFile(dto.getFileName());
		result.setSubStatus(dto.getSubStatus());
		return result;
	}
}
