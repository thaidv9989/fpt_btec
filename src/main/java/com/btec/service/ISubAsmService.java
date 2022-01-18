package com.btec.service;

import java.util.List;

import com.btec.dto.SubAsmDTO;
import org.springframework.web.multipart.MultipartFile;

public interface ISubAsmService {
	List<SubAsmDTO> findAll();
	SubAsmDTO findById(long subAsmId);

	SubAsmDTO savegrade(SubAsmDTO dto);

    SubAsmDTO getSubmissionAsmByUsernameAndAsmId(Long asmId);

	SubAsmDTO submitAsm(SubAsmDTO subAsmDTO);

    SubAsmDTO editAsm(SubAsmDTO subAsmDTO);

    String uploadFile(MultipartFile file);

    String generateUniqueFileName(String username, String fileName);
    
    List<SubAsmDTO> findByAsmId(Long id);
}
