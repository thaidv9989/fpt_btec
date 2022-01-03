package com.btec.api.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
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
	@PutMapping("/api/inactiveuser")
	public void inactiveUser(@RequestBody String[] usernames) {
		userService.inactiveUser(usernames);
	}

	@PutMapping("/api/activeuser")
	public void activeUser(@RequestBody String[] usernames) {
		userService.activeUser(usernames);
	}
	
	@GetMapping("/api/user/cpw")
	public ResponseEntity<?> checkPassword(@RequestParam String pwd){
		return userService.checkPassword(pwd) ? ResponseEntity.ok(true) : ResponseEntity.badRequest().build();
	}

	@PutMapping("/api/user/cpw")
	public ResponseEntity<?> changePassword(@RequestParam String pwd){
		return userService.changePwd(pwd) ? ResponseEntity.ok(true) : ResponseEntity.badRequest().build();
	}
	

}
