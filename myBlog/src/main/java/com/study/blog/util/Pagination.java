package com.study.blog.util;

import lombok.Data;

@Data
public class Pagination {
	
	/** 한 페이지당 게시글 수 **/
    private int pageSize = 5;
    
    /** 한 블럭(range)당 페이지 수 **/
    private int rangeSize = 5;
    
    /** 현재 페이지 **/
    private int curPage = 1;
    
    /** 현재 블럭(range) **/
    private int curRange = 1;
    
    /** 총 게시글 수 **/
    private int listCnt;
    
    /** 총 페이지 수 **/
    private int pageCnt;
    
    /** 총 블럭(range) 수 **/
    private int rangeCnt;
    
    /** 시작 페이지 **/
    private int startPage = 1;
    
    /** 끝 페이지 **/
    private int endPage = 1;
    
    /** 시작 index **/
    private int startIndex = 0;
    
    /** 종료 index  **/
    private int endIndex = 0;
    
    /** 이전 페이지 **/
    private int prevPage;
    
    /** 다음 페이지 **/
    private int nextPage;
    
    // 총 게시글 수 , 페이지 넘버
    public Pagination(int listCnt, int curPage){
    	this.curPage = curPage;
        /**
         * 페이징 처리 순서
         * 1. 총 페이지수
         * 2. 총 블럭(range)수
         * 3. range setting
         */
        
        // 총 게시물 수와 현재 페이지를 Controller로 부터 받아온다.
        /** 현재페이지 **/
        setCurRange(curPage);
        /** 총 게시물 수 **/
        //setListCnt(listCnt);
        
        /** 1. 총 페이지 수 **/
        setPageCnt(listCnt);
        /** 2. 총 블럭(range)수 **/
        setRangeCnt(pageCnt);
        /** 3. 블럭(range) setting **/
        rangeSetting(curPage);
        
        /** DB 질의를 위한 startIndex 설정 **/
        setStartIndex(curPage);
    }
    
    // 한 페이지당 보여지는 게시글 갯수 ,  총 게시글 수 , 페이지 넘버
    public Pagination(int pageSize, int listCnt, int curPage){
    	
    	this.curPage = curPage;
    	this.pageSize = pageSize;
    	
        /**
         * 페이징 처리 순서
         * 1. 총 페이지수
         * 2. 총 블럭(range)수
         * 3. range setting
         */
        
        // 총 게시물 수와 현재 페이지를 Controller로 부터 받아온다.
        /** 현재페이지 **/
        setCurRange(curPage);
        /** 총 게시물 수 **/
        setListCnt(listCnt);
        
        /** 1. 총 페이지 수 **/
        setPageCnt(listCnt);
        /** 2. 총 블럭(range)수 **/
        setRangeCnt(pageCnt);
        /** 3. 블럭(range) setting **/
        rangeSetting(curPage);
        
        /** DB 질의를 위한 startIndex 설정 **/
        setStartIndex(curPage);
    }
	
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
 
    public void setPageCnt(int listCnt) {
        this.pageCnt = (int) Math.ceil(listCnt*1.0/pageSize);
    }
    public void setRangeCnt(int pageCnt) {
        this.rangeCnt = (int) Math.ceil(pageCnt*1.0/rangeSize);
    }
    public void rangeSetting(int curPage){
        
        setCurRange(curPage);        
        this.startPage = (curRange - 1) * rangeSize + 1;
        this.endPage = startPage + rangeSize - 1;
        
        if(endPage > pageCnt){
            this.endPage = pageCnt;
        }
        
        this.prevPage = curPage - 1;
        this.nextPage = curPage + 1;
        
        if(nextPage > pageCnt){
            this.nextPage = pageCnt;
        }
    }
    public void setCurRange(int curPage) {
        this.curRange = (int)((curPage-1)/rangeSize) + 1;
    }
    public void setStartIndex(int curPage) {
        this.startIndex = (curPage-1) * pageSize+1;
        this.endIndex = (curPage) * pageSize;
        if(endIndex>listCnt) {
        	endIndex = listCnt;
        }
    }
    
    public String getPagination() {
    	
    	String pageHtml = "";
    	
    	if( curRange != 1 ){
			pageHtml += "<a href='#' class='page_box' onClick='fn_paging(1)'><i class='fas fa-angle-double-left'></i></a>";
		}
		
		if( curPage != 1 ){
			pageHtml += "<a href='#' class='page_box' onClick='fn_paging(" + prevPage + ")'><i class='fas fa-angle-left'></i></a>";
		}

		pageHtml += "<span class='number'>";
		
		for( int i = startPage; endPage >= i ; i++ ){
			if( i ==  curPage ){
				pageHtml +=  "<a href='#self' class='on' onClick='fn_paging(" + i + ")' >" +  i + "</a>";
			}else{
				pageHtml +=  "<a href='#self' onClick='fn_paging(" + i + ")' >" +  i + "</a>";
			}
		}
		
		pageHtml += "</span>";
		
		if( curPage != pageCnt && pageCnt > 0 ){
			pageHtml += "<a href='#' class='page_box' onClick='fn_paging(" + nextPage  + ")' ><i class='fas fa-angle-right'></i></a>";
		}
		
		if( curRange != rangeCnt && rangeCnt > 1 ){
			pageHtml += "<a href='#' class='page_box' onClick='fn_paging(" + pageCnt  + ")' ><i class='fas fa-angle-double-right'></i></a>";
		}
    	
    	return pageHtml;
    }
}

