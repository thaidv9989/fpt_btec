package com.btec.controller.admin;

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

import com.btec.dto.UserDTO;
import com.btec.service.IRoleService;
import com.btec.service.IUserService;
import com.btec.util.MessageUtil;

@Controller(value = "userControllerOfAdmin")
public class AccountController{

	@Autowired
	private IUserService userService;
	
	@Autowired
	private IRoleService roleService;
	
	@Autowired
	private MessageUtil messageUtil;

	@RequestMapping(value = "/admin/user-manage", method = RequestMethod.GET)
	public ModelAndView showList(HttpServletRequest request) {
		UserDTO model = new UserDTO();
		ModelAndView mav = new ModelAndView("admin/account/listuser");
		model.setListResult(userService.findAll());
		if (request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = "/admin/user-manage/inactive-users", method = RequestMethod.GET)
	public ModelAndView inactiveUsers(HttpServletRequest request) {
		UserDTO model = new UserDTO();
		ModelAndView mav = new ModelAndView("admin/account/inactiveUsers");
		model.setListResult(userService.findAllInactiveUser());
		if (request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = {"/admin/user-manage/create", "/admin/user-manage/edit/{username}"}, method = RequestMethod.GET)
	public ModelAndView editUser(@PathVariable(value = "username", required = false) String username, HttpServletRequest request) {
		ModelAndView mav;
		UserDTO model = new UserDTO();
		mav = new ModelAndView("admin/account/addAcc");
		if (username != null) {
			model = userService.findOne(username);
		}
		if (request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("model", model);
		mav.addObject("rolemodel", roleService.findAllRole(username));
		return mav;
	}
}
