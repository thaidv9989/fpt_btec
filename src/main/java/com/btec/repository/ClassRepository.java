package com.btec.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.btec.entity.ClassEntity;

public interface ClassRepository extends JpaRepository<ClassEntity, Long> {
	ClassEntity findOneByclassId(Long classId);
}
