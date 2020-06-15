package com.study.blog.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.blog.mapper.MenuMapper;
import com.study.blog.model.Menu;

@Service
public class MenuService {

	@Autowired
	private MenuMapper menuMapper;

	public List<Menu> menu_list(Map<String, Object> map) {
		return menuMapper.menu_list(map);
	}

	public int max_seq() {
		return menuMapper.max_seq();
	}

	public int update_menu_auth(Map<String, Object> map) {
		return menuMapper.update_menu_auth(map);
	}

	public int update_menu_seq(Map<String, Object> map) {
		return menuMapper.update_menu_seq(map);
	}

	public int update_menu_hide(Map<String, Object> map) {
		return menuMapper.update_menu_hide(map);
	}

	public int menu_check(Map<String, Object> map) {
		return menuMapper.menu_check(map);
	}

	public int menu_move_check(Map<String, Object> map) {
		return menuMapper.menu_move_check(map);
	}

	public int menu_insert(Map<String, Object> map) {
		return menuMapper.menu_insert(map);
	}
	
}
