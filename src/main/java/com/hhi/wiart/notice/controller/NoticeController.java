package com.hhi.wiart.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hhi.wiart.notice.service.NoticeService;
import com.hhi.wiart.common.util.StringUtil;
import com.hhi.wiart.model.board.BoardVO;

@Controller		//현재 클래스를 컨트롤러 빈(bean)으로 등록
public class NoticeController {
	
	private static final Logger log = LoggerFactory.getLogger(NoticeController.class);
	
    // 의존관계 주입 => BoardServiceImpl 생성
    // IoC 의존관계 역전
	@Autowired //@Inject
	private NoticeService noticeService;
	
	@RequestMapping(value="/notice/list")
	public String list(Model model) throws Exception{
		log.debug(">>>>>>>>>>> notice list");
        return "/notice/list";
	}
	
	@ResponseBody
	@RequestMapping(value="/notice/list.json")
	public Map<String, Object> noticeListJson(@RequestParam HashMap<String, Object> map) throws Exception{
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		int pageNumber = 0; //page start
		int pageSize = 10;
		
        String page = "";
        String tmpBlockSize = "";
        String totalCount = "";
        String subject = "";
        
        try{
            if ( map != null && !map.isEmpty()) {
                log.debug("REQS>>>>>" + map.toString());

                subject = StringUtil.isNullToString(map.get("subject"));
                page = StringUtil.isNullToString(map.get("page"));
                tmpBlockSize = StringUtil.isNullToString(map.get("pageSize"));
            }
            
            if (page.isEmpty()) {
                page = "1";
            }
            if (!tmpBlockSize.equals("")) {
            	pageSize = Integer.parseInt(tmpBlockSize);
            }
            pageNumber = (Integer.parseInt(page) - 1) * pageSize;
            
            HashMap<String, Object>paramMap = new HashMap<String, Object>();
            paramMap.put("subject", subject);
            paramMap.put("pageNumber", pageNumber); //pageStart
            paramMap.put("pageSize", pageSize); 
            
            List<HashMap<String, Object>> resultList = noticeService.noticeList(paramMap);
            
            totalCount = noticeService.totalCount(paramMap);
            
            resultMap.put("resultList", resultList);
			resultMap.put("pageSize", Integer.toString(pageSize));
			resultMap.put("page", page);
			resultMap.put("totalCount", totalCount);
            
			log.debug("■■■■■ resultMap : {}", resultMap);
			
        }catch(Exception e){
        	e.printStackTrace();
        }

        return resultMap; 							// list.jsp로 List가 전달된다.
	}
	
	@RequestMapping(value="/notice/write")
	public String write(Model model) throws Exception{
		log.debug(">>>>>>>>>>> notice write");
        return "/notice/write";
	}
	
    @RequestMapping(value = "/notice/noticeWrite", method = RequestMethod.POST)
	public String noticeWrite(HttpServletRequest request, HttpServletResponse response, @RequestParam HashMap<String, Object> map, Model model)throws Exception{
        
        // 결과 map
        HashMap<String,Object> resultMap = new HashMap<String,Object>();
        
        String title = "";
        String content = "";
        String title_type = "";
        String writer = "";
        try{
        	String test = String.valueOf(map.get("subject"));
        	log.debug(">>>>>>>>>>>> test : {}", test);

        	String tewst = map.get("subject").toString();
        	log.debug(">>>>>>>>>>>> tewst : {}", tewst);
            if ( map != null && !map.isEmpty()) {
            	
            }
        	
            if ( map != null && !map.isEmpty()) {
                //logger.debug("homeCommWriteProc REQS>>>>>" + map.toString());
                
                // Debug Param Print....
                debugParamPrint(map);
                
                title = StringUtil.isNullToString(map.get("subject"));
                content = StringUtil.isNullToString(map.get("contents"));
                title_type = StringUtil.isNullToString(map.get("title_type"));
                writer = StringUtil.isNullToString(map.get("writer"));
            }
            //#######################################
            log.debug(">>>>>>>>>> map.get(subject) : {}", map.get("subject"));
            
            // 글쓰기
            HashMap<String,Object> paramMap = new HashMap<String,Object>();
            paramMap.put("title", title);
            paramMap.put("content", content);
            paramMap.put("title_type", title_type);
            paramMap.put("writer", writer);
            
            log.debug(">>>>>>>>>> paramMap : {}", paramMap);
            int cnt = noticeService.noticeInsert(paramMap);
            
            resultMap.put("cnt", cnt);
            
        }catch(Exception e){
        	e.printStackTrace();
        }
        //return resultMap;
        return "forward:/notice/list";
	}
	
	@ResponseBody
    @RequestMapping(value = "/notice/noticeInsert", method = RequestMethod.POST)
	public Map<String, Object> writeProc(HttpServletRequest request, HttpServletResponse response,   
			//@RequestParam HashMap<String, Object> map,Model model)throws Exception{
			@RequestParam HashMap<String, Object> map,Model model)throws Exception{
        
        // 결과 map
        HashMap<String,Object> resultMap = new HashMap<String,Object>();
        
        String title = "";
        String content = "";
        String title_type = "";
        String writer =  "관리자";
        
        String test = request.getParameter("contents").toString();
        
        log.debug(">>>>>>>>>>>> test : " , test);
        try{
                if ( map != null && !map.isEmpty()) {
                //logger.debug("homeCommWriteProc REQS>>>>>" + map.toString());
                
            	
                // Debug Param Print....
                debugParamPrint(map);
                
                title = StringUtil.isNullToString(map.get("subject"));
                content = StringUtil.isNullToString(map.get("contents"));
                title_type = StringUtil.isNullToString(map.get("title_type"));
                writer = StringUtil.isNullToString(map.get("writer"));
            }
            //#######################################
            log.debug(">>>>>>>>>> map.get(subject) : {}", map.get("subject"));
            
            // 글쓰기
            HashMap<String,Object> paramMap = new HashMap<String,Object>();
            paramMap.put("title", title);
            paramMap.put("content", content);
            paramMap.put("title_type", title_type);
            paramMap.put("writer", writer);
            
            log.debug(">>>>>>>>>> paramMap : {}", paramMap);
            int cnt = noticeService.noticeInsert(paramMap);
            
            resultMap.put("cnt", cnt);
            
        }catch(Exception e){
        	e.printStackTrace();
            e.getMessage();
        }
        return resultMap;
        //return "forward:/notice/list";
	}
    
	@RequestMapping(value = "/notice/view")
	public String noticeView(@RequestParam HashMap<String, Object> map, Model model){
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		String no = "";
		
		try{
			if(map != null && !map.isEmpty()){
			   log.debug("REQS>>>>>" + map.toString());
			   no = StringUtil.isNullToString(map.get("no"));
				
			}
            HashMap<String, Object> paramMap = new HashMap<String, Object>();
            paramMap.put("no", no);
            
            noticeService.noticeHitCnt(paramMap); //조회수 증가
            result = noticeService.noticeView(paramMap);
		}catch(Exception e){
			e.getMessage();
		}
		
		model.addAttribute("result",result);
		return "/notice/view";
	}
	
	@RequestMapping(value="/notice/update")
	public String update(@RequestParam HashMap<String, Object> map, Model model) throws Exception{
		log.debug(">>>>>>>>>>> notice update");
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		String no = "";
		
		try{
			if(map != null && !map.isEmpty()){
			   log.debug("REQS>>>>>" + map.toString());
			   no = StringUtil.isNullToString(map.get("no"));
				
			}
            HashMap<String, Object> paramMap = new HashMap<String, Object>();
            paramMap.put("no", no);
            
            result = noticeService.noticeView(paramMap);
		}catch(Exception e){
			e.getMessage();
		}
		log.debug("result : {}" , result);
		
		model.addAttribute("result",result);
        return "/notice/update";
	}
	
	@ResponseBody
    @RequestMapping(value = "/notice/noticeUpdate", method = RequestMethod.POST)
	public Map<String, Object> noticeUpdate(HttpServletRequest request, HttpServletResponse response,   
			//@RequestParam HashMap<String, Object> map,Model model)throws Exception{
			@RequestParam HashMap<String, Object> map,Model model)throws Exception{
        
        // 결과 map
        HashMap<String,Object> resultMap = new HashMap<String,Object>();
        
        String title = "";
        String content = "";
        String title_type = "";
        String writer =  "관리자";
        String no = "";
        String test = request.getParameter("contents").toString();
        
        log.debug(">>>>>>>>>>>> test : " , test);
        try{
                if ( map != null && !map.isEmpty()) {
                //logger.debug("homeCommWriteProc REQS>>>>>" + map.toString());
                
            	
                // Debug Param Print....
                debugParamPrint(map);
                
                title = StringUtil.isNullToString(map.get("subject"));
                content = StringUtil.isNullToString(map.get("contents"));
                title_type = StringUtil.isNullToString(map.get("title_type"));
                no = StringUtil.isNullToString(map.get("no"));
            }
            //#######################################
            log.debug(">>>>>>>>>> map.get(subject) : {}", map.get("subject"));
            
            // 글쓰기
            HashMap<String,Object> paramMap = new HashMap<String,Object>();
            paramMap.put("title", title);
            paramMap.put("content", content);
            paramMap.put("title_type", title_type);
            paramMap.put("writer", writer);
            paramMap.put("no", no);
            
            log.debug(">>>>>>>>>> paramMap : {}", paramMap);
            int cnt = noticeService.noticeUpdate(paramMap);
            
            resultMap.put("cnt", cnt);
            
        }catch(Exception e){
        	e.printStackTrace();
            e.getMessage();
        }
        return resultMap;
        //return "forward:/notice/list";
	}
    
	@RequestMapping(value="/notice/delete", method = RequestMethod.POST)
	public String delete(@RequestParam HashMap<String, Object> map, Model model) throws Exception{
		log.debug(">>>>>>>>>>> notice delete");
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		String no = "";
		
		try{
			if(map != null && !map.isEmpty()){
			   log.debug("REQS>>>>>" + map.toString());
			   no = StringUtil.isNullToString(map.get("no"));
				
			}
            HashMap<String, Object> paramMap = new HashMap<String, Object>();
            paramMap.put("no", no);
            
            noticeService.noticeDelete(paramMap);
		}catch(Exception e){
			e.getMessage();
		}
		log.debug("result : {}" , result);
		
        return "/notice/list";
	}
    private void debugParamPrint(HashMap<String,Object> map) throws Exception {
        for( String key : map.keySet() ){
            log.debug( String.format("키 : %s, 값 : %s", key, map.get(key)) );
        }
    }
}
