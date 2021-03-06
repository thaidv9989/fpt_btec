package com.btec.api.staff;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.btec.dto.ClassDTO;
import com.btec.dto.MajorDTO;
import com.btec.service.IClassService;
import com.btec.util.SecurityUtils;

@RestController(value = "classAPIOfStaff")
public class ClassAPI {
	
	@Autowired
	private IClassService classService;
	
	@PostMapping("/api/class")
	public ClassDTO addNewClass(@RequestBody ClassDTO newclassDTO) {
		return classService.save(newclassDTO);
	
	}
	@PutMapping("/api/class")
	public ClassDTO editClass(@RequestBody ClassDTO editclassDTO) {
		return classService.save(editclassDTO);
	}
	@DeleteMapping("/api/class")
	public void deleteClass(@RequestBody long[] classIds) {
		classService.delete(classIds);
	}
	@PostMapping("/api/class/join-class")
	public ResponseEntity<?> joinClass(@RequestBody ClassDTO dto){
		return classService.joinClass(dto, SecurityUtils.getPrincipal().getUsername()) ?  ResponseEntity.ok("Joined") : ResponseEntity.badRequest().build();
	}

	@PostMapping("/api/class/cp")
	public ResponseEntity<?> checkPass(@RequestBody ClassDTO dto){
		return classService.checkClassPassword(dto) ? ResponseEntity.ok(true) : ResponseEntity.badRequest().build();
	}

	@GetMapping("/api/class/gen")
	public ResponseEntity<?> getLinkClass(@RequestParam Long id){
		return ResponseEntity.ok(classService.genLinkInvite(id));
	}
	@GetMapping("/api/class/ce")
	public ResponseEntity<?> checkExsist(@RequestParam(name = "name") String className){
		return classService.isExsist(className) ? ResponseEntity.ok(true) : ResponseEntity.ok(false);
	}
	

}
