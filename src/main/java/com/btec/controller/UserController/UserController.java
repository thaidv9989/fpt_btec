package com.btec.controller.UserController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.btec.util.SecurityUtils;

@Controller
public class UserController {
	

	
	@GetMapping("/user/changepass")
	public String getPage(Model model){
		model.addAttribute("username",SecurityUtils.getPrincipal().getUsername());
		
		return "changepass";
		
	}

}
