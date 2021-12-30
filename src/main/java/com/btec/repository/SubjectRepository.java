package com.btec.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.btec.entity.SubjectEntity;

public interface SubjectRepository extends JpaRepository<SubjectEntity, Long> {

}
