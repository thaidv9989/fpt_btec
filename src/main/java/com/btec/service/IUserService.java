package com.btec.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Pageable;

import com.btec.dto.AsmDTO;
import com.btec.dto.ClassDTO;
import com.btec.dto.UserDTO;
import com.btec.entity.UserEntity;

public interface IUserService {
	UserDTO findOne(String username);
	Map<String, String> findAllTrainer();
//	Map<String, String> findAll();
	List<UserDTO> findAll(Pageable pageable);
	int getTotalItem();
	UserDTO save(UserDTO dto);
	List<UserDTO> findAll();
	List<UserDTO> findAllActiveUser();
	boolean delete(String usernames);
	List<ClassDTO> getClassesOfTrainee(String username);
	boolean checkPassword(String password);
<<<<<<< HEAD

	boolean changePwd(String password);
	List<UserDTO> findAllInactiveUser();
	void inactiveUser(String[] usernames);
	void activeUser(String[] usernames);
=======
	List<UserDTO> findAllTrainee();
	boolean changePwd(String password);
	void activeUser(String[] usernames);
	List<UserDTO> findAllInactiveUser();
>>>>>>> e777997bf3aa1210d94fb461de14d8adeaee0862
}
