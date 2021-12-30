package com.btec.controller.trainer;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.btec.dto.AsmDTO;
import com.btec.dto.ClassDTO;
import com.btec.dto.SubAsmDTO;
import com.btec.service.IAsmService;
import com.btec.service.IClassService;
import com.btec.service.ISubAsmService;
import com.btec.util.MessageUtil;

@Controller(value = "asmControllerOfTrainer")
public class AsmController {

	@Autowired
	private ISubAsmService subAsmService;
	
	@Autowired
	private IAsmService asmService;
	
	@Autowired
	private IClassService classService;
	
	@Autowired
	private MessageUtil messageUtil;

	@RequestMapping(value = "/trainer/manageclass/class-overview", method = RequestMethod.GET)
	public ModelAndView classOverview(@RequestParam(value = "classId") Long classId, @RequestParam("page") int page, @RequestParam("limit") int limit,
			HttpServletRequest request) {
		AsmDTO model = new AsmDTO();
		ClassDTO modelclass = new ClassDTO();
		modelclass = classService.findOne(classId);
		model.setPage(page);
		model.setLimit(limit);
		ModelAndView mav = new ModelAndView("trainer/classoverview");
		Pageable pageable = new PageRequest(page - 1, limit);
		model.setListResult(classService.findByClassId(classId));
		model.setTotalItem(asmService.getTotalItem());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		if (request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("classinfo", modelclass);
		mav.addObject("model", model);
		return mav;
	}

	@RequestMapping(value = "/trainer/classoverview/edit", method = RequestMethod.GET)
	public ModelAndView createEditAsm(@RequestParam(value = "asmId", required = false) Long asmId, HttpServletRequest request) {
		ModelAndView mav;
		SubAsmDTO subasm = new SubAsmDTO();
		AsmDTO model = new AsmDTO();
		
		if (asmId != null) {
			mav = new ModelAndView("trainer/class/contentdetail");
			model = asmService.findById(asmId);
			subasm.setListResult(subAsmService.findAll());
			mav.addObject("subasmlist", subasm);
		}
		else
		{
			mav = new ModelAndView("trainer/class/createasm");
		}
		if (request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("classlist", classService.findAll());
		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = "/trainer/classoverview/editpass", method = RequestMethod.GET)
	public ModelAndView editPass(@RequestParam (value = "classId") Long classId, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("trainer/class/editpassword");
		ClassDTO modelclass = new ClassDTO();
		modelclass = classService.findOne(classId);
		if (request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("classinfo", modelclass);
		return mav;
	}
	
	@RequestMapping(value = "/trainer/classoverview/grade-subasm", method = RequestMethod.GET)
	public ModelAndView gradeSubasm(@RequestParam (value = "subAsmId") Long subAsmId, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("trainer/class/subasmdetail");
		SubAsmDTO modelsubasm = new SubAsmDTO();
		modelsubasm = subAsmService.findById(subAsmId);
		if (request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("subasminfo", modelsubasm);
		return mav;
	}
}
