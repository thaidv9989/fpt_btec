package com.btec.api.admin;

import com.btec.dto.SubjectDTO;
import com.btec.service.ISubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api-subjects")
public class SubjectAPI {

    @Autowired
    ISubjectService subjectService;

    @GetMapping("")
    public ResponseEntity<?> getAll(@RequestParam(name = "subjectName", defaultValue = "") String subjectName,
                                    @RequestParam(name = "subjectId", defaultValue = "") String subjectId,
                                    @RequestParam(name = "majorName", defaultValue = "") String majorName) {
        if (!subjectName.equals("") && subjectId.equals("") && majorName.equals("")) {
            return ResponseEntity.ok(subjectService.getListByName(subjectName));
        }
        if (subjectName.equals("") && !subjectId.equals("") && majorName.equals("")) {
            return ResponseEntity.ok(subjectService.getListById(Long.valueOf(subjectId)));
        }
        if (subjectName.equals("") && subjectId.equals("") && !majorName.equals("")) {
            return ResponseEntity.ok(subjectService.getListByMajorName(majorName));
        }
        return ResponseEntity.ok(subjectService.getAllSubjects());
    }

    @PostMapping("")
    public ResponseEntity<?> create(@RequestBody SubjectDTO subjectDTO){
        if(!subjectDTO.getSubjectName().trim().equals("") && subjectService.create(subjectDTO) != null){
            return ResponseEntity.ok("Created");
        }
        return ResponseEntity.badRequest().build();
    }

    @DeleteMapping("")
    public ResponseEntity<?> delete(@RequestParam Long id){
        if(subjectService.delete(id)) return ResponseEntity.ok("DELETED");
        return ResponseEntity.badRequest().build();
    }
}
