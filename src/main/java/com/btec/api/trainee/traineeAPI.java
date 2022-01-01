package com.btec.api.trainee;

import com.btec.dto.ClassDTO;
import com.btec.dto.SubAsmDTO;
import com.btec.service.ISubAsmService;
import com.btec.service.IUserService;
import com.btec.util.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/trainee-api")
public class traineeAPI {

    @Autowired
    private IUserService userService;

    @Autowired
    private ISubAsmService subAsmService;


    @GetMapping("/classes")
    public ResponseEntity<List<ClassDTO>> getClasses(@RequestParam(name = "subjectName", defaultValue = "") String subjectName){
        if(SecurityUtils.getPrincipal().getUsername() != null){
            if(subjectName.equals("")){
                return ResponseEntity.ok((userService.getClassesOfTrainee(SecurityUtils.getPrincipal().getUsername())));
            }
            return ResponseEntity.ok((userService.getClassesOfTrainee(SecurityUtils.getPrincipal().getUsername())).stream().filter(c -> c.getSubjectName().toLowerCase().contains(subjectName.toLowerCase())).collect(Collectors.toList()));
        }
        return ResponseEntity.badRequest().build();
    }

    @PostMapping("/upload")
    public ResponseEntity<?> handleUploadFile(@RequestParam("fileSubmit") MultipartFile fileSubmit){
        if(fileSubmit.isEmpty()){
            return ResponseEntity.badRequest().build();
        }
        return ResponseEntity.ok(subAsmService.uploadFile(fileSubmit));
    }

    @GetMapping("/submission-info")
    public ResponseEntity<?> getSubmissionInfo(@RequestParam("asmId") String asmId){
        if(asmId.trim() != ""){
            return ResponseEntity.ok(subAsmService.getSubmissionAsmByUsernameAndAsmId(Long.parseLong(asmId)));
        }
        return ResponseEntity.badRequest().build();
    }

    @PostMapping("/submit-asm")
    public ResponseEntity<?> submitAsm(@RequestBody SubAsmDTO dto){
        if(dto != null){
            return ResponseEntity.ok(subAsmService.submitAsm(dto));
        }
        return ResponseEntity.badRequest().build();
    }

    @PostMapping("/edit-asm")
    public ResponseEntity<?> editAsm(@RequestBody SubAsmDTO dto){
        if(dto != null){
            return ResponseEntity.ok(subAsmService.editAsm(dto));
        }
        return ResponseEntity.badRequest().build();
    }


}
