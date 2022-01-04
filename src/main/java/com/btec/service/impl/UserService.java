package com.btec.service.impl;

import java.util.ArrayList;
import java.sql.Date;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.format.datetime.joda.LocalDateParser;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.btec.converter.ClassConverter;
import com.btec.converter.UserConverter;
import com.btec.dto.ClassDTO;
import com.btec.dto.UserDTO;
import com.btec.entity.ClassEntity;
import com.btec.entity.UserEntity;
import com.btec.repository.ClassRepository;
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
	private ClassRepository classRepository;
	
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
//	@Autowired
//	private ClassConverter classConverter;
	
	@Autowired UserConverter userConverter;
	
	@Override
	public UserDTO findOne(String username) {
		// TODO Auto-generated method stub
		UserEntity entities = userRepository.findOne(username);
		return userConverter.toDto(entities);

	}
	@Override
	public List<UserDTO> findAll(){
		return userRepository.findAll().stream().map(u -> userConverter.toDto(u)).collect(Collectors.toList());
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
		// TODO Auto-generated method stub
//		UserEntity userEntity = new UserEntity();
//		UserEntity oldUser = userRepository.findOne(dto.getUsername());
//		if (oldUser != null) {
//			userEntity = userConverter.toEntity(oldUser,dto);
//		}
//		else
//		{
//			userEntity = userConverter.toEntity(dto);
//		}
//		return userConverter.toDto(userRepository.save(userEntity));
		/*
		 * UserEntity userEntity = new UserEntity(); if(dto.getUsername() != null) {
		 * UserEntity oldUser = userRepository.findOne(dto.getUsername()); userEntity =
		 * userConverter.toEntity(oldUser,dto); }else { userEntity =
		 * userConverter.toEntity(dto); } return
		 * userConverter.toDto(userRepository.save(userEntity));
		 */
		
		return userConverter.toDto(userRepository.save(userConverter.toEntity(dto)));
	}
	@Override
	public boolean delete(String usernames) {
		// TODO Auto-generated method stub
		return false;
	}
	
	@Override
	public List<ClassDTO> getClassesOfTrainee(String username){
		return userRepository.findOne(username).getClassuser().stream().map((ClassEntity c) -> {
			ClassDTO dto = ClassConverter.toDto(c);
			if(c.getAsms().size() == 0) {
				dto.setStatus("Preparing");
			}
			else {
				if(c.getAsms().stream().allMatch(a -> a.getAsmDateDue().getTime() + (a.getAsmTimeDue().getHours() * 60 * 60 + a.getAsmTimeDue().getMinutes()* 60 + a.getAsmTimeDue().getSeconds())*1000 - System.currentTimeMillis()  < 0)) {
					dto.setStatus("Complete");
				}
				else {
					dto.setStatus("On Going");
				}
			}
			return dto;
		}).collect(Collectors.toList());
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
		System.out.println(password);
		UserEntity user = userRepository.findOne(SecurityUtils.getPrincipal().getUsername());
		user.setPassword(passwordEncoder.encode(password));
		if(userRepository.save(user) != null){
			return true;
		}
		return false;
	}
	


}
