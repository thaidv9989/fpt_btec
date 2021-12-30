package com.btec.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.btec.dto.AsmDTO;

public interface IAsmService {
	List<AsmDTO> findAll(Pageable pageable);
	int getTotalItem();
	AsmDTO findById(long asmId);
	AsmDTO save(AsmDTO dto);
	void delete(long[] asmIds);
}
