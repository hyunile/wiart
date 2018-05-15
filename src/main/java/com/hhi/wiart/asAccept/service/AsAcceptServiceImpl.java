package com.hhi.wiart.asAccept.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hhi.wiart.asAccept.dao.AsAcceptMapper;

@Service
public class AsAcceptServiceImpl implements AsAcceptService{
	private static final Logger log = LoggerFactory.getLogger(AsAcceptServiceImpl.class);
	
	@Resource(name="asAcceptMapper")
	private AsAcceptMapper asAcceptMapper;
	
	public List<HashMap<String, Object>> asAcceptList(HashMap param)throws Exception{
        List<HashMap<String, Object>> rList = new ArrayList<HashMap<String, Object>>();
        try{
            rList = asAcceptMapper.asAcceptList(param);
            if ( rList == null ) {
                log.debug("asAcceptList NULL!");
            } else {
                log.debug("List Size : "+rList.size());
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return rList;
	}
	
	public String totalCount(HashMap param)throws Exception{
        return asAcceptMapper.totalCount(param);
	}

	public HashMap<String, Object> asAcceptView(HashMap param)throws Exception{
        HashMap<String, Object> rMap = new HashMap<String, Object>();
        try{
            rMap = asAcceptMapper.asAcceptView(param);
            if ( rMap == null ) {
                log.debug("asAcceptView NULL!");
            } else {
                log.debug("List Size : "+rMap.size());
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return rMap;
	}
	
	public int asAcceptInsert(HashMap param)throws Exception{
		
		int result = asAcceptMapper.asAcceptInsert(param);
		String[] files = (String[]) param.get("files");
		
		log.debug("param.get('files') :: {} " , param.get("files"));
		if(files == null){
			return 0;
		}
		
		for (String fileName : files){
			asAcceptMapper.asAcceptAddFile(fileName);
		}
		
		log.debug("result :: {} " , result);
		
        return result;
	}
	
	public void asAcceptDelete(HashMap param)throws Exception{
        asAcceptMapper.asAcceptDelete(param);
	}
	
	public int asAcceptUpdate(HashMap param)throws Exception{
        return asAcceptMapper.asAcceptUpdate(param);
	}
	
	//조회수 증가
	public int asAcceptHitCnt(HashMap param)throws Exception{
        return asAcceptMapper.asAcceptHitCnt(param);
	}
	
	//파일 첨부
	public void addFile(String fileName)throws Exception{
		asAcceptMapper.asAcceptAddFile(fileName);
	}
	
}
