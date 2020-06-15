package com.study.blog.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.study.blog.model.Menu;

@Mapper
@Repository
public interface MenuMapper {

	List<Menu> menu_list(Map<String, Object> map);

	int max_seq();

	int update_menu_auth(Map<String, Object> map);

	int update_menu_seq(Map<String, Object> map);

	int update_menu_hide(Map<String, Object> map);

	int menu_check(Map<String, Object> map);

	int menu_move_check(Map<String, Object> map);

	int menu_insert(Map<String, Object> map);

}
