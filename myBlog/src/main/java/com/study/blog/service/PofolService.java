package com.study.blog.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.study.blog.mapper.PofolMapper;
import com.study.blog.model.Post;

@Service
public class PofolService {

	@Autowired
	private PofolMapper pofolMapper;

	public int portfolio_list_cnt(Map<String, Object> map) {
		return pofolMapper.portfolio_list_cnt(map);
	}

	public List<Post> portfolioList(Map<String, Object> map) {
		return pofolMapper.portfolioList(map);
	}

	public int post_list_cnt(Map<String, Object> map) {
		return pofolMapper.post_list_cnt(map);
	}

	public List<Post> postList(Map<String, Object> map) {
		return pofolMapper.postList(map);
	}
	
	
	
}
