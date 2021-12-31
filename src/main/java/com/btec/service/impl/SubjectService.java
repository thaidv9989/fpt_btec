package com.btec.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.btec.converter.ClassConverter;
import com.btec.converter.SubjectConverter;
import com.btec.dto.ClassDTO;
import com.btec.dto.SubjectDTO;
import com.btec.entity.ClassEntity;
import com.btec.entity.MajorEntity;
import com.btec.repository.MajorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.btec.entity.SubjectEntity;
import com.btec.repository.SubjectRepository;
import com.btec.service.ISubjectService;

@Service
public class SubjectService implements ISubjectService{

	@Autowired
	private SubjectRepository subjectRepository;

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
	public List<ClassDTO> findClassesBySubjectName(String name){
		List<ClassEntity> classes =  subjectRepository.findAll().stream().filter(s -> s.getSubjectName().contains(name)).map(s -> s.getClasses()).findFirst().get();
		return classes.stream().map(c -> ClassConverter.toDto(c)).collect(Collectors.toList());
	}

	@Override
	public List<SubjectDTO> getAllSubjects(){
		return subjectRepository.findAll().stream().sorted((m1, m2) -> m2.getModifiedDate().compareTo(m1.getModifiedDate())).map(SubjectConverter::toDto).collect(Collectors.toList());
	}

	@Override
	public List<SubjectDTO> getSubjectByMajorId(Long id){
		return subjectRepository.findAll().stream().filter(s -> s.getMajor().getMajorId().equals(id)).map(SubjectConverter::toDto).collect(Collectors.toList());
	}

	@Override
	public SubjectDTO create(SubjectDTO dto){
		MajorEntity major = majorRepository.getOne(dto.getMajorId());
		SubjectEntity subject = new SubjectEntity();
		subject.setMajor(major);
		return SubjectConverter.toDto(subjectRepository.save(SubjectConverter.toEntity(dto, subject)));
	}

	@Override
	public SubjectDTO findById(Long id){
		return SubjectConverter.toDto(subjectRepository.findOne(id));
	}

	@Override
	public boolean delete(Long id){
		if(subjectRepository.findOne(id) != null){
			subjectRepository.delete(id);
			return true;
		}
		return false;
	}

	@Override
	public List<SubjectDTO> getListByName(String subjectName){
		return subjectRepository.findAll().stream().filter(s -> s.getSubjectName().toLowerCase().contains(subjectName.toLowerCase())).map(SubjectConverter::toDto).collect(Collectors.toList());
	}

	@Override
	public List<SubjectDTO> getListById(Long id){
		return subjectRepository.findAll().stream().filter(s -> s.getSubjectId().toString().contains(id.toString())).map(SubjectConverter::toDto).collect(Collectors.toList());
	}

	@Override
	public List<SubjectDTO> getListByMajorName(String majorName){
		return subjectRepository.findAll().stream().filter(s-> s.getMajor().getMajorName().toLowerCase().contains(majorName.toLowerCase())).map(SubjectConverter::toDto).collect(Collectors.toList());
	}
}
