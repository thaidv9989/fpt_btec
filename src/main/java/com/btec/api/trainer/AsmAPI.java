package com.btec.api.trainer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.btec.dto.AsmDTO;
import com.btec.service.IAsmService;

@RestController(value = "asmAPIOfTrainer")
public class AsmAPI {
	
	@Autowired
	private IAsmService asmService;
	
	@PostMapping("/api/asm")
	public AsmDTO createAsm(@RequestBody AsmDTO createasmDTO) {
		return asmService.save(createasmDTO);
	}
	
	@PutMapping("/api/asm")
	public AsmDTO updateAsm(@RequestBody AsmDTO updateasmDTO) {
		return asmService.save(updateasmDTO);
	}
	
	@DeleteMapping("/api/asm")
	public void deleteAsm(@RequestBody long[] asmIds) {
		asmService.delete(asmIds);
	}
}
