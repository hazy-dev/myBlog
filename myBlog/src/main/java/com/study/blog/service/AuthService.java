package com.study.blog.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.blog.mapper.AuthMapper;
import com.study.blog.model.Auth;

@Service
public class AuthService {

	@Autowired
	private AuthMapper authMapper;

	public List<Auth> auth_list(Map<String, Object> map) {
		return authMapper.auth_list(map);
	}

	public int update_auth(Map<String, Object> map) {
		return authMapper.update_auth(map);
	}

	public int user_check(Map<String, Object> map) {
		return authMapper.user_check(map);
	}

	public int max_auth() {
		return authMapper.max_auth();
	}

	public int user_insert(Map<String, Object> map) {
		return authMapper.user_insert(map);
	}
	
	
}
