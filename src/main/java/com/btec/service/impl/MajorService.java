package com.btec.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.btec.converter.MajorConverter;
import com.btec.dto.MajorDTO;
import com.btec.entity.MajorEntity;
import com.btec.repository.MajorRepository;
import com.btec.service.IMajorService;


@Service
public class MajorService implements IMajorService {

	@Autowired
	private MajorRepository majorRepository;
	
	
	@Override
	public Map<Long, String> findAll() {
		Map<Long, String> result = new HashMap<>();
		List<MajorEntity> entities = majorRepository.findAll();
		for (MajorEntity item: entities) {
			result.put(item.getMajorId(), item.getMajorName());
		}
		return result;
	}
	
	@Override
	public List<MajorDTO> findListAll(){
		return majorRepository.findAll().stream().sorted((m1, m2) -> m2.getModifiedDate().compareTo(m1.getModifiedDate())).map(MajorConverter::toDTO).collect(Collectors.toList());
	}
	
	@Override
	public MajorDTO create(MajorDTO dto) {
		return MajorConverter.toDTO(majorRepository.save(MajorConverter.toEntity(dto))); 
	}
	
	@Override
	public MajorDTO update(MajorDTO dto) {
		MajorEntity major = majorRepository.getOne(dto.getMajorId());
		if(major == null) {
			return null;
		}
		major.setMajorName(dto.getMajorName());
		major.setMajorDesc(dto.getMajorDesc());
		return MajorConverter.toDTO(majorRepository.save(major)); 
	}
	
	@Override
	public boolean delete(Long id) {
		MajorEntity major = majorRepository.getOne(id);
		if(major == null) {
			return false;
		}
		majorRepository.delete(id);
		return true;
	}
	
	@Override
	public List<MajorDTO> searchByMajorName(String name) {
		return majorRepository.findAll().stream().filter(m -> m.getMajorName().toLowerCase().contains(name.toLowerCase())).map(MajorConverter::toDTO).collect(Collectors.toList());
	}
	
	@Override
	public List<MajorDTO> searchByMajorID(Long id){
		return majorRepository.findAll().stream().filter(m -> m.getMajorId().equals(id)).map(MajorConverter::toDTO).collect(Collectors.toList());
	}

	@Override
	public MajorDTO findById(Long id) {
		return MajorConverter.toDTO(majorRepository.getOne(id));
	}

}
