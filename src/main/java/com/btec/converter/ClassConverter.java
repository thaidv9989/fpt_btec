package com.btec.converter;

//import java.sql.Timestamp;
import org.springframework.stereotype.Component;
import com.btec.dto.ClassDTO;
import com.btec.entity.ClassEntity;

@Component

public class ClassConverter {

	public ClassDTO toDto(ClassEntity entity) {
		ClassDTO result = new ClassDTO();
		result.setClassId(entity.getClassId());
		result.setClassName(entity.getClassName());
		result.setPassword(entity.getPassword());
		result.setSubjectId(entity.getSubject().getSubjectId());
		result.setContentId(entity.getContent().getContentId());
		result.setModifiedBy(entity.getModifiedBy());
		result.setModifiedDate(entity.getModifiedDate());
		result.setCreatedBy(entity.getCreatedBy());
		result.setCreatedDate(entity.getCreatedDate());
		return result;
	}
	
	public ClassEntity toEntity(ClassDTO dto) {
		ClassEntity result = new ClassEntity();
		result.setClassName(dto.getClassName());
		result.setPassword(dto.getPassword());
		result.setModifiedBy(dto.getModifiedBy());
		result.setModifiedDate(dto.getModifiedDate());
		result.setCreatedBy(dto.getCreatedBy());
		result.setCreatedDate(dto.getCreatedDate());
		return result;
	}
	
	public ClassEntity toEntity(ClassEntity result, ClassDTO dto) {
		result.setClassName(dto.getClassName());
		result.setPassword(dto.getPassword());
		result.setModifiedBy(dto.getModifiedBy());
		result.setModifiedDate(dto.getModifiedDate());
		result.setCreatedBy(dto.getCreatedBy());
		result.setCreatedDate(dto.getCreatedDate());
		return result;
	}
	
}
