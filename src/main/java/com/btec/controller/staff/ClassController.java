package com.btec.controller.staff;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.btec.dto.AsmDTO;
import com.btec.dto.ClassDTO;
import com.btec.dto.SubAsmDTO;
import com.btec.dto.UserDTO;
import com.btec.service.IClassService;
import com.btec.service.IContentService;
import com.btec.service.ISubAsmService;
import com.btec.service.ISubjectService;
import com.btec.service.IUserService;
import com.btec.util.MessageUtil;
import com.btec.util.SecurityUtils;

@Controller(value = "classControllerOfStaff")
public class ClassController {
	
	@Autowired
	private MessageUtil messageUtil;
	
	@Autowired
	private IClassService classService;
	
	@Autowired
	private ISubAsmService subAsmService;
	
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
	@RequestMapping(value = "/staff/class/{classId}/mng", method = RequestMethod.GET)
	public ModelAndView mngClass(@PathVariable(value = "classId", required = false) Long classId, HttpServletRequest request) {
		ModelAndView mav;
		UserDTO userlist = new UserDTO();
		UserDTO traineelist = new UserDTO();
		ClassDTO classDTO = classService.findOne(classId);
		traineelist.setListResult(userService.findAllTrainee());
		userlist.setListResult(classService.listTraineeOfClass(classId, SecurityUtils.getPrincipal().getUsername()));
		mav = new ModelAndView("staff/managestudent");
		mav.addObject("users", userlist);
		mav.addObject("trainees", traineelist);
		mav.addObject("classinfo", classDTO);
		return mav;
	}
	@RequestMapping(value = "/staff/class/{classId}/report", method = RequestMethod.GET)
	public ModelAndView gradeReport(@PathVariable(value = "classId", required = false) Long classId, HttpServletRequest request) {
		ModelAndView mav;
		AsmDTO asmlist = new AsmDTO();
		ClassDTO classDTO = classService.findOne(classId);
		asmlist.setListResult(classService.findAsmByClassId(classId));
		mav = new ModelAndView("staff/gradereport");
		mav.addObject("asmIds", asmlist);
		mav.addObject("classinfo", classDTO);
		return mav;
	}
	@RequestMapping(value = "/staff/class/{classId}/reportdetail/{asmId}", method = RequestMethod.GET)
	public ModelAndView gradeReportDetail(@PathVariable(value = "classId", required = false) Long classId, @PathVariable(value = "asmId", required = false) Long asmId, HttpServletRequest request) {
		ModelAndView mav;
		AsmDTO asmlist = new AsmDTO();
		UserDTO userlist = new UserDTO();
		SubAsmDTO subAsmDTO = new SubAsmDTO();
		subAsmDTO.setListResult(subAsmService.findAllByAsmId(asmId));
		userlist.setListResult(classService.listTraineeOfClass(classId, SecurityUtils.getPrincipal().getUsername()));
		asmlist.setListResult(classService.findAsmByClassId(classId));
		mav = new ModelAndView("staff/gradereportdetail");
		mav.addObject("users", userlist);
		mav.addObject("asmIds", asmlist);
		mav.addObject("subAsms", subAsmDTO);
		return mav;
	}
}
