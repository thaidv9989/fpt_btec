package com.btec.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SubjectController {

    @GetMapping("/admin/subjects")
    public String subjectPage(){
        return "admin/subject/subject";
    }

}
