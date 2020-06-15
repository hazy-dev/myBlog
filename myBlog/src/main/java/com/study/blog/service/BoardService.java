package com.study.blog.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.blog.mapper.BoardMapper;
import com.study.blog.model.Main;

@Service
public class BoardService {

	@Autowired
	private BoardMapper boardMapper;

	public int list_cnt() {
		return boardMapper.list_cnt();
	}

	public List<Main> adminList(Map<String, Object> map) {
		return boardMapper.adminList(map);
	}

	public int update_del_yn(Map<String, Object> map) {
		return boardMapper.update_del_yn(map);
	}

	public int file_check(Map<String, Object> map) {
		return boardMapper.file_check(map);
	}

	public Object upload(Map<String, Object> map) {
		return boardMapper.upload(map);
	}

	public int update_table_auth(Map<String, Object> map) {
		return boardMapper.update_table_auth(map);
	}
	
}
