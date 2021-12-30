package com.btec.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.btec.dto.RoleDTO;
import com.btec.repository.RoleRepository;
import com.btec.service.IRoleService;


@Service
public class RoleService implements IRoleService{

	@Autowired
	private RoleRepository roleRepository;
	
	@Override
	public RoleDTO findOne(Long roleId) {
		return null;
	}
	
}
