package com.btec.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/majors")
public class MajorController {
	@GetMapping("")
	public String majorHome() {
		return "admin/major";
	}
}
