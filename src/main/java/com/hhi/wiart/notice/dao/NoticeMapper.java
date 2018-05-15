package com.hhi.wiart.notice.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

@Component
public interface NoticeMapper
{
	List<HashMap<String, Object>> noticeList(HashMap param);

	String totalCount(HashMap param);
	
	HashMap<String, Object> noticeView(HashMap param);
	
	int noticeInsert(HashMap param);
	
	int noticeDelete(HashMap param);
	
	int noticeUpdate(HashMap param);
	
	int noticeHitCnt(HashMap param);
}