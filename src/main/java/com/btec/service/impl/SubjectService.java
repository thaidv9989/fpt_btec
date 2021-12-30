package com.btec.service.impl;

import java.awt.print.Pageable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btec.converter.SubjectConverter;
import com.btec.dto.AsmDTO;
import com.btec.dto.SubjectDTO;
import com.btec.entity.AsmEntity;
import com.btec.entity.SubjectEntity;
import com.btec.entity.UserEntity;
import com.btec.repository.MajorRepository;
import com.btec.repository.SubjectRepository;
import com.btec.service.ISubjectService;

@Service
public class SubjectService implements ISubjectService{

	@Autowired
	private SubjectRepository subjectRepository;
	
	@Autowired
	private SubjectConverter subjectConverter;
	
	@Autowired
	private MajorRepository majorRepository;
	
	@Override
	public Map<Long, String> findAll() {
		Map<Long, String> result = new HashMap<>();
		List<SubjectEntity> entities = subjectRepository.findAll();
		for (SubjectEntity item: entities) {
			result.put(item.getSubjectId(), item.getSubjectName());
		}
		return result;
	}

	@Override
	public List<SubjectDTO> findAllSub(Pageable pageable) {
		List<SubjectDTO> model = new ArrayList<>();
		List<SubjectEntity> entities = subjectRepository.findAll(); 
		return model;
	}

	@Override
	public int getTotalItem() {
		return (int) subjectRepository.count();
	}

	@Override
	public SubjectDTO findById(long asmId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SubjectDTO save(AsmDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(long[] asmIds) {
		// TODO Auto-generated method stub
		
	}

	

}
