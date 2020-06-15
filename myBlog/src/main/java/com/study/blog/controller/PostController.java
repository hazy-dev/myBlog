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
import com.study.blog.model.Post;
import com.study.blog.service.PofolService;
import com.study.blog.util.CommandMap;
import com.study.blog.util.CommonUtils;
import com.study.blog.util.Pagination;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class PostController {
	
	@Autowired
	private PofolService pofolService;

	Gson gson = CommonUtils.getGson();
	
	@RequestMapping(value = "/post", method = RequestMethod.GET)
	public ModelAndView post(Locale locale, Model model) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("post/post");
		
		return mav;
	}
	
	@RequestMapping(value = "/post_list", method = {  RequestMethod.GET, RequestMethod.POST } )
	public ModelAndView post_list( HttpServletRequest req , HttpServletResponse res, CommandMap commandMap, HttpSession session ) throws Exception {
		
		int page = 1;
		if( req.getParameter("page") == null ){
			page = 1;
		}else {
			page = Integer.parseInt( req.getParameter("page"));
		}
		
		commandMap.getMap().put("authGroup", session.getAttribute("auth_group"));
		
		System.out.println("authGroup === " + session.getAttribute("auth_group"));
		
		int totalList = pofolService.post_list_cnt(commandMap.getMap()); 
		
		Pagination pagination = new Pagination(totalList, page);
		
		commandMap.getMap().put("startIndex", pagination.getStartIndex());
		commandMap.getMap().put("endIndex", pagination.getEndIndex());
		
		System.out.println(commandMap.getMap());
		
		List<Post> data =  pofolService.postList(commandMap.getMap());
		
		LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("list", data);
		map.put("page", page);
		map.put("listCnt", totalList);
		//map.put("pagination", pagination);
		
		return CommonUtils.directWrite(res, gson.toJson(map));
	}
	
	
	@RequestMapping(value = "/post_detail", method = {  RequestMethod.GET, RequestMethod.POST } )
	public ModelAndView post_detail( HttpServletRequest req , HttpServletResponse res, CommandMap commandMap ) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("item", req.getParameter("item"));
		System.out.println( req.getParameter("item"));
		mav.setViewName("post/post_detail");
		
		return mav;
	}
	
}
