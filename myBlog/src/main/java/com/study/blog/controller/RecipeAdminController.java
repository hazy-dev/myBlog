package com.study.blog.controller;

import java.io.File;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.study.blog.model.Main;
import com.study.blog.service.RecipeService;
import com.study.blog.util.CommandMap;
import com.study.blog.util.CommonUtils;
import com.study.blog.util.Pagination;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class RecipeAdminController {
	
	@Autowired
	private RecipeService recipeService;
	
	Gson gson = CommonUtils.getGson();
	
	@RequestMapping(value = "/recipeAdmin", method = RequestMethod.GET)
	public ModelAndView recipeAdmin() throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("recipeAdmin/recipeAdmin");
		
		return mav;
	}
	
	@RequestMapping(value = "/adminRecipe", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView adminRecipe( HttpServletRequest req , CommandMap commandMap ) throws Exception {
		
		int page_Num = req.getParameter("pageNum") == null ? 1 : Integer.parseInt(req.getParameter("pageNum"));

		// 리스트 갯수
		//int total_cnt = mainService.board_cnt(commandMap.getMap());
		//int pageSize = 5;
		
		//Pagination pagination = new Pagination(pageSize, total_cnt, page_Num);
		
		//commandMap.getMap().put("startNum", pagination.getStartIndex()-1);
		//commandMap.getMap().put("endNum", pagination.getPageSize());
		
		//List<Main> board_list = mainService.board_list( commandMap.getMap() );
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("recipeAdmin/recipeList");
		//mav.addObject("list", board_list);
		//mav.addObject("pagination", pagination.getPagination());
		
		return mav;
	}
	
	@RequestMapping(value = "/adminRecipeInsPage", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView adminRecipeIns( HttpServletRequest req , CommandMap commandMap ) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("recipeAdmin/recipeInsert");
		
		return mav;
	}
	
	@RequestMapping(value = "/adminRecipeIns", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView adminRecipeIns( HttpServletRequest req , HttpServletResponse res, CommandMap commandMap, HttpSession session) throws Exception {
		
		//commandMap.getMap().put("", req.getParameter(""));
		commandMap.getMap().put("reSubject", req.getParameter("reSubject"));
		commandMap.getMap().put("reSelect", req.getParameter("reSelect"));
		commandMap.getMap().put("reNecessary", req.getParameter("reNecessary"));
		commandMap.getMap().put("reChoice", req.getParameter("reChoice"));
		commandMap.getMap().put("reAccount", req.getParameter("reAccount"));
		commandMap.getMap().put("reContent", req.getParameter("reContent"));
		commandMap.getMap().put("insUser", 0);
		commandMap.getMap().put("recApproval", "Y");
		
		System.out.println(commandMap.getMap());
		
		int recipeIns = recipeService.insert_recipe(commandMap.getMap());
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", recipeIns);
		return CommonUtils.directWrite(res, gson.toJson(map));
	}
	
	/* smartEditer 테스트 */
	
	@RequestMapping(value = "/editorFileUpload", method = { RequestMethod.GET, RequestMethod.POST })
	public void smartEditer(HttpServletRequest req,  HttpServletResponse res) throws Exception {

		 // 파일정보
        //StringBuffer sb = new StringBuffer();
		
		String fileRoot = "C:\\develop\\gitHub\\myBlog\\myBlog\\src\\main\\resources\\static\\smart2\\imageDir\\";
		
        try {
            // 파일명을 받는다 - 일반 원본파일명
            //String oldName = req.getHeader("file-name");
            String storedFileName = "";
            // 파일 기본경로 _ 상세경로
            
            File file = new File(fileRoot);
    		if(!file.exists()) {
    			file.mkdirs();
    		}else{
    			
    		}
            
            MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) req;
    		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
    		MultipartFile multipartFile = null;
    		String oldName = "";
    		
			while (iterator.hasNext()) {
				multipartFile = multipartHttpServletRequest.getFile(iterator.next());
				
				oldName =	multipartFile.getOriginalFilename();
				if( oldName.indexOf("\\") != -1 ) {
					oldName = oldName.substring(oldName.lastIndexOf("\\")+1, oldName.length());
				}
				
				if (multipartFile.isEmpty() == false) {
					
					System.out.println("------------- file start -------------");
					System.out.println("name : " + multipartFile.getName());
					System.out.println("filename : " + oldName);
					System.out.println("size : " + multipartFile.getSize());
					System.out.println("-------------- file end --------------\n");
					
					Date nowDate = Calendar.getInstance().getTime();
					storedFileName = "editImage_"+ nowDate.getTime() +  oldName.substring(oldName.lastIndexOf("."),oldName.length()) ;
					
					file = new File(fileRoot + storedFileName);
					multipartFile.transferTo(file);
					
				}
			}
			
			String callback = multipartHttpServletRequest.getParameter("callback");
			String callback_func = multipartHttpServletRequest.getParameter("callback_func");
			
			System.out.println("callback :: " + callback);
			
			String return_url = "";
			return_url += callback;
			return_url += "?callback_func=" + callback_func;
			return_url += "&bNewLine=true";
			return_url += "&sFileName=" + oldName;
			return_url += "&sFileURL=../../smart2/imageDir/" + storedFileName ;
			
			res.sendRedirect(return_url);
			
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView smartEditer_Callback(HttpServletRequest req,  HttpServletResponse res) throws Exception {
	
		System.out.println(req.getParameter("sFileName"));
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/recipeAdmin/callback");
		mav.addObject("callback_func", req.getParameter("callback_func"));
		mav.addObject("bNewLine", req.getParameter("bNewLine"));
		mav.addObject("sFileName", req.getParameter("sFileName"));
		mav.addObject("sFileURL", req.getParameter("sFileURL"));
		
		return mav;
	}
	
	/*
	 * @RequestMapping(value = "/photo_uploader", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public ModelAndView photo_uploader(HttpServletRequest
	 * req, HttpServletResponse res) throws Exception {
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * mav.setViewName("/admin/notice/photo_uploader");
	 * 
	 * return mav; }
	 */
	
}
