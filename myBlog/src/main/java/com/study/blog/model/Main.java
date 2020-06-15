package com.study.blog.model;

import lombok.Data;

@Data
public class Main {

	// main 게시판 ( 최상단 노출 3개 )
	private int idx;
	private String subject;
	private String filename;
	private int category;
	private String delYn;
	private int tableAuth;
	private int adminAuth;
	private int uploadDate;
	private String insDate;
	
	// 관리자들 권한 ( 자신의 게시물만 보기 )
	private int auth;
	private int authGroup;
	private String name;
	
	//조회수
	private int counter;
}
