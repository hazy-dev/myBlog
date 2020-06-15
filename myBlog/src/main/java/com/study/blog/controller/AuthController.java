package com.study.blog.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.study.blog.model.Auth;
import com.study.blog.service.AuthService;
import com.study.blog.util.CommandMap;
import com.study.blog.util.CommonUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class AuthController {
	
	@Autowired
	private AuthService authService;

	Gson gson = CommonUtils.getGson();
	
	@RequestMapping(value = "/auth", method = RequestMethod.GET)
	public ModelAndView auth(Locale locale, Model model) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("auth/auth");
		
		return mav;
	}
	
	
	@RequestMapping(value = "/auth_list", method = RequestMethod.POST)
	public ModelAndView auth_list( HttpServletRequest req , HttpServletResponse res, CommandMap commandMap, HttpSession session) throws Exception {
		res.setCharacterEncoding("UTF-8");
		int auth = Integer.parseInt(session.getAttribute("auth").toString());
		 
		List<Auth> admin_list = null;
		if( auth == 0 ) {
			admin_list =  authService.auth_list(commandMap.getMap());
		}
		
		LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("list", admin_list);
		return CommonUtils.directWrite(res, gson.toJson(map));
	}
	
	@RequestMapping(value = "/auth_update", method = RequestMethod.POST)
	public ModelAndView update_auth( HttpServletRequest req , HttpServletResponse res, CommandMap commandMap, HttpSession session) throws Exception {
		res.setCharacterEncoding("UTF-8");
		
		commandMap.getMap().put("idx", req.getParameter("idx"));
		commandMap.getMap().put("auth_group", req.getParameter("auth_group"));
		
		int auth = Integer.parseInt(session.getAttribute("auth").toString());
		int update_result = 0;
		if( auth == 0 ) {
			update_result =  authService.update_auth(commandMap.getMap());
		}
		
		LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("list", update_result);
		return CommonUtils.directWrite(res, gson.toJson(map));
	}
	
	@RequestMapping(value = "/auth_add", method = RequestMethod.GET)
	public ModelAndView auth_add(Locale locale, Model model) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("auth/user_add");
		
		return mav;
	}
	
	@RequestMapping(value = "/auth_user_check", method = {  RequestMethod.GET, RequestMethod.POST } )
	public ModelAndView auth_user_check( HttpServletRequest req , HttpServletResponse res, CommandMap commandMap) throws Exception {
		res.setCharacterEncoding("UTF-8");
		
		commandMap.getMap().put("user_id", req.getParameter("user"));
		
		int menu_cnt = authService.user_check(commandMap.getMap());
		
		LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("data", menu_cnt);
		return CommonUtils.directWrite(res, gson.toJson(map));
	}
	
	
	@RequestMapping(value = "/auth_user_insert", method = {  RequestMethod.GET, RequestMethod.POST } )
	public ModelAndView auth_user_insert( HttpServletRequest req , HttpServletResponse res, CommandMap commandMap) throws Exception {
		res.setCharacterEncoding("UTF-8");
		
		commandMap.getMap().put("user_id", req.getParameter("user_id"));
		commandMap.getMap().put("user_password", req.getParameter("user_password"));
		commandMap.getMap().put("nickname", req.getParameter("nickname"));
		commandMap.getMap().put("user_auth_selectbox", req.getParameter("user_auth_selectbox"));
		
		int max_auth = authService.max_auth();
		
		commandMap.getMap().put("max_auth", max_auth);
		
		int insert_result = authService.user_insert(commandMap.getMap());
		
		System.out.println("insert_result : " + insert_result);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", insert_result);
		mav.setViewName("auth/user_add_ok");
		return mav;
	}
	
}
