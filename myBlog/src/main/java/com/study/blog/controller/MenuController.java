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
import com.study.blog.model.Main;
import com.study.blog.model.Menu;
import com.study.blog.service.MainService;
import com.study.blog.service.MenuService;
import com.study.blog.util.CommandMap;
import com.study.blog.util.CommonUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class MenuController {

	@Autowired
	private MenuService menuService;
	
	@Autowired
	private MainService mainService;
	
	Gson gson = CommonUtils.getGson();
	
	@RequestMapping(value = "/menu", method = RequestMethod.GET)
	public ModelAndView menu(Locale locale, Model model) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("menu/menu");
		
		return mav;
	}
	
	
	@RequestMapping(value = "/menu_list", method = RequestMethod.POST)
	public ModelAndView menu_list( HttpServletRequest req , HttpServletResponse res, CommandMap commandMap, HttpSession session) throws Exception {
		res.setCharacterEncoding("UTF-8");
		
		int auth = Integer.parseInt(session.getAttribute("auth").toString());
		int auth_group = Integer.parseInt(session.getAttribute("auth_group").toString());
		 
		commandMap.getMap().put("auth_group", auth_group);
		commandMap.getMap().put("auth", auth);
		
		List<Menu> menu_list = null;
		if( auth_group == 0 || auth_group == 1) {
			menu_list =  menuService.menu_list(commandMap.getMap());
		}
		
		int max_seq = menuService.max_seq();
		//max_seq = max_seq - 1;
		
		LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("list", menu_list);
		map.put("max_seq", max_seq);
		return CommonUtils.directWrite(res, gson.toJson(map));
	}
	
	@RequestMapping(value = "/menu_auth_update", method = RequestMethod.POST)
	public ModelAndView update_menu_auth( HttpServletRequest req , HttpServletResponse res, CommandMap commandMap, HttpSession session) throws Exception {
		res.setCharacterEncoding("UTF-8");
		
		int auth = Integer.parseInt(session.getAttribute("auth").toString());
		 
		commandMap.getMap().put("menu_auth", req.getParameter("menu_auth"));
		commandMap.getMap().put("idx", req.getParameter("idx"));
		
		int menu_list = 0;
		if( auth == 0 ) {
			menu_list =  menuService.update_menu_auth(commandMap.getMap());
		}
		
		LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("data", menu_list);
		return CommonUtils.directWrite(res, gson.toJson(map));
	}
	
	@RequestMapping(value = "/menu_seq_update", method = RequestMethod.POST)
	public ModelAndView update_menu_seq( HttpServletRequest req , HttpServletResponse res, CommandMap commandMap, HttpSession session) throws Exception {
		res.setCharacterEncoding("UTF-8");
		
		int auth = Integer.parseInt(session.getAttribute("auth").toString());
		 
		commandMap.getMap().put("seq", req.getParameter("seq"));
		commandMap.getMap().put("idx", req.getParameter("idx"));
		
		int menu_list = 0;
		if( auth == 0 ) {
			menu_list =  menuService.update_menu_seq(commandMap.getMap());
		}
		
		LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("data", menu_list);
		return CommonUtils.directWrite(res, gson.toJson(map));
	}
	
	@RequestMapping(value = "/menu_hide_update", method = RequestMethod.POST)
	public ModelAndView update_menu_hide( HttpServletRequest req , HttpServletResponse res, CommandMap commandMap, HttpSession session) throws Exception {
		res.setCharacterEncoding("UTF-8");
		
		int auth = Integer.parseInt(session.getAttribute("auth").toString());
		 
		commandMap.getMap().put("hide", req.getParameter("hide"));
		commandMap.getMap().put("idx", req.getParameter("idx"));
		
		int menu_list = 0;
		if( auth == 0 ) {
			menu_list =  menuService.update_menu_hide(commandMap.getMap());
		}
		
		LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("data", menu_list);
		return CommonUtils.directWrite(res, gson.toJson(map));
	}
	
	@RequestMapping(value = "/menu_add", method = RequestMethod.GET)
	public ModelAndView menu_add(Locale locale, Model model) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("menu/menu_add");
		
		return mav;
	}
	
	@RequestMapping(value = "/menu_user_select", method = {  RequestMethod.GET, RequestMethod.POST } )
	public ModelAndView menu_user_select( HttpServletRequest req , HttpServletResponse res, CommandMap commandMap) throws Exception {
		res.setCharacterEncoding("UTF-8");
		
		List<Main> user_list =  mainService.user_list();
		
		LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("list", user_list);
		return CommonUtils.directWrite(res, gson.toJson(map));
	}
	
	@RequestMapping(value = "/menu_check", method = {  RequestMethod.GET, RequestMethod.POST } )
	public ModelAndView menu_check( HttpServletRequest req , HttpServletResponse res, CommandMap commandMap) throws Exception {
		res.setCharacterEncoding("UTF-8");
		
		System.out.println("menu : " + req.getParameter("menu"));
		commandMap.getMap().put("menu", req.getParameter("menu"));
		
		int menu_cnt = menuService.menu_check(commandMap.getMap());
		
		LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("data", menu_cnt);
		return CommonUtils.directWrite(res, gson.toJson(map));
	}
	
	@RequestMapping(value = "/menu_move_check", method = {  RequestMethod.GET, RequestMethod.POST } )
	public ModelAndView move_check( HttpServletRequest req , HttpServletResponse res, CommandMap commandMap) throws Exception {
		res.setCharacterEncoding("UTF-8");
		
		commandMap.getMap().put("move", req.getParameter("move"));
		
		int move_cnt = menuService.menu_move_check(commandMap.getMap());
		
		LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("data", move_cnt);
		return CommonUtils.directWrite(res, gson.toJson(map));
	}
	
	@RequestMapping(value = "/menu_insert", method = {  RequestMethod.GET, RequestMethod.POST } )
	public ModelAndView insert_menu( HttpServletRequest req , HttpServletResponse res, CommandMap commandMap) throws Exception {
		res.setCharacterEncoding("UTF-8");
		
		commandMap.getMap().put("menu", req.getParameter("menu"));
		commandMap.getMap().put("move", req.getParameter("move"));
		commandMap.getMap().put("admin_selectbox", req.getParameter("admin_selectbox"));
		commandMap.getMap().put("menu_auth_selectbox", req.getParameter("menu_auth_selectbox"));
		commandMap.getMap().put("hide_selectbox", req.getParameter("hide_selectbox"));
		
		int max_seq = menuService.max_seq();
		
		commandMap.getMap().put("max_seq", max_seq);
		
		int insert_result = menuService.menu_insert(commandMap.getMap());
		
		System.out.println("insert_result : " + insert_result);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", insert_result);
		mav.setViewName("menu/menu_add_ok");
		return mav;
	}
	
}
