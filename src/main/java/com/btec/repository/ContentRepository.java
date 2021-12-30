package com.btec.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.btec.entity.ContentEntity;

public interface ContentRepository extends JpaRepository<ContentEntity, Long> {

}
