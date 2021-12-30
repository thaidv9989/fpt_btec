package com.btec.converter;

import java.sql.Timestamp;

//import java.sql.Timestamp;
import org.springframework.stereotype.Component;
import com.btec.dto.ClassDTO;
import com.btec.entity.ClassEntity;

@Component

public class ClassConverter {

	public static ClassDTO toDto(ClassEntity entity) {
		ClassDTO result = new ClassDTO();
		result.setClassId(entity.getClassId());
		result.setClassName(entity.getClassName());
		result.setPassword(entity.getPassword());
		result.setSubjectId(entity.getSubject().getSubjectId());
		result.setContentId(entity.getContent().getContentId());
		result.setSubjectName(entity.getSubject().getSubjectName());
		result.setModifiedBy(entity.getModifiedBy());
		result.setModifiedDate(new Timestamp(entity.getModifiedDate().getTime()));
		result.setCreatedBy(entity.getCreatedBy());
		result.setCreatedDate(new Timestamp(entity.getCreatedDate().getTime()));
		return result;
	}
	
	public static ClassEntity toEntity(ClassDTO dto) {
		ClassEntity result = new ClassEntity();
		result.setClassName(dto.getClassName());
		result.setPassword(dto.getPassword());
		result.setModifiedBy(dto.getModifiedBy());
		result.setModifiedDate(dto.getModifiedDate());
		result.setCreatedBy(dto.getCreatedBy());
		result.setCreatedDate(dto.getCreatedDate());
		return result;
	}
	
	public static ClassEntity toEntity(ClassEntity result, ClassDTO dto) {
		result.setClassName(dto.getClassName());
		result.setPassword(dto.getPassword());
		result.setModifiedBy(dto.getModifiedBy());
		result.setModifiedDate(dto.getModifiedDate());
		result.setCreatedBy(dto.getCreatedBy());
		result.setCreatedDate(dto.getCreatedDate());
		return result;
	}
	
}
