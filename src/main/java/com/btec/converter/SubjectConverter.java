package com.btec.converter;

import org.springframework.stereotype.Component;

import com.btec.dto.SubjectDTO;
import com.btec.entity.SubjectEntity;

@Component
public class SubjectConverter {
	
	public SubjectDTO toDto(SubjectEntity entity) {
		SubjectDTO result = new SubjectDTO();
		result.setSubjectId(entity.getSubjectId());
		result.setSubjectName(entity.getSubjectName());
		result.setMajorId(entity.getMajor().getMajorId());
		return result;
		
	}
	public SubjectEntity toEntity(SubjectDTO dto) {
		SubjectEntity result = new SubjectEntity();
		result.setSubjectName(dto.getSubjectName());
		return result;
		
	}
	public SubjectEntity toEntity(SubjectEntity result, SubjectDTO dto) {
		result.setSubjectName(dto.getSubjectName());
		return result;
	}
}
