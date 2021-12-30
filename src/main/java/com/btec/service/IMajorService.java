package com.btec.service;

import java.util.List;
import java.util.Map;

import com.btec.dto.MajorDTO;

public interface IMajorService {
	Map<Long, String> findAll();
	
	List<MajorDTO> findListAll();

	MajorDTO create(MajorDTO dto);

	MajorDTO update(MajorDTO dto);

	boolean delete(Long id);

	List<MajorDTO> searchByMajorName(String name);

	List<MajorDTO> searchByMajorID(Long id);
	
	MajorDTO findById(Long id);
}
