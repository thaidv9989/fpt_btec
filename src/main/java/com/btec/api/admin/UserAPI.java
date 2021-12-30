package com.btec.api.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.btec.dto.UserDTO;
import com.btec.service.IUserService;

@RestController
public class UserAPI {

	
	@Autowired
	private IUserService userService;
	
	@PostMapping("/api/user")
	public UserDTO addUser(@RequestBody UserDTO addUserDTO) {
		return userService.save(addUserDTO);
	}
	
	@GetMapping("/api/user")
	public List<UserDTO> findAll(){
		return userService.findAll();
	}
	
	@PutMapping("/api/user")
	public UserDTO updateUser(@RequestBody UserDTO updateUserDTO) {
		return userService.save(updateUserDTO);
	}
	
//	@DeleteMapping("/api/user")
//	public void deleteUser(@RequestBody String username) {
//		userService.delete(username);
//	}
	

}
