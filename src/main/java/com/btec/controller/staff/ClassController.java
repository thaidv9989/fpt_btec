package com.btec.controller.staff;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.btec.dto.ClassDTO;
import com.btec.service.IClassService;
import com.btec.service.IContentService;
import com.btec.service.ISubjectService;
import com.btec.service.IUserService;
import com.btec.util.MessageUtil;

@Controller(value = "classControllerOfStaff")
public class ClassController {
	
	@Autowired
	private MessageUtil messageUtil;
	
	@Autowired
	private IClassService classService;
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private ISubjectService subjectService;
	
	@Autowired
	private IContentService contentService;
	
	@RequestMapping(value = "/staff/edit", method = RequestMethod.GET)
	public ModelAndView addClass(@RequestParam(value = "classId", required = false) Long classId, HttpServletRequest request) {
		ModelAndView mav;
		ClassDTO classmodel = new ClassDTO();
		mav = new ModelAndView("staff/editClass");
		if (classId != null) {
			classmodel = classService.findOne(classId);
		}
		else {
			mav = new ModelAndView("staff/addclass");
		}
		if (request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("usermodel", userService.findAllTrainer());
		mav.addObject("subjectmodel", subjectService.findAll());
		mav.addObject("contentmodel", contentService.findAll());
		mav.addObject("classmodel", classmodel);
		return mav;
	}
}
