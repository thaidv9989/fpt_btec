package com.btec.converter;

import com.btec.dto.MajorDTO;
import com.btec.entity.MajorEntity;

public class MajorConverter {
	public static MajorEntity toEntity(MajorDTO dto) {
		MajorEntity major = new MajorEntity();
		major.setMajorName(dto.getMajorName());
		major.setMajorDesc(dto.getMajorDesc());
		return major;
	}
	
	public static MajorDTO toDTO(MajorEntity major) {
		MajorDTO dto = new MajorDTO();
		dto.setMajorId(major.getMajorId());
		dto.setMajorName(major.getMajorName());
		dto.setMajorDesc(major.getMajorDesc());
		return dto;
	}
}