package com.btec.service;

import com.btec.dto.RoleDTO;

public interface IRoleService {
	RoleDTO findOne(Long roleId);
}
