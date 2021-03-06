package com.btec.service.impl;

import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import com.btec.entity.AsmEntity;
import com.btec.entity.UserEntity;
import com.btec.repository.AsmRepository;
import com.btec.repository.UserRepository;
import com.btec.util.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btec.converter.SubasmConverter;
import com.btec.dto.SubAsmDTO;
import com.btec.entity.SubasmEntity;
import com.btec.repository.SubAsmRepository;
import com.btec.service.ISubAsmService;
import org.springframework.web.multipart.MultipartFile;



@Service
public class SubAsmService implements ISubAsmService {

	@Autowired
	private SubAsmRepository subAsmRepository;

	@Autowired
	private SubasmConverter subAsmConverter;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private AsmRepository asmRepository;

	private final String locationOfSubmitAsm = "D:\\Do An\\fpt_btec\\src\\main\\webapp\\template\\assets\\doc\\";

	@Override
	public List<SubAsmDTO> findAll() {
		List<SubAsmDTO> subasms = new ArrayList<>();
		List<SubasmEntity> subasmentity = subAsmRepository.findAll();
		for (SubasmEntity subasmlist: subasmentity) {
			SubAsmDTO subAsmDTO = subAsmConverter.toDto(subasmlist);
			subasms.add(subAsmDTO);
		}
		return subasms;
	}

	@Override
	public SubAsmDTO findById(long subAsmId) {
		SubasmEntity entity = subAsmRepository.findOne(subAsmId);
		return subAsmConverter.toDto(entity);
	}

	@Override
	@Transactional
	public SubAsmDTO savegrade(SubAsmDTO dto) {
		SubasmEntity oldSubasm = subAsmRepository.findOne(dto.getSubAsmId());
		oldSubasm.setGrade(dto.getGrade());
		oldSubasm.setSubStatus(2);
		oldSubasm.setComment(dto.getComment());
		subAsmRepository.save(oldSubasm);
		return subAsmConverter.toDto(oldSubasm);
	}

	@Override
	public SubAsmDTO getSubmissionAsmByUsernameAndAsmId(Long asmId){
		SubasmEntity entity =userRepository.findOne(SecurityUtils.getPrincipal().getUsername()).getSubasmuser()
				.stream().
				filter(s -> s.getAsm().getAsmId().equals(asmId)).findFirst().orElse(null);
		return entity == null ? null : subAsmConverter.toDto(entity);
	}


	@Override
	public SubAsmDTO submitAsm(SubAsmDTO subAsmDTO){
		UserEntity user = userRepository.findOne(SecurityUtils.getPrincipal().getUsername());
		AsmEntity asm = asmRepository.findOne(subAsmDTO.getAsmId());
		SubasmEntity entity = new SubasmEntity();
		entity.setAsm(asm);
		entity.setUser(user);
		entity.setSubFile(subAsmDTO.getFileName());
		entity.setSubStatus(1);
		entity.setGrade(-1);
		entity.setComment(subAsmDTO.getComment());
		user.getSubasmuser().add(entity);
		userRepository.save(user);
		return subAsmConverter.toDto(subAsmRepository.save(entity));
	}

	@Override
	public SubAsmDTO editAsm(SubAsmDTO subAsmDTO){
		UserEntity user = userRepository.findOne(SecurityUtils.getPrincipal().getUsername());
		SubasmEntity entity = subAsmRepository.findOne(subAsmDTO.getSubAsmId());
		try {
			Path oldSubmitFile = Paths.get(locationOfSubmitAsm + entity.getSubFile());
			Files.deleteIfExists(oldSubmitFile);
		}catch (Exception e){
			e.printStackTrace();
		}
		entity.setSubFile(subAsmDTO.getFileName());
		entity.setSubStatus(1);
		entity.setGrade(-1);
		entity.setComment(subAsmDTO.getComment());
		user.getSubasmuser().stream().filter(s -> s.getSubasmId().equals(subAsmDTO.getSubAsmId())).map(x-> entity);
		userRepository.save(user);
		return subAsmConverter.toDto(subAsmRepository.save(entity));
	}

	@Override
	public String uploadFile(MultipartFile file){
		String gen = generateUniqueFileName(SecurityUtils.getPrincipal().getUsername(), file.getOriginalFilename());
		System.out.println("FILE NAME: " + gen);
		try {
			Path path = Paths.get(locationOfSubmitAsm);
			InputStream ip = file.getInputStream();
			Files.copy(ip, path.resolve(gen), StandardCopyOption.REPLACE_EXISTING);
		}catch (Exception e){
			e.printStackTrace();
		}
		return gen;
	}
	
	
	public boolean isOverDue(SubasmEntity subAsm) {
		long a = subAsm.getModifiedDate().getTime();
		long b = subAsm.getAsm().getAsmDateDue().getTime() + (subAsm.getAsm().getAsmTimeDue().getHours() * 60 * 60 + subAsm.getAsm().getAsmTimeDue().getMinutes()* 60 + subAsm.getAsm().getAsmTimeDue().getSeconds())*1000; 
		return a > b ? true : false;
	}

	@Override
	public String generateUniqueFileName(String username, String fileName){
		return username + "-" + UUID.randomUUID().toString().replace("-", "") + "-+I+-+d+-+E+-+N+-+t+-+I+-+f+-+E+-+r+-" + fileName;
	}

	@Override
	public List<SubAsmDTO> findByAsmId(Long id){
		return subAsmRepository.findAll().stream().filter(s -> s.getAsm().getAsmId().equals(id)).map(s -> subAsmConverter.toDto(s)).collect(Collectors.toList());
	}
}
