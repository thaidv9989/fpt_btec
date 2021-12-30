package com.btec.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.btec.service.ISubjectService;

@Controller
public class SubjectController {

	@Autowired
	private ISubjectService subjectService;
}
