package com.btec.converter;

import org.springframework.stereotype.Component;

import com.btec.dto.SubAsmDTO;
import com.btec.entity.SubasmEntity;

import java.sql.Time;
import java.sql.Timestamp;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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
		result.setModifiedDate(new Timestamp(entity.getModifiedDate().getTime()));
		return result;
	}
	
	public SubAsmDTO toDtoReport(SubasmEntity entity) {
		SubAsmDTO result = new SubAsmDTO();
		result.setSubAsmId(entity.getSubasmId());
		result.setComment(entity.getComment());
		result.setGrade(entity.getGrade());
		result.setSubStatus(entity.getSubStatus());
		result.setUsername(entity.getUser().getUsername());
		result.setFullName(entity.getUser().getFullName());
		result.setUserEmail(entity.getUser().getEmail());
		result.setGender(entity.getUser().getGender());
		result.setFileName(entity.getSubFile());
		result.setModifiedDate(new Timestamp(entity.getModifiedDate().getTime()));
		
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
