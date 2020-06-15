package com.study.blog.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.study.blog.model.Main;

@Mapper
@Repository
public interface BoardMapper {

	int list_cnt();

	List<Main> adminList(Map<String, Object> map);

	int update_del_yn(Map<String, Object> map);

	int file_check(Map<String, Object> map);

	Object upload(Map<String, Object> map);

	int update_table_auth(Map<String, Object> map);

}
