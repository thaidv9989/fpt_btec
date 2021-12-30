package com.btec.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.btec.dto.SubAsmDTO;

public interface ISubAsmService {
	List<SubAsmDTO> findAll();
	SubAsmDTO findById(long subAsmId);
	SubAsmDTO savegrade(SubAsmDTO dto);
	Object uploadFile(MultipartFile fileSubmit);
	Object getSubmissionAsmByUsernameAndAsmId(long parseLong);
	Object submitAsm(SubAsmDTO dto);
	Object editAsm(SubAsmDTO dto);
}
