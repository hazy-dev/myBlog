package com.study.blog.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class RecipeController {
	
	@RequestMapping(value = "/goRecipe", method = RequestMethod.GET)
	public ModelAndView goBlog() throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("recipe/recipeMain");
		
		return mav;
	}
	
}
