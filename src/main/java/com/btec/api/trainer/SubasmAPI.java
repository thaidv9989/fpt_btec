package com.btec.api.trainer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.btec.dto.SubAsmDTO;
import com.btec.service.ISubAsmService;

@RestController(value = "subasmAPIOfTrainer")
public class SubasmAPI {
	
	@Autowired
	private ISubAsmService subAsmService;
	
	@PutMapping("/api/subasm")
	public SubAsmDTO savePass(@RequestBody SubAsmDTO gradeDTO) {
		return subAsmService.savegrade(gradeDTO);
	}
}
