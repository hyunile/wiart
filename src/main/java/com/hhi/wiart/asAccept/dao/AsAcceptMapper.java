package com.hhi.wiart.asAccept.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public interface AsAcceptMapper {
	List<HashMap<String, Object>> asAcceptList(HashMap param);

	String totalCount(HashMap param);
	
	HashMap<String, Object> asAcceptView(HashMap param);
	
	int asAcceptInsert(HashMap param);
	
	int asAcceptDelete(HashMap param);
	
	int asAcceptUpdate(HashMap param);
	
	int asAcceptHitCnt(HashMap param);
	
	void asAcceptAddFile(String fileName);
	
}



