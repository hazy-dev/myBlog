package com.study.blog.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.blog.mapper.MainMapper;
import com.study.blog.model.Main;
import com.study.blog.model.Menu;

@Service
public class MainService {

	@Autowired
	private MainMapper mainMapper;

	public List<Main> selectAdminLogin(Map<String, Object> map) {
		return mainMapper.selectAdminLogin(map);
	}

	public List<Menu> create_menu(Map<String, Object> map) {
		return mainMapper.create_menu(map);
	}

	public List<Main> calendar_date(Map<String, Object> map) {
		return mainMapper.calendar_date(map);
	}

	public List<Main> board_list(Map<String, Object> map) {
		return mainMapper.board_list(map);
	}

	public int into_blog(Map<String, Object> map) {
		return mainMapper.into_blog(map);
	}

	public List<Main> getCounter() {
		return mainMapper.getCounter();
	}

	public List<Main> user_list() {
		return mainMapper.user_list();
	}
	
}
