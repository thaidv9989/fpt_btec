package com.btec.service;

import java.awt.print.Pageable;
import java.util.List;
import java.util.Map;

import com.btec.dto.AsmDTO;
import com.btec.dto.SubjectDTO;

public interface ISubjectService {
	List<SubjectDTO> findAllSub(Pageable pageable);
	int getTotalItem();
	SubjectDTO findById(long asmId);
	SubjectDTO save(AsmDTO dto);
	void delete(long[] asmIds);
	Map<Long, String> findAll();
}
