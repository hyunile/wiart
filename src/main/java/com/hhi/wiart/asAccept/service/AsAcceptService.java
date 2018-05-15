package com.hhi.wiart.asAccept.service;

import java.util.HashMap;
import java.util.List;

public interface AsAcceptService {
	//게시판 리스트
	List<HashMap<String, Object>> asAcceptList(HashMap<String, Object> map)throws Exception;
	
	String totalCount(HashMap<String, Object> map)throws Exception;
	
	HashMap<String, Object> asAcceptView(HashMap<String, Object> map)throws Exception; 
	
	int asAcceptInsert(HashMap<String, Object> map)throws Exception;
	
	void asAcceptDelete(HashMap<String, Object> map)throws Exception;
	
	int asAcceptUpdate(HashMap<String, Object> map)throws Exception;
	
	int asAcceptHitCnt(HashMap<String, Object> map)throws Exception;
	
	//파일 추가
	void addFile(String fullName) throws Exception;
}
