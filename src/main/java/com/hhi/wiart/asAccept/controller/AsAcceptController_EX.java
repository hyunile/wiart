package com.hhi.wiart.asAccept.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.hhi.wiart.asAccept.service.AsAcceptService;
import com.hhi.wiart.common.util.DateUtil;
import com.hhi.wiart.common.util.MediaUtils;
import com.hhi.wiart.common.util.StringUtil;
import com.hhi.wiart.common.util.UploadFileUtils;


@Controller
public class AsAcceptController_EX {
	
	private static final Logger log = LoggerFactory.getLogger(AsAcceptController.class);
	
	@Autowired
	private AsAcceptService asAcceptService;
	
	//bean의 id가 uploadPath인 태그 참조
	@Resource(name="uploadPath")
	String uploadPath;
	
	//@Value("${fileupload.path}")
	@Value("C:/wiart/wiart/src/main/webapp/editor/img/upload/")
	private String filePath;
	/*
	@RequestMapping(value = "/asAccept/list")
	public String list(Model model) throws Exception{
		log.debug(">>>>>>>>>>> asAccept list");
		log.debug(">>>>>>>>>>> uploadPath?? {}", uploadPath);
		return "/asAccept/list";
	}
	
	@ResponseBody
	@RequestMapping(value="/asAccept/list.json")
	public Map<String, Object> asAcceptListJson(@RequestParam HashMap<String, Object> map) throws Exception{
		
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
            
            List<HashMap<String, Object>> resultList = asAcceptService.asAcceptList(paramMap);
            
            totalCount = asAcceptService.totalCount(paramMap);
            
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
	

	@RequestMapping(value = "/asAccept/view")
	public String asAcceptView(@RequestParam HashMap<String, Object> map, Model model){
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		String no = "";
		
		try{
			if(map != null && !map.isEmpty()){
			   log.debug("REQS>>>>>" + map.toString());
			   no = StringUtil.isNullToString(map.get("no"));
				
			}
            HashMap<String, Object> paramMap = new HashMap<String, Object>();
            paramMap.put("no", no);
            
            asAcceptService.asAcceptHitCnt(paramMap); //조회수 증가
            result = asAcceptService.asAcceptView(paramMap);
		}catch(Exception e){
			e.getMessage();
		}
		
		model.addAttribute("result",result);
		return "/asAccept/view";
	}
	
	@RequestMapping(value = "/asAccept/write")
	public String asAcceptWrite(){
		return "/asAccept/write";
	}
	
	@RequestMapping(value = "/asAccept/writeAction", method = RequestMethod.POST)
	public void asAcceptWriteAction(@RequestParam HashMap<String, Object> map, 
			Model model, MultipartHttpServletRequest request) throws Exception{
		log.debug("come in~~~~~~~~~~~~~~~~~~~~~~11111111111111111~~~~~~{}");
		if (result.hasErrors()) {
			log.debug("result.hasErrors()=> {}", result.getFieldError());

			model.addAttribute("resultMsg", "delete input err");
			model.addAttribute("returnMsg", "false");
			return;
		}
		
		log.debug("come in~~~~~~~~~~~~~~~~~~~~~~~~~~~~{}");
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
	    Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
	    
        MultipartFile multipartFile = null;
        String originalFileName = null;
        String originalFileExtension = null;
        String storedFileName = null;
        
    	File file = new File(filePath);
	    if(file.exists() == false){
	        file.mkdirs();
	    }
	    
	    String startDate = DateUtil.getNow("yyyMMddHHmmss");
	    
	    
	    HashMap<String, Object> paramMap = new HashMap<String, Object>();
	    
        if(iterator.hasNext()){
        	
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false){
				originalFileName = multipartFile.getOriginalFilename();
				log.debug("originalFileName 파일 네임 = " + originalFileName);
				
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				log.debug("originalFileExtension 파일 네임 = " + originalFileExtension);
				
				storedFileName = startDate + multipartFile.getSize();
				log.debug("storedFileName 파일 네임 = " + storedFileName);
				
				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
                
				paramMap.put("uploadFileKeys", storedFileName + "^");
				paramMap.put("uploadFileNames", multipartFile.getOriginalFilename() + "^");
				paramMap.put("boardSize", String.valueOf(multipartFile.getSize()) + "^");
            }
            
        }else{
			paramMap.put("uploadFileKeys", "");
			paramMap.put("uploadFileNames", "");
			paramMap.put("boardSize", "");			
        }
        
		paramMap.put("uploadPath", filePath);
		paramMap.put("uploadFileNames", multipartFile.getOriginalFilename() + "^");
		paramMap.put("boardSize", String.valueOf(multipartFile.getSize()) + "^");
		
    	model.addAttribute("resultMsg", "잘못된 접근입니다..");
		model.addAttribute("returnMsg", "false");
	}
	
	//파일이미지 업로드 샘플 (기본)start
	@RequestMapping(value="/asAccept/uploadForm", method=RequestMethod.POST)
	public String uploadForm(){
		log.debug(">>>>>>>>>>> uploadPath?? {}", uploadPath);
		return "/asAccept/uploadForm";
	}
	
	@RequestMapping(value="/asAccept/upload", method=RequestMethod.POST)
	public ModelAndView uploadForm(MultipartFile file, ModelAndView mav)throws Exception{
		
        log.info("파일이름 :"+file.getOriginalFilename());
        log.info("파일크기 : "+file.getSize());
        log.info("컨텐트 타입 : "+file.getContentType());
        
        String savedName = file.getOriginalFilename();

        // 랜덤생성+파일이름 저장
        // 파일명 랜덤생성 메서드호출
        savedName = uploadFile(savedName, file.getBytes());
        log.info("savedName : "+savedName);
        

        mav.setViewName("/asAccept/uploadResult");
        mav.addObject("savedName", savedName);        
        
		return mav;
	}
	//파일이미지 업로드 샘플 (기본) end
	
	//파일이미지 업로드 샘플 (AJAX)start
	@RequestMapping(value="/asAccept/uploadAjaxForm", method=RequestMethod.POST)
	public String uploadAjaxForm(){
		log.debug(">>>>>>>>>>> uploadPath?? {}", uploadPath);
		return "/asAccept/uploadAjaxForm";
	}
	
	// produces = "text/palin;charset=utf-8" : 한글처리
	
	@ResponseBody
	@RequestMapping(value="/asAccept/uploadAjax", method=RequestMethod.POST, produces = "text/palin;charset=utf-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file)throws Exception{
        log.info("파일이름 :"+file.getOriginalFilename());
        log.info("파일크기 : "+file.getSize());
        log.info("컨텐트 타입 : "+file.getContentType());
        return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
	}
	
    // 6. 이미지 표시 매핑
    @ResponseBody // view가 아닌 data리턴
    @RequestMapping("/upload/displayFile")
    public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
        // 서버의 파일을 다운로드하기 위한 스트림
        InputStream in = null; //java.io
        ResponseEntity<byte[]> entity = null;
        try {
            // 확장자를 추출하여 formatName에 저장
            String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
            // 추출한 확장자를 MediaUtils클래스에서  이미지파일여부를 검사하고 리턴받아 mType에 저장
            MediaType mType = MediaUtils.getMediaType(formatName);
            // 헤더 구성 객체(외부에서 데이터를 주고받을 때에는 header와 body를 구성해야하기 때문에)
            HttpHeaders headers = new HttpHeaders();
            // InputStream 생성
            in = new FileInputStream(uploadPath + fileName);
            // 이미지 파일이면
            if (mType != null) { 
                headers.setContentType(mType);
            // 이미지가 아니면
            } else { 
                fileName = fileName.substring(fileName.indexOf("_") + 1);
                // 다운로드용 컨텐트 타입
                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                // 
                // 바이트배열을 스트링으로 : new String(fileName.getBytes("utf-8"),"iso-8859-1") * iso-8859-1 서유럽언어, 큰 따옴표 내부에  " \" 내용 \" "
                // 파일의 한글 깨짐 방지
                headers.add("Content-Disposition", "attachment; filename=\""+new String(fileName.getBytes("utf-8"), "iso-8859-1")+"\"");
                //headers.add("Content-Disposition", "attachment; filename='"+fileName+"'");
            }
            // 바이트배열, 헤더, HTTP상태코드
            entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            // HTTP상태 코드()
            entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
        } finally {
            in.close(); //스트림 닫기
        }
        return entity;
    }
    
    // 7. 파일 삭제 매핑
    @ResponseBody // view가 아닌 데이터 리턴
    @RequestMapping(value = "/upload/deleteFile", method = RequestMethod.POST)
    public ResponseEntity<String> deleteFile(String fileName) {
        // 파일의 확장자 추출
        String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
        // 이미지 파일 여부 검사
        MediaType mType = MediaUtils.getMediaType(formatName);
        // 이미지의 경우(썸네일 + 원본파일 삭제), 이미지가 아니면 원본파일만 삭제
        // 이미지 파일이면
        if (mType != null) {
            // 썸네일 이미지 파일 추출
            String front = fileName.substring(0, 12);
            String end = fileName.substring(14);
            // 썸네일 이미지 삭제
            new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
        }
        // 원본 파일 삭제
        new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();

        // 데이터와 http 상태 코드 전송
        return new ResponseEntity<String>("deleted", HttpStatus.OK);
    }
	//파일이미지 업로드 샘플 (AJAX)end
	
	
	//파일명 랜덤생성 메서드
	private String uploadFile(String originalName, byte[] fileData)throws Exception{
		//uuid 생성(Universal Unique IDentifier, 범용 고유 식별자)
		UUID uuid = UUID.randomUUID();
		
		// 랜덤생성+파일이름 저장
		String savedName = uuid.toString()+"_"+originalName;
		File target = new File(uploadPath, savedName);
		
		//임시디렉토리에 저장된 업로드된 파일을 지정된 디렉토리에 저장
		//FileCopyUtils.copy(바이트배열, 파일객체)
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
	}
	*/
	/*
	@RequestMapping(value = "/asAccept/list")
	public String list(Model model) throws Exception{
		log.debug(">>>>>>>>>>> asAccept list");
		log.debug(">>>>>>>>>>> uploadPath?? {}", uploadPath);
		return "/asAccept/list";
	}
	
	@ResponseBody
	@RequestMapping(value="/asAccept/list.json")
	public Map<String, Object> asAcceptListJson(@RequestParam HashMap<String, Object> map) throws Exception{
		
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
            
            List<HashMap<String, Object>> resultList = asAcceptService.asAcceptList(paramMap);
            
            totalCount = asAcceptService.totalCount(paramMap);
            
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
	

	@RequestMapping(value = "/asAccept/view")
	public String asAcceptView(@RequestParam HashMap<String, Object> map, Model model){
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		String no = "";
		
		try{
			if(map != null && !map.isEmpty()){
			   log.debug("REQS>>>>>" + map.toString());
			   no = StringUtil.isNullToString(map.get("no"));
				
			}
            HashMap<String, Object> paramMap = new HashMap<String, Object>();
            paramMap.put("no", no);
            
            asAcceptService.asAcceptHitCnt(paramMap); //조회수 증가
            result = asAcceptService.asAcceptView(paramMap);
		}catch(Exception e){
			e.getMessage();
		}
		
		model.addAttribute("result",result);
		return "/asAccept/view";
	}
	
	@RequestMapping(value = "/asAccept/write")
	public String asAcceptWrite(){
		return "/asAccept/write";
	}
	
	@RequestMapping(value = "/asAccept/writeAction", method = RequestMethod.POST)
	public void asAcceptWriteAction(@RequestParam HashMap<String, Object> map, 
			Model model, MultipartHttpServletRequest request) throws Exception{
		log.debug("come in~~~~~~~~~~~~~~~~~~~~~~11111111111111111~~~~~~{}");
		if (result.hasErrors()) {
			log.debug("result.hasErrors()=> {}", result.getFieldError());

			model.addAttribute("resultMsg", "delete input err");
			model.addAttribute("returnMsg", "false");
			return;
		}
		
		log.debug("come in~~~~~~~~~~~~~~~~~~~~~~~~~~~~{}");
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
	    Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
	    
        MultipartFile multipartFile = null;
        String originalFileName = null;
        String originalFileExtension = null;
        String storedFileName = null;
        
    	File file = new File(filePath);
	    if(file.exists() == false){
	        file.mkdirs();
	    }
	    
	    String startDate = DateUtil.getNow("yyyMMddHHmmss");
	    
	    
	    HashMap<String, Object> paramMap = new HashMap<String, Object>();
	    
        if(iterator.hasNext()){
        	
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false){
				originalFileName = multipartFile.getOriginalFilename();
				log.debug("originalFileName 파일 네임 = " + originalFileName);
				
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				log.debug("originalFileExtension 파일 네임 = " + originalFileExtension);
				
				storedFileName = startDate + multipartFile.getSize();
				log.debug("storedFileName 파일 네임 = " + storedFileName);
				
				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
                
				paramMap.put("uploadFileKeys", storedFileName + "^");
				paramMap.put("uploadFileNames", multipartFile.getOriginalFilename() + "^");
				paramMap.put("boardSize", String.valueOf(multipartFile.getSize()) + "^");
            }
            
        }else{
			paramMap.put("uploadFileKeys", "");
			paramMap.put("uploadFileNames", "");
			paramMap.put("boardSize", "");			
        }
        
		paramMap.put("uploadPath", filePath);
		paramMap.put("uploadFileNames", multipartFile.getOriginalFilename() + "^");
		paramMap.put("boardSize", String.valueOf(multipartFile.getSize()) + "^");
		
    	model.addAttribute("resultMsg", "잘못된 접근입니다..");
		model.addAttribute("returnMsg", "false");
	}
	
	//파일이미지 업로드 샘플 (기본)start
	@RequestMapping(value="/asAccept/uploadForm", method=RequestMethod.POST)
	public String uploadForm(){
		log.debug(">>>>>>>>>>> uploadPath?? {}", uploadPath);
		return "/asAccept/uploadForm";
	}
	
	@RequestMapping(value="/asAccept/upload", method=RequestMethod.POST)
	public ModelAndView uploadForm(MultipartFile file, ModelAndView mav)throws Exception{
		
        log.info("파일이름 :"+file.getOriginalFilename());
        log.info("파일크기 : "+file.getSize());
        log.info("컨텐트 타입 : "+file.getContentType());
        
        String savedName = file.getOriginalFilename();

        // 랜덤생성+파일이름 저장
        // 파일명 랜덤생성 메서드호출
        savedName = uploadFile(savedName, file.getBytes());
        log.info("savedName : "+savedName);
        

        mav.setViewName("/asAccept/uploadResult");
        mav.addObject("savedName", savedName);        
        
		return mav;
	}
	//파일이미지 업로드 샘플 (기본) end
	
	//파일이미지 업로드 샘플 (AJAX)start
	@RequestMapping(value="/asAccept/uploadAjaxForm", method=RequestMethod.POST)
	public String uploadAjaxForm(){
		log.debug(">>>>>>>>>>> uploadPath?? {}", uploadPath);
		return "/asAccept/uploadAjaxForm";
	}
	
	// produces = "text/palin;charset=utf-8" : 한글처리
	@ResponseBody
	@RequestMapping(value="/asAccept/uploadAjax", method=RequestMethod.POST, produces = "text/palin;charset=utf-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file)throws Exception{
        log.info("파일이름 :"+file.getOriginalFilename());
        log.info("파일크기 : "+file.getSize());
        log.info("컨텐트 타입 : "+file.getContentType());
        return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
	}
	
    // 6. 이미지 표시 매핑
    @ResponseBody // view가 아닌 data리턴
    @RequestMapping("/upload/displayFile")
    public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
        // 서버의 파일을 다운로드하기 위한 스트림
        InputStream in = null; //java.io
        ResponseEntity<byte[]> entity = null;
        try {
            // 확장자를 추출하여 formatName에 저장
            String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
            // 추출한 확장자를 MediaUtils클래스에서  이미지파일여부를 검사하고 리턴받아 mType에 저장
            MediaType mType = MediaUtils.getMediaType(formatName);
            // 헤더 구성 객체(외부에서 데이터를 주고받을 때에는 header와 body를 구성해야하기 때문에)
            HttpHeaders headers = new HttpHeaders();
            // InputStream 생성
            in = new FileInputStream(uploadPath + fileName);
            // 이미지 파일이면
            if (mType != null) { 
                headers.setContentType(mType);
            // 이미지가 아니면
            } else { 
                fileName = fileName.substring(fileName.indexOf("_") + 1);
                // 다운로드용 컨텐트 타입
                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                // 
                // 바이트배열을 스트링으로 : new String(fileName.getBytes("utf-8"),"iso-8859-1") * iso-8859-1 서유럽언어, 큰 따옴표 내부에  " \" 내용 \" "
                // 파일의 한글 깨짐 방지
                headers.add("Content-Disposition", "attachment; filename=\""+new String(fileName.getBytes("utf-8"), "iso-8859-1")+"\"");
                //headers.add("Content-Disposition", "attachment; filename='"+fileName+"'");
            }
            // 바이트배열, 헤더, HTTP상태코드
            entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            // HTTP상태 코드()
            entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
        } finally {
            in.close(); //스트림 닫기
        }
        return entity;
    }
    
    // 7. 파일 삭제 매핑
    @ResponseBody // view가 아닌 데이터 리턴
    @RequestMapping(value = "/upload/deleteFile", method = RequestMethod.POST)
    public ResponseEntity<String> deleteFile(String fileName) {
        // 파일의 확장자 추출
        String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
        // 이미지 파일 여부 검사
        MediaType mType = MediaUtils.getMediaType(formatName);
        // 이미지의 경우(썸네일 + 원본파일 삭제), 이미지가 아니면 원본파일만 삭제
        // 이미지 파일이면
        if (mType != null) {
            // 썸네일 이미지 파일 추출
            String front = fileName.substring(0, 12);
            String end = fileName.substring(14);
            // 썸네일 이미지 삭제
            new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
        }
        // 원본 파일 삭제
        new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();

        // 데이터와 http 상태 코드 전송
        return new ResponseEntity<String>("deleted", HttpStatus.OK);
    }
	//파일이미지 업로드 샘플 (AJAX)end
	
	
	//파일명 랜덤생성 메서드
	private String uploadFile(String originalName, byte[] fileData)throws Exception{
		//uuid 생성(Universal Unique IDentifier, 범용 고유 식별자)
		UUID uuid = UUID.randomUUID();
		
		// 랜덤생성+파일이름 저장
		String savedName = uuid.toString()+"_"+originalName;
		File target = new File(uploadPath, savedName);
		
		//임시디렉토리에 저장된 업로드된 파일을 지정된 디렉토리에 저장
		//FileCopyUtils.copy(바이트배열, 파일객체)
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
	}
*/
}
