package com.study.blog.controller;

import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.jni.Local;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.study.blog.util.CommandMap;
import com.study.blog.util.CommonUtils;
import com.google.gson.Gson;
import com.study.blog.model.Main;
import com.study.blog.model.Menu;
import com.study.blog.service.MainService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class MainController {

	@Autowired
	private MainService mainService;
	
	Gson gson = CommonUtils.getGson();
	
	@RequestMapping("/")
	public ModelAndView main() {
			
		return new ModelAndView("main");
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView home(Local locale, Model model, HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		if( session.getAttribute("name") == null ) {
			mav.setViewName("main");
		}else {
			mav.setViewName("main/main");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/admin_login", method = RequestMethod.POST)
	public ModelAndView admin_login( HttpServletRequest req , HttpServletResponse res, CommandMap commandMap, HttpSession session) throws Exception {
		
		log.debug("관리자 로그인");
		
		res.setCharacterEncoding("UTF-8");
		
		commandMap.getMap().put("ID", req.getParameter("id"));
		commandMap.getMap().put("PWD", req.getParameter("pw"));
		
		List<Main> admin_list =  mainService.selectAdminLogin(commandMap.getMap());
		
		if( admin_list.size() != 0) {
			session.setAttribute("name", admin_list.get(0).getName());
			session.setAttribute("auth", admin_list.get(0).getAuth());
			session.setAttribute("auth_group", admin_list.get(0).getAuthGroup());
		}
		
		System.out.println(admin_list);
		
		LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
		
		map.put("data", admin_list.size());
		
		return CommonUtils.directWrite(res, gson.toJson(map));
	}
	
	@RequestMapping(value = "/admin_guest_login", method = RequestMethod.POST)
	public ModelAndView guest_login( HttpServletRequest req , HttpServletResponse res, HttpSession session) throws Exception {
		res.setCharacterEncoding("UTF-8");
		
		log.debug("게스트 로그인");
		
		session.setAttribute("name", "guest");
		
		LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
		
		map.put("data", "1");
		
		return CommonUtils.directWrite(res, gson.toJson(map));
	}
	
	@RequestMapping(value = "/main_create_menu", method = RequestMethod.POST)
	public ModelAndView create_menu( HttpServletRequest req , HttpServletResponse res, CommandMap commandMap, HttpSession session) throws Exception {
		res.setCharacterEncoding("UTF-8");
		
		System.out.println("auth : " + req.getParameter("auth") );
		
		if( "-1".equals(req.getParameter("auth"))  ) {
			commandMap.getMap().put("guest", "guest");
		}else {
			commandMap.getMap().put("guest", "admin");
			commandMap.getMap().put("auth", req.getParameter("auth") );
			commandMap.getMap().put("auth_group", req.getParameter("auth_group") );
		}
		
		List<Menu> menu_list = mainService.create_menu(commandMap.getMap());
		
		
		LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("menu", menu_list);
		return CommonUtils.directWrite(res, gson.toJson(map));
	}
	
	@RequestMapping(value = "/main_logout", method = RequestMethod.POST)
	public ModelAndView logout( HttpServletRequest req , HttpServletResponse res, CommandMap commandMap, HttpSession session) throws Exception {
		res.setCharacterEncoding("UTF-8");
		
		session.invalidate();
		
		LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("result", "1");
		return CommonUtils.directWrite(res, gson.toJson(map));
	}
	
	@RequestMapping(value = "/main_calendar_date", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView calendar_date( HttpServletRequest req , HttpServletResponse res, CommandMap commandMap, HttpSession session) throws Exception {
		res.setCharacterEncoding("UTF-8");
		
		commandMap.getMap().put("name", session.getAttribute("name"));
		
		String nextDate = req.getParameter("date");
		List<Main> calendar_date = mainService.calendar_date(commandMap.getMap());
		
		LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("result", calendar_date);
		map.put("date", nextDate);
		return CommonUtils.directWrite(res, gson.toJson(map));
	}
	
	//main_board_list
	@RequestMapping(value = "/main_board_list", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView main_board_list( HttpServletRequest req , HttpServletResponse res, CommandMap commandMap, HttpSession session) throws Exception {
		res.setCharacterEncoding("UTF-8");
		
		String nextDate = req.getParameter("date");
		commandMap.getMap().put("Cdate", nextDate);
		commandMap.getMap().put("name", session.getAttribute("name"));
		commandMap.getMap().put("auth", session.getAttribute("auth"));
		
		List<Main> board_list = mainService.board_list( commandMap.getMap() );
		
		LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("list", board_list);
		return CommonUtils.directWrite(res, gson.toJson(map));
	}
	
	@RequestMapping(value = "/main_add_counter", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView main_add_counter( HttpServletRequest req , HttpServletResponse res, CommandMap commandMap, HttpSession session) throws Exception {
		res.setCharacterEncoding("UTF-8");
		
		commandMap.getMap().put("getip", req.getParameter("ip"));
		
		int into_blog = mainService.into_blog(commandMap.getMap());
		System.out.println(into_blog);
		
		// 오늘 , 어제 , 전체 합  가져오기  ( today , yesterday, total )
		List<Main> counter = mainService.getCounter();
		
		LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("data", counter);
		return CommonUtils.directWrite(res, gson.toJson(map));
	}
}
