package com.btec.api.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.btec.dto.UserDTO;
import com.btec.service.impl.UserService;

@RequestMapping(value = "userAPI")
public class UserAPI {
	
	@Autowired
	private UserService userService;
	@PutMapping("/api/user/{username}")
	public UserDTO updateProfile(@RequestBody UserDTO userDTO) {
		return userService.save(userDTO);
	}
}
