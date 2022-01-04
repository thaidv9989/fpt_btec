package com.btec.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.btec.converter.AsmConverter;
import com.btec.converter.ClassConverter;
import com.btec.converter.UserConverter;
import com.btec.dto.AsmDTO;
import com.btec.dto.ClassDTO;
import com.btec.dto.UserDTO;
import com.btec.entity.AsmEntity;
import com.btec.entity.ClassEntity;
import com.btec.entity.ContentEntity;
import com.btec.entity.RoleEntity;
import com.btec.entity.SubasmEntity;
import com.btec.entity.SubjectEntity;
import com.btec.entity.UserEntity;
import com.btec.repository.ClassRepository;
import com.btec.repository.ContentRepository;
import com.btec.repository.RoleRepository;
import com.btec.repository.SubAsmRepository;
import com.btec.repository.SubjectRepository;
import com.btec.repository.UserRepository;
import com.btec.service.IClassService;
import com.btec.util.SecurityUtils;

@Service
public class ClassService implements IClassService {

	@Autowired
	private AsmConverter asmConverter;
	
	@Autowired
	private UserConverter userConverter;

	@Autowired
	private ClassRepository classRepository;

	@Autowired
	private SubjectRepository subjectRepository;

	@Autowired
	private ContentRepository contentRepository;
	
	@Autowired
	private RoleRepository roleRepository;

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private SubAsmRepository subAsmRepository;


	@Override
	public List<ClassDTO> findAll(Pageable pageable) {
		List<ClassDTO> models = new ArrayList<>();
		List<ClassEntity> entities = classRepository.findAll(pageable).getContent();
		for (ClassEntity classlist : entities) {
			ClassDTO classDTO = ClassConverter.toDto(classlist);
			models.add(classDTO);
		}
		return models;
	}

	@Override
	public int getTotalItem() {
		return (int) classRepository.count();
	}

	@Override
	public Map<Long, String> findAll() {
		Map<Long, String> result = new HashMap<>();
		List<ClassEntity> entities = classRepository.findAll();
		for (ClassEntity item : entities) {
			result.put(item.getClassId(), item.getClassName());
		}
		return result;
	}

	@Override
	public ClassDTO findOne(Long classId) {
		ClassEntity entity = classRepository.findOne(classId);
		return ClassConverter.toDto(entity);
	}

	@Override
	@org.springframework.transaction.annotation.Transactional
	public ClassDTO save(ClassDTO dto) {
		SubjectEntity subjectclass = subjectRepository.findOne(dto.getSubjectId());
		ContentEntity contentclass = contentRepository.findOne(dto.getContentId());
		UserEntity user = userRepository.findOne(dto.getUsername());
		if (dto.getClassId() != null) {
			ClassEntity oldClass = classRepository.findOne(dto.getClassId());
			oldClass.setSubject(subjectclass);
			oldClass.setPassword(dto.getPassword());
			oldClass.getUserclass().stream().filter(u->u.getRoles().get(0).getRoleName().equals("trainer")).map(u->user);
			oldClass.setContent(contentclass);
			user.getClassuser().add(oldClass);
			return ClassConverter.toDto(oldClass);
		}
			ClassEntity classEntity = ClassConverter.toEntity(dto);
			classEntity.getUserclass().add(user);
			classEntity.setContent(contentclass);
			classEntity.setSubject(subjectclass);
		return ClassConverter.toDto(classRepository.save(classEntity));
	}

	@Override
	public List<AsmDTO> findByClassId(Long classId) {
		List<AsmDTO> asmmodel = new ArrayList<>();
		List<AsmEntity> entities = classRepository.findOneByclassId(classId).getAsms();
		for (AsmEntity item : entities) {
			AsmDTO asmDTO = asmConverter.toDto(item);
			asmmodel.add(asmDTO);
		}
		return asmmodel;
	}

	@Override
	public void delete(long[] classIds) {
		for (long classId : classIds) {
			classRepository.delete(classId);

		}
	}
	public List<UserDTO> listTraineeOfClass(Long classId, String username) {
		List<UserEntity> usersEntity = classRepository.findOne(classId).getUserclass();
		List<UserDTO> usersDTO = new ArrayList<>();
		Long roleId = 2L;
		RoleEntity trainerrole = roleRepository.findOne(roleId);
		for (UserEntity users: usersEntity) {
			if (!(users.getUsername() == username)) {
				UserDTO userDTO = userConverter.toDto(users);
				usersDTO.add(userDTO);
			}
		}
		return usersDTO;
	}
	@Override
	public boolean joinClass(ClassDTO dto, String username){
		ClassEntity classEntity = classRepository.findOne(dto.getClassId());
		UserEntity user = userRepository.findOne(username);
		classEntity.getUserclass().add(user);
		user.getClassuser().add(classEntity);
		if(classRepository.save(classEntity) != null && userRepository.save(user) != null){
			return true;
		}
		return false;
	}

	@Override
	public boolean isTraineeHasClass(Long id, String username){
		return userRepository.findOne(username).getClassuser().stream().anyMatch(c -> c.getClassId().equals(id));
	}

	@Override
	public boolean checkClassPassword(ClassDTO dto){
		return classRepository.findOne(dto.getClassId()).getPassword().equals(dto.getPassword());
	}

	@Override
	public String genLinkInvite(Long id){
		try{
			if(classRepository.findOne(id) == null) return "";
		}catch (Exception e){
			return "";
		}
		return "http://localhost:8080/cms-btec/invitation/class?id="+id.toString();
	}
	
	@Override
	public ClassDTO savePass(ClassDTO dto) {
		// TODO Auto-generated method stub
		ClassEntity oldClass = classRepository.findOne(dto.getClassId());
		oldClass.setPassword(dto.getPassword());
		classRepository.save(oldClass);
		return ClassConverter.toDto(oldClass);
	}

	@Override
	public List<ClassDTO> findClassByUser(String username) {
		List<ClassDTO> classDTOs = new ArrayList<>();
		List<ClassEntity> classEntities = userRepository.findOne(username).getClassuser();
		for (ClassEntity classitem: classEntities) {
			ClassDTO classDTO = ClassConverter.toClassDto(classitem);
			classDTOs.add(classDTO);
		}
		return classDTOs;
	}
	
	@Override
	public List<AsmDTO> findAsmByUsernameAndClassId(Long classId){
		List<AsmEntity> list = userRepository.findOne(SecurityUtils.getPrincipal().getUsername()).getClassuser().stream().filter(c -> c.getClassId().equals(classId)).findFirst().get().getAsms();
		return list.stream().map((AsmEntity a) -> {
			AsmDTO dto = asmConverter.toDto(a);
			SubasmEntity subAsm = subAsmRepository.findAll().stream().filter(s -> s.getAsm().getAsmId().equals(a.getAsmId())).findFirst().orElse(null);
			if(subAsm != null) {
				dto.setStatus(1);
			}
			else {
				dto.setStatus(0);
			}
			return dto;
		}).collect(Collectors.toList());
	}
}
