package com.hhi.wiart.notice.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hhi.wiart.notice.dao.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService{
	private static final Logger log = LoggerFactory.getLogger(NoticeServiceImpl.class);
	
	@Resource(name="noticeMapper")
	private NoticeMapper noticeMapper;
	
	public List<HashMap<String, Object>> noticeList(HashMap param)throws Exception{
        List<HashMap<String, Object>> rList = new ArrayList<HashMap<String, Object>>();
        try{
            rList = noticeMapper.noticeList(param);
            if ( rList == null ) {
                log.debug("noticeList NULL!");
            } else {
                log.debug("List Size : "+rList.size());
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return rList;
	}
	
	public String totalCount(HashMap param)throws Exception{
        return noticeMapper.totalCount(param);
	}

	public HashMap<String, Object> noticeView(HashMap param)throws Exception{
        HashMap<String, Object> rMap = new HashMap<String, Object>();
        try{
            rMap = noticeMapper.noticeView(param);
            if ( rMap == null ) {
                log.debug("noticeView NULL!");
            } else {
                log.debug("List Size : "+rMap.size());
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return rMap;
	}
	
	public int noticeInsert(HashMap param)throws Exception{
        return noticeMapper.noticeInsert(param);
	}
	
	public void noticeDelete(HashMap param)throws Exception{
        noticeMapper.noticeDelete(param);
	}
	
	public int noticeUpdate(HashMap param)throws Exception{
        return noticeMapper.noticeUpdate(param);
	}
	
	//조회수 증가
	public int noticeHitCnt(HashMap param)throws Exception{
        return noticeMapper.noticeHitCnt(param);
	}
	
}
