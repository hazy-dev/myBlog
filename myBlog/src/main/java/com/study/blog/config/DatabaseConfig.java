package com.study.blog.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

@Configuration
public class DatabaseConfig {
	@Bean 
	public SqlSessionFactory sqlSessionFactory(DataSource datasource) throws Exception { 
		SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean(); 
		sqlSessionFactory.setDataSource(datasource); 
		sqlSessionFactory.setTypeAliasesPackage("com.study.blog"); 
		sqlSessionFactory.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:/mapper/*.xml")); 
		
		return sqlSessionFactory.getObject(); 
	} 
	
	@Bean 
	public SqlSessionTemplate sqlSession(SqlSessionFactory sqlSessionFactory) { 
		sqlSessionFactory.getConfiguration().setMapUnderscoreToCamelCase(true);
		return new SqlSessionTemplate(sqlSessionFactory); 
	}
}
