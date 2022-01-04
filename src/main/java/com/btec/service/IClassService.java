package com.btec.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Pageable;

import com.btec.dto.AsmDTO;
import com.btec.dto.ClassDTO;
import com.btec.dto.UserDTO;
import com.btec.entity.AsmEntity;

public interface IClassService {
	List<ClassDTO> findAll(Pageable pageable);
	List<AsmDTO> findByClassId(Long classId);
	int getTotalItem();
	Map<Long, String> findAll();
	ClassDTO findOne(Long classId);
	ClassDTO save(ClassDTO dto);
	void delete(long[] classIds);
	List<UserDTO> listTraineeOfClass(Long classId, String username);
    boolean joinClass(ClassDTO dto, String username);

	boolean isTraineeHasClass(Long id, String username);

	boolean checkClassPassword(ClassDTO dto);

	String genLinkInvite(Long id);
	ClassDTO savePass(ClassDTO dto);
	List<ClassDTO> findClassByUser(String username);
	List<AsmDTO> findAsmByUsernameAndClassId(Long classId);
}
