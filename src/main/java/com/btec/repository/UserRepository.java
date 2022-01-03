package com.btec.repository;

import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;

import com.btec.entity.UserEntity;

public interface UserRepository extends JpaRepository<UserEntity, String> {
	UserEntity findOneByUsernameAndStatus(String username, int status);
	List<UserEntity> findAllByUsernameAndStatus(String username,int status);
	List<UserEntity> findAllByStatus(int status);
}