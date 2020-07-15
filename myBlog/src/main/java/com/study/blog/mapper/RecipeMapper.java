package com.study.blog.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface RecipeMapper {

	int insert_recipe(Map<String, Object> map);

}
