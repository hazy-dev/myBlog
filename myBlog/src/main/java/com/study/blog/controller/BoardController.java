package com.study.blog.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.study.blog.model.Main;
import com.study.blog.service.BoardService;
import com.study.blog.util.CommandMap;
import com.study.blog.util.CommonUtils;
import com.study.blog.util.Pagination;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	Gson gson = CommonUtils.getGson();
	
	@RequestMapping(value = "/admin_table",  method = {  RequestMethod.GET, RequestMethod.POST }  )
	public ModelAndView admin_table(Locale locale, Model model) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/admin_list");
		
		return mav;
	}
	
	@RequestMapping(value = "/admin_table_list",  method = {  RequestMethod.GET, RequestMethod.POST }  )
	public ModelAndView table_list( HttpServletRequest req , HttpServletResponse res, CommandMap commandMap , HttpSession session ) throws Exception {
		
		int page = 1;
		if( req.getParameter("page") == null ){
			page = 1;
		}else {
			page = Integer.parseInt( req.getParameter("page"));
		}
		int totalList = boardService.list_cnt(); 
		
		Pagination pagination = new Pagination(totalList, page);
		
		commandMap.getMap().put("auth", session.getAttribute("auth"));
		commandMap.getMap().put("startIndex", pagination.getStartIndex());
		commandMap.getMap().put("endIndex", pagination.getEndIndex());
		
		System.out.println(commandMap.getMap());
		
		List<Main> data =  boardService.adminList(commandMap.getMap());
		
		LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("list", data);
		map.put("page", page);
		map.put("listCnt", totalList);
		map.put("pagination", pagination);
		
		return CommonUtils.directWrite(res, gson.toJson(map));
	}
	
	@RequestMapping(value = "/admin_update_del_yn",  method = {  RequestMethod.GET, RequestMethod.POST }  )
	public ModelAndView update_del_yn( HttpServletRequest req , HttpServletResponse res, CommandMap commandMap , HttpSession session ) throws Exception {

		commandMap.getMap().put("del_yn", req.getParameter("del_yn"));
		commandMap.getMap().put("idx", req.getParameter("idx"));
		
		int update_result =  boardService.update_del_yn(commandMap.getMap());
		
		LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("data", update_result);
		
		return CommonUtils.directWrite(res, gson.toJson(map));
	}
	
	@RequestMapping(value = "/admin_update_table_auth",  method = {  RequestMethod.GET, RequestMethod.POST }  )
	public ModelAndView update_table_auth( HttpServletRequest req , HttpServletResponse res, CommandMap commandMap , HttpSession session ) throws Exception {

		commandMap.getMap().put("table_auth", req.getParameter("table_auth"));
		commandMap.getMap().put("idx", req.getParameter("idx"));
		
		int update_result =  boardService.update_table_auth(commandMap.getMap());
		
		LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("data", update_result);
		
		return CommonUtils.directWrite(res, gson.toJson(map));
	}
	
	
	
	@RequestMapping(value = "/admin_upload_page", method = RequestMethod.GET)
	public ModelAndView upload_page(Locale locale, Model model) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/upload_page");
		
		return mav;
	}
	
	@RequestMapping(value = "/admin_start_upload", method = {  RequestMethod.GET, RequestMethod.POST } )
	public ModelAndView start_upload( HttpServletRequest req , HttpServletResponse res, CommandMap commandMap, HttpSession session) throws Exception {
		
		res.setCharacterEncoding("UTF-8");
		
		// 서버
		String fileRoot = "/ihazy/tomcat/webapps/ROOT/WEB-INF/html/";
		
		Map<String, Object> map = new HashMap<String, Object>();
		int file_check = 0;
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) req;
	    Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
	    MultipartFile multipartFile = null;
	    while(iterator.hasNext()){
	        multipartFile = multipartHttpServletRequest.getFile(iterator.next());
	        commandMap.getMap().put("subject", req.getParameter("subject"));
			commandMap.getMap().put("upload_selectbox", req.getParameter("upload_selectbox"));
			commandMap.getMap().put("upload_textarea", req.getParameter("upload_textarea"));
			commandMap.getMap().put("auth_selectbox", req.getParameter("auth_selectbox"));
			commandMap.getMap().put("admin_auth", session.getAttribute("auth"));
			commandMap.getMap().put("uploadfile", multipartFile.getOriginalFilename());
	        if(multipartFile.isEmpty() == false){
	        	
	        	log.info("------------- file start -------------");
	        	log.info("name : "+multipartFile.getName());
	        	log.info("filename : "+multipartFile.getOriginalFilename());
	        	log.info("size : "+multipartFile.getSize());
	        	log.info("-------------- file end --------------\n");
	        	
	        	// 중복파일 체크
	        	file_check = boardService.file_check(commandMap.getMap());
	        	
	        	if( file_check == 0 ) {
	        		File file = new File(fileRoot + multipartFile.getOriginalFilename());
	        		multipartFile.transferTo(file);
	        		map.put("result", "1");
	        	}else {
	        		map.put("result", "0");
	        	}
	        	
	        }
	    }
		
		//fileutils.parseInsertFileInfo(map, req, fileutils.fileRoot);
		System.out.println(commandMap.getMap());
		
		if( file_check == 0 ) {
			map.put("data", boardService.upload(commandMap.getMap()));
		}else {
			map.put("data", "0");
		}
		
		System.out.println(map.get("data").toString());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", map);
		mav.setViewName("admin/upload_ok");
		
		return mav;
	}
	
}
