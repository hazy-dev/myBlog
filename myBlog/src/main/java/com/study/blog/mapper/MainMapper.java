package com.study.blog.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.study.blog.model.Main;
import com.study.blog.model.Menu;

@Mapper
@Repository
public interface MainMapper {

	List<Main> selectAdminLogin(Map<String, Object> map);

	List<Menu> create_menu(Map<String, Object> map);

	List<Main> calendar_date(Map<String, Object> map);

	List<Main> board_list(Map<String, Object> map);

	int into_blog(Map<String, Object> map);

	List<Main> getCounter();

	List<Main> user_list();

}
