package com.study.blog.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.study.blog.model.Auth;

@Mapper
@Repository
public interface AuthMapper {

	List<Auth> auth_list(Map<String, Object> map);

	int update_auth(Map<String, Object> map);

	int user_check(Map<String, Object> map);

	int max_auth();

	int user_insert(Map<String, Object> map);

}
