package com.study.blog.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.blog.mapper.RecipeMapper;

@Service
public class RecipeService {

	@Autowired
	private RecipeMapper recipeMapper;

	public int insert_recipe(Map<String, Object> map) {
		return recipeMapper.insert_recipe(map);
	}
	
}
