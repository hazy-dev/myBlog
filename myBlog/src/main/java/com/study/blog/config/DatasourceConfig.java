package com.study.blog.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;

@Configuration
public class DatasourceConfig {
	
	@Value("${user.datasource.type}")
	private String type;
	
	@Autowired
	private Environment environment;
	
	
	@Bean(name = "dataSource")
	public DataSource dataSource() {
		return DataSourceBuilder.create()
				.url(environment.getProperty("user.datasource."+type+".url"))
				.username(environment.getProperty("user.datasource."+type+".username"))
				.password(environment.getProperty("user.datasource."+type+".password"))
				.driverClassName(environment.getProperty("user.datasource."+type+".driverClassName"))
				.build();
	}
	
	/*
	@Bean(name = "dataSourceLocal")
	@Primary
	@ConfigurationProperties("spring.datasource.local")
	public DataSource dataSourceLocal() {
		return DataSourceBuilder.create().build();
	}
	
	@Bean(name = "dataSourceCafe24")
	@ConfigurationProperties("spring.datasource.cafe24")
	public DataSource dataSourceCafe24() {
		return DataSourceBuilder.create().build();
	}
	*/
}
