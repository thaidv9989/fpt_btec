package com.btec.service;

import java.util.Map;

import com.btec.dto.RoleDTO;

public interface IRoleService {
	RoleDTO findOne(Long roleId);

	Map<Long, String> findAllRole(String username);
}
