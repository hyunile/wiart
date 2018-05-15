package com.hhi.wiart.notice.service;

import java.util.HashMap;
import java.util.List;

public interface NoticeService {
	
	//게시판 리스트
	List<HashMap<String, Object>> noticeList(HashMap<String, Object> map)throws Exception;
	
	String totalCount(HashMap<String, Object> map)throws Exception;
	
	HashMap<String, Object> noticeView(HashMap<String, Object> map)throws Exception; 
	
	int noticeInsert(HashMap<String, Object> map)throws Exception;
	
	void noticeDelete(HashMap<String, Object> map)throws Exception;
	
	int noticeUpdate(HashMap<String, Object> map)throws Exception;
	
	int noticeHitCnt(HashMap<String, Object> map)throws Exception;
	
}
