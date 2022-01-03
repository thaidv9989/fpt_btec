package com.btec.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.btec.dto.RoleDTO;
import com.btec.entity.RoleEntity;
import com.btec.repository.RoleRepository;
import com.btec.repository.UserRepository;
import com.btec.service.IRoleService;


@Service
public class RoleService implements IRoleService{

	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Override
	public RoleDTO findOne(Long roleId) {
		return null;
	}
	
	@Override
	public Map<Long, String> findAllRole(String username) {
		Map<Long, String> result = new HashMap<>();		
		if (username != null) {
			List<RoleEntity> roleEntities = userRepository.findOne(username).getRoles();
			for (RoleEntity item: roleEntities) {
				result.put(item.getRoleId(), item.getRoleDesc());
			}
		}
		else
		{
			List<RoleEntity> roleEntities = roleRepository.findAll();
			for (RoleEntity item: roleEntities) {
				result.put(item.getRoleId(), item.getRoleDesc());
			}
		}
		
		return result;
	}
	
}