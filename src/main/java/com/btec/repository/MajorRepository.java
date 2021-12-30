package com.btec.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.btec.entity.MajorEntity;

public interface MajorRepository extends JpaRepository<MajorEntity, Long> {

}
