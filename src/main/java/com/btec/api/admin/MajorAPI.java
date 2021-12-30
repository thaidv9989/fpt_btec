package com.btec.api.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.btec.dto.MajorDTO;
import com.btec.service.IMajorService;

@RestController
@RequestMapping("api-majors")
@CrossOrigin(origins = "*")
public class MajorAPI {
	
	@Autowired
	private IMajorService majorService;
	
	@PostMapping("")
	public ResponseEntity<String> create(@RequestBody MajorDTO major) {
		if(!major.getMajorName().equals(null) && majorService.create(major)!= null) {
			return ResponseEntity.ok("Created");
		}
		return ResponseEntity.badRequest().build();
	}
	
	@GetMapping("/detail")
	public ResponseEntity<MajorDTO> details(@RequestParam(name = "id") String id) {
		if(id != null) {
			return ResponseEntity.ok(majorService.findById(Long.parseLong(id)));
		}
		return ResponseEntity.badRequest().build();
	}
	
	@PutMapping("/detail")
	public ResponseEntity<String> update(@RequestBody MajorDTO major) {
		if(majorService.update(major)!= null) {
			return new ResponseEntity<>("Updated", HttpStatus.OK);
		}
		return ResponseEntity.badRequest().body("Major ID in request must not be null !");
	}
	
	@DeleteMapping("")
	public ResponseEntity<String> delete(@RequestParam(name = "id") String id) {
		if(majorService.delete(Long.parseLong(id))) {
			return new ResponseEntity<>("Deleted", HttpStatus.OK);
		}
		return ResponseEntity.badRequest().body("ID must not be null or empty");
	}
	
	@GetMapping("")
	public ResponseEntity<List<MajorDTO>> getMajors(@RequestParam(name = "name", defaultValue = "") String name, @RequestParam(name = "id", defaultValue = "") String id) {
		if(!name.equals("") && id.equals("")) {
			return ResponseEntity.ok(majorService.searchByMajorName(name));
		}
		if(name.equals("") && !id.equals("")) {
			return ResponseEntity.ok(majorService.searchByMajorID(Long.parseLong(id)));
		}
		return ResponseEntity.ok(majorService.findListAll());
	}
}
