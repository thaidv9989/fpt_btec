package com.btec.controller.trainee;

import com.btec.dto.AsmDTO;
import com.btec.entity.AsmEntity;
import com.btec.service.IAsmService;
import com.btec.service.IClassService;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/trainee")
public class HomeController {
	@Autowired
	private IClassService classService;

	@Autowired
	private IAsmService asmService;

	@GetMapping("/home")
	public String accessDenied() {
		return"trainee/home";
	}

	@GetMapping("/classes")
	public String myClasses(){
		return "trainee/class";
	}

	@GetMapping("/class-details")
	public String classDetail(@RequestParam String id, Model model){
		model.addAttribute("assignment", classService.findAsmByUsernameAndClassId(Long.parseLong(id)));
		model.addAttribute("content", classService.findOne(Long.parseLong(id)).getContentLink());
		return "trainee/class-detail";
	}

	@GetMapping("/submit-asm")
	public String submitDetail(@RequestParam String id, Model model){
		AsmDTO a = asmService.findById(Long.parseLong(id));
		long due =  a.getAsmDateDue().getTime() + (a.getAsmTimeDue().getHours() * 60 * 60 + a.getAsmTimeDue().getMinutes()* 60 + a.getAsmTimeDue().getSeconds())*1000;
		model.addAttribute("due", new Timestamp(due));
		model.addAttribute("assignment", a);
		return "trainee/submit-asm";
	}
}
