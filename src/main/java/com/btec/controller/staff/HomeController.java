package com.btec.controller.staff;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.btec.dto.ClassDTO;
import com.btec.dto.UserDTO;
import com.btec.service.IClassService;
import com.btec.service.IUserService;
import com.btec.util.MessageUtil;

@Controller(value = "homeControllerOfStaff")
public class HomeController {
	
	@Autowired
	private IClassService classService;
	
	@Autowired
	private IUserService userService;
	
	@Autowired MessageUtil messageUtil;
	
	@RequestMapping(value = "/staff/home", method = RequestMethod.GET)
	public ModelAndView accessDenied() {
		ModelAndView mav = new ModelAndView("staff/home");
		return mav;
	}
	
	@RequestMapping(value = "/staff/manageclass", method = RequestMethod.GET)
	   public ModelAndView manageClass(@RequestParam("page") int page, @RequestParam("limit") int limit,
				HttpServletRequest request) {
		ClassDTO model = new ClassDTO();
		model.setPage(page);
		model.setLimit(limit);
		ModelAndView mav = new ModelAndView("staff/listClass");
		Pageable pageable = new PageRequest(page - 1, limit);
		model.setListResult(classService.findAll(pageable));
		model.setTotalItem(classService.getTotalItem());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		if (request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("model", model);
		return mav;
	   }
	
	
}
