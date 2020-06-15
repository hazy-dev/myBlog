package com.study.blog.model;

import java.sql.Date;
import lombok.Data;

@Data
public class Post {
	private int idx;
	private String subject;
	private String filename;
	private int category;
	private Date uploadDate;
	private String memo;
}
