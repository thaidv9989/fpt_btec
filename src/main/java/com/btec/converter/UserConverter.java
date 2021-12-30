package com.btec.converter;

import org.springframework.stereotype.Component;

import com.btec.dto.UserDTO;
import com.btec.entity.UserEntity;

@Component
public class UserConverter {

	public UserDTO toDto(UserEntity entity) {
		UserDTO result = new UserDTO();
		result.setUsername(entity.getUsername());
		result.setPassword(entity.getPassword());
		result.setFullName(entity.getFullName());
		result.setModifiedBy(entity.getModifiedBy());
		result.setModifiedDate(entity.getModifiedDate());
		result.setCreatedBy(entity.getCreatedBy());
		result.setCreatedDate(entity.getCreatedDate());
		result.setDob(entity.getDob());
		result.setEmail(entity.getEmail());
		result.setPhoneNumber(entity.getPhoneNumber());
		return result;
	}

	public UserEntity toEntity(UserDTO dto) {
		UserEntity result = new UserEntity();
		result.setUsername(dto.getUsername());
		result.setPassword(dto.getPassword());
		result.setFullName(dto.getFullName());
		result.setModifiedBy(dto.getModifiedBy());
		result.setModifiedDate(dto.getModifiedDate());
		result.setCreatedBy(dto.getCreatedBy());
		result.setCreatedDate(dto.getCreatedDate());
		result.setDob(dto.getDob());
		result.setEmail(dto.getEmail());
		result.setPhoneNumber(dto.getPhoneNumber());
		return result;
	}
	
	public UserEntity toEntity(UserEntity result, UserDTO dto) {
		result.setPassword(dto.getPassword());
		result.setFullName(dto.getFullName());
		result.setModifiedBy(dto.getModifiedBy());
		result.setModifiedDate(dto.getModifiedDate());
		result.setCreatedBy(dto.getCreatedBy());
		result.setCreatedDate(dto.getCreatedDate());
		result.setDob(dto.getDob());
		result.setEmail(dto.getEmail());
		result.setPhoneNumber(dto.getPhoneNumber());
		return result;
		
	}
}
