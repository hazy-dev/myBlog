package com.study.blog.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.study.blog.model.Post;

@Mapper
@Repository
public interface PofolMapper {

	int portfolio_list_cnt(Map<String, Object> map);

	List<Post> portfolioList(Map<String, Object> map);

	int post_list_cnt(Map<String, Object> map);

	List<Post> postList(Map<String, Object> map);

}
