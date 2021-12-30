package com.btec.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.btec.converter.AsmConverter;
import com.btec.dto.AsmDTO;
import com.btec.entity.AsmEntity;
import com.btec.entity.ClassEntity;
import com.btec.repository.AsmRepository;
import com.btec.repository.ClassRepository;
import com.btec.service.IAsmService;

@Service

public class AsmService implements IAsmService {
	
	@Autowired
	private AsmRepository asmRepository;
	
	@Autowired
	private AsmConverter asmConverter;
	
	@Autowired
	private ClassRepository classRepository;
	
	@Override
	public List<AsmDTO> findAll(Pageable pageable) {
		List<AsmDTO> models = new ArrayList<>();
		List<AsmEntity> entities = asmRepository.findAll(pageable).getContent();
		for (AsmEntity item: entities) {
			AsmDTO asmDTO = asmConverter.toDto(item);
			models.add(asmDTO);
		}
		return models;
	}

	@Override
	public int getTotalItem() {
		return (int) asmRepository.count();
	}

	@Override
	public AsmDTO findById(long asmId) {
		// TODO Auto-generated method stub
		AsmEntity entity = asmRepository.findOne(asmId);
		return asmConverter.toDto(entity);
	}

	@Override
	@org.springframework.transaction.annotation.Transactional
	public AsmDTO save(AsmDTO dto) {
		ClassEntity asmclass = classRepository.findOneByclassId(dto.getClassId());
		AsmEntity asmEntity = new AsmEntity();
		if (dto.getAsmId() != null) {
			AsmEntity oldAsm = asmRepository.findOne(dto.getAsmId());
			oldAsm.setClasss(asmclass);
			asmEntity = asmConverter.toEntity(oldAsm, dto);
		}
		else
		{
			asmEntity = asmConverter.toEntity(dto);
			asmEntity.setClasss(asmclass);
			
		}
		return asmConverter.toDto(asmRepository.save(asmEntity));
	}

	@Override
	public void delete(long[] asmIds) {
		for (long asmid: asmIds) {
			asmRepository.delete(asmid);
		}
	}
}
