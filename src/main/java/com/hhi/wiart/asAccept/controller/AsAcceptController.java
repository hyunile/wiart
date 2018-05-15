package com.hhi.wiart.asAccept.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.hhi.wiart.model.FileVO;


@Controller
public class AsAcceptController {
	
	private static final Logger log = LoggerFactory.getLogger(AsAcceptController.class);
	
	@Autowired
	private AsAcceptService asAcceptService;
	
	//bean의 id가 uploadPath인 태그 참조
	@Resource(name="uploadPath")
	String uploadPath;
	
	//@Value("${fileupload.path}")
	//@Value("C:/wiart/wiart/src/main/webapp/editor/img/upload/")
	@Value("C:/data/upload")
	private String filePath;
	
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
/*		if (result.hasErrors()) {
			log.debug("result.hasErrors()=> {}", result.getFieldError());

			model.addAttribute("resultMsg", "delete input err");
			model.addAttribute("returnMsg", "false");
			return;
		}
		*/
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		
		
	    Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
	    log.info("come in222222222222222222~~~~~~~~~~~~~~~~~~~~~~~~~~~~{} :" + multipartHttpServletRequest.getFileNames());
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
	    log.info("come 333333333333333333~~~~~~~~~~~~~~~~~~~~filePath~~~~~~~~{} :" , filePath);
	    
        if(iterator.hasNext()){
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			log.info("come 3,5~~~~~~~~~~~~~~~~~~~~~~~~~{} :" + multipartFile);
			log.info("come 3,5~~~~~~~~~~~~~~~~~~~~~~~~~{} :" + multipartFile);
			log.info("come 44444444444444~~~~~~~~~~~~~~~~~~~~~~~~~{} :" + multipartFile.isEmpty());
			log.info("come 555555555555555~~~~~~~~~~~~~~~~~~~~~~~~~{} :" + multipartFile.getOriginalFilename());
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
		
		log.info("come 666666666666~~~~~~~~~~~~~~~~~~~~~~~~~T.T {} " , paramMap);
    	model.addAttribute("resultMsg", "잘못된 접근입니다..");
		model.addAttribute("returnMsg", "false");
	}
	
	
	 @RequestMapping("/file_uploader")
	 public String file_uploader(HttpServletRequest request, HttpServletResponse response, FileVO editor){
		 String return1=request.getParameter("callback");
		 String return2="?callback_func=" + request.getParameter("callback_func");
		 String return3="";
		 String name = "";
		 try {
			if(editor.getFiledata() != null && editor.getFiledata().getOriginalFilename() != null && !editor.getFiledata().getOriginalFilename().equals("")) {
	             // 기존 상단 코드를 막고 하단코드를 이용
	            name = editor.getFiledata().getOriginalFilename().substring(editor.getFiledata().getOriginalFilename().lastIndexOf(File.separator)+1);
				String filename_ext = name.substring(name.lastIndexOf(".")+1);
				filename_ext = filename_ext.toLowerCase();
			   	String[] allow_file = {"jpg","png","bmp","gif"};
			   	int cnt = 0;
			   	for(int i=0; i<allow_file.length; i++) {
			   		if(filename_ext.equals(allow_file[i])){
			   			cnt++;
			   		}
			   	}
			   	if(cnt == 0) {
			   		return3 = "&amp;errstr="+name;
			   	} else {
			   		//파일 기본경로
		    		String dftFilePath = request.getSession().getServletContext().getRealPath("/");
		    		//파일 기본경로 _ 상세경로
		    		String filePath = dftFilePath + "resources"+ File.separator + "editor" + File.separator +"upload" + File.separator;
		    		File file = new File(filePath);
		    		if(!file.exists()) {
		    			file.mkdirs();
		    		}
		    		String realFileNm = "";
		    		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
					String today= formatter.format(new java.util.Date());
					realFileNm = today+UUID.randomUUID().toString() + name.substring(name.lastIndexOf("."));
					String rlFileNm = filePath + realFileNm;
					///////////////// 서버에 파일쓰기 /////////////////
					editor.getFiledata().transferTo(new File(rlFileNm));
					///////////////// 서버에 파일쓰기 /////////////////
		    		return3 += "&amp;bNewLine=true";
		    		return3 += "&amp;sFileName="+ name;
		    		return3 += "&amp;sFileURL=/resources/editor/upload/"+realFileNm;
			   	}
			}else {
				  return3 += "&amp;errstr=error";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return "redirect:"+return1+return2+return3;
	 }
	 
	 @RequestMapping("/file_uploader_html5")
	 public void file_uploader_html5(HttpServletRequest request, HttpServletResponse response){
		try {
			 //파일정보
			 String sFileInfo = "";
			 //파일명을 받는다 - 일반 원본파일명
			 String filename = request.getHeader("file-name");
			 //파일 확장자
			 String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
			 //확장자를소문자로 변경
			 filename_ext = filename_ext.toLowerCase();
			 	
			 //이미지 검증 배열변수
			 String[] allow_file = {"jpg","png","bmp","gif"};

			 //돌리면서 확장자가 이미지인지 
			 int cnt = 0;
			 for(int i=0; i<allow_file.length; i++) {
			 	if(filename_ext.equals(allow_file[i])){
			 		cnt++;
			 	}
			 }

			 //이미지가 아님
			 if(cnt == 0) {
				 PrintWriter print = response.getWriter();
				 print.print("NOTALLOW_"+filename);
				 print.flush();
				 print.close();
			 } else {
			 //이미지이므로 신규 파일로 디렉토리 설정 및 업로드	
			 //파일 기본경로
			 String dftFilePath = request.getSession().getServletContext().getRealPath("/");
			 //파일 기본경로 _ 상세경로
			 String filePath = dftFilePath + "resources" + File.separator + "editor" + File.separator +"multiupload" + File.separator;
			 File file = new File(filePath);
			 if(!file.exists()) {
			 	file.mkdirs();
			 }
			 String realFileNm = "";
			 SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			 String today= formatter.format(new java.util.Date());
			 realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
			 String rlFileNm = filePath + realFileNm;
			 ///////////////// 서버에 파일쓰기 ///////////////// 
			 InputStream is = request.getInputStream();
			 OutputStream os=new FileOutputStream(rlFileNm);
			 int numRead;
			 byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			 while((numRead = is.read(b,0,b.length)) != -1){
			 	os.write(b,0,numRead);
			 }
			 if(is != null) {
			 	is.close();
			 }
			 os.flush();
			 os.close();
			 ///////////////// 서버에 파일쓰기 /////////////////

			 // 정보 출력
			 sFileInfo += "&amp;bNewLine=true";
			 // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
			 sFileInfo += "&amp;sFileName="+ filename;;
			 sFileInfo += "&amp;sFileURL="+"/resources/editor/multiupload/"+realFileNm;
			 PrintWriter print = response.getWriter();
			 print.print(sFileInfo);
			 print.flush();
			 print.close();
			 }	
		} catch (Exception e) {
			e.printStackTrace();
		}
 }
	 


}
