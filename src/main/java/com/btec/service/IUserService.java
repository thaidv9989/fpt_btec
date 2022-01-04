package com.btec.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Pageable;

import com.btec.dto.AsmDTO;
import com.btec.dto.ClassDTO;
import com.btec.dto.UserDTO;

public interface IUserService {
	UserDTO findOne(String username);
	Map<String, String> findAllTrainer();
//	Map<String, String> findAll();
	List<UserDTO> findAll(Pageable pageable);
	int getTotalItem();
	UserDTO save(UserDTO dto);
	List<UserDTO> findAll();
	boolean delete(String usernames);
	List<ClassDTO> getClassesOfTrainee(String username);
	boolean checkPassword(String password);
	boolean changePwd(String password);
}
