package com.btec.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.btec.constant.SystemConstant;
import com.btec.converter.ClassConverter;
import com.btec.converter.UserConverter;
import com.btec.dto.ClassDTO;
import com.btec.dto.UserDTO;
import com.btec.entity.UserEntity;
import com.btec.repository.RoleRepository;
import com.btec.repository.UserRepository;
import com.btec.service.IUserService;
import com.btec.util.SecurityUtils;


@Service
public class UserService implements IUserService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private RoleRepository roleRepository;
	
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private ClassConverter classConverter;
	
	@Autowired UserConverter userConverter;
	
	@Override
	public UserDTO findOne(String username) {
		// TODO Auto-generated method stub
		UserEntity entities = userRepository.findOne(username);
		return userConverter.toDto(entities);

	}
	@Override
	public List<UserDTO> findAll(){
		/*return userRepository.findAll().stream().map(u->userConverter.toDto(u)).collect(Collectors.toList());*/
		List<UserDTO> userDTOs = new ArrayList<>();
		List<UserEntity> userEntities = userRepository.findAllByStatus(SystemConstant.ACTIVE_STATUS);
		for (UserEntity userEntity: userEntities) {
			UserDTO userDTO = userConverter.toDto(userEntity);
			userDTOs.add(userDTO);
		}
		return userDTOs;
	}
	
	public List<UserDTO> findAllInactiveUser(){
		/*return userRepository.findAll().stream().map(u->userConverter.toDto(u)).collect(Collectors.toList());*/
		List<UserDTO> userDTOs = new ArrayList<>();
		List<UserEntity> userEntities = userRepository.findAllByStatus(SystemConstant.INACTIVE_STATUS);
		for (UserEntity userEntity: userEntities) {
			UserDTO userDTO = userConverter.toDto(userEntity);
			userDTOs.add(userDTO);
		}
		return userDTOs;
	}
	
	@Override
	public Map<String, String> findAllTrainer() {
		Long roleId = 2L;
		Map<String, String> result = new HashMap<>();
		List<UserEntity> entities = roleRepository.findOne(roleId).getUsers();
		for (UserEntity item: entities) {
			result.put(item.getUsername(), item.getFullName());
		}
		return result;
	}

	@Override
	public List<UserDTO> findAll(Pageable pageable) {
		List<UserDTO> model = new ArrayList<>();
		List<UserEntity> entities = userRepository.findAll(pageable).getContent();
		for (UserEntity item: entities) {
			UserDTO userDTO = userConverter.toDto(item);
			model.add(userDTO);
		}
		return model;
	}
	

	@Override
	public int getTotalItem() {
		return (int) userRepository.count();
	}
//	@Override
//	public Map<String, String> findAll() {
//		Map<String, String> result = new HashMap<>();
//		List<UserEntity> entities = userRepository.findAll();
//		for (UserEntity item: entities) {
//			result.put(item.getUsername(), item.getFullName());
//		}
//		return result;
//	}
	

	@Override
	public UserDTO save(UserDTO dto) {
		UserEntity userEntity = new UserEntity();
		List<UserEntity> userEntities = roleRepository.findOne(dto.getRoleId()).getUsers();
		UserEntity oldUser = userRepository.findOne(dto.getUsername());
		if (oldUser != null) {
			userEntity = userConverter.toEntity(oldUser,dto);
			userEntity.setModifiedDate(new Date());
		}
		else
		{
			userEntity = userConverter.toEntity(dto);
			userEntity.getRoles().add(roleRepository.findOne(dto.getRoleId()));
			userEntities.add(userEntity);
			userEntity.setCreatedDate(new Date());
			userEntity.setModifiedDate(new Date());
		}
		return userConverter.toDto(userRepository.save(userEntity));
	}
	@Override
	public void inactiveUser(String[] usernames) {
		for (String username : usernames) {
			UserEntity userEntity = userRepository.findOne(username);
			userEntity.setStatus(SystemConstant.INACTIVE_STATUS);
			userRepository.save(userEntity);
		}
	}
	@Override
	public List<ClassDTO> getClassesOfTrainee(String username){
		return userRepository.findOne(username).getClassuser().stream().map(c -> ClassConverter.toDto(c)).collect(Collectors.toList());
	}
//	@Override
//	public boolean delete(String usernames) {
//		for (String username: usernames) {
//			userRepository.delete(username);
//		}
//	}
	
	@Override
	public boolean checkPassword(String password){
		UserEntity user = userRepository.findOne(SecurityUtils.getPrincipal().getUsername());
		return passwordEncoder.matches(password, user.getPassword());
	}

	@Override
	public boolean changePwd(String password){
		UserEntity user = userRepository.findOne(SecurityUtils.getPrincipal().getUsername());
		user.setPassword(password);
		if(userRepository.save(user) != null){
			return true;
		}
		return false;
	}
	@Override
	public void activeUser(String[] usernames) {
		// TODO Auto-generated method stub
		for (String username : usernames) {
			UserEntity userEntity = userRepository.findOne(username);
			userEntity.setStatus(SystemConstant.ACTIVE_STATUS);
			userRepository.save(userEntity);
		}
	}

}
