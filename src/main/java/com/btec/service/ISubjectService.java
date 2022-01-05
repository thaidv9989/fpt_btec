package com.btec.service;

import com.btec.dto.ClassDTO;
import com.btec.dto.SubjectDTO;

import java.util.List;
import java.util.Map;

public interface ISubjectService {
	Map<Long, String> findAll();

	List<ClassDTO> findClassesBySubjectName(String name);

	List<SubjectDTO> getAllSubjects();

	List<SubjectDTO> getSubjectByMajorId(Long id);

	SubjectDTO create(SubjectDTO dto);

	SubjectDTO findById(Long id);

	boolean delete(Long id);

	List<SubjectDTO> getListByName(String subjectName);

	List<SubjectDTO> getListById(Long id);

	List<SubjectDTO> getListByMajorName(String majorName);
	Boolean isExsist(String name);
}
