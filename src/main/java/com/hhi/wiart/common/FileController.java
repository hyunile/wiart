/**
 * 
 */
package com.hhi.wiart.common;

import java.io.FileInputStream;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.hhi.wiart.asAccept.service.AsAcceptService;
import com.hhi.wiart.common.util.UploadFileUtils;

/**
 * <PRE>
 * 1. ClassName: FileController
 * 2. FileName : FileController.java
 * 3. Package  : com.hhi.wiart.common
 * 4. Comment  :
 * 5. 작성자   : hhi
 * 6. 작성일   : 2018. 5. 14.
 * 7. 변경이력
 *		이름	:	일자	    : 변경내용
 *     ———————————————————————————————————
 *		hhi :	2018. 5. 14.	: 신규 개발.
 * </PRE>
 */

@RestController
@RequestMapping("/asAccept/file")
public class FileController {
	
	@Autowired
	private AsAcceptService asAcceptService;
	
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadFile(MultipartFile file, HttpServletRequest request){
        ResponseEntity<String> entity = null;
        try {
            String savedFilePath = UploadFileUtils.uploadFile(file, request);
            entity = new ResponseEntity<>(savedFilePath, HttpStatus.CREATED);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        return entity;
	}

	// 게시글 첨부파일 출력
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String fileName, HttpServletRequest request) throws Exception {

	    HttpHeaders httpHeaders = UploadFileUtils.getHttpHeaders(fileName); // Http 헤더 설정 가져오기
	    String rootPath = UploadFileUtils.getRootPath(fileName, request); // 업로드 기본경로 경로

	    ResponseEntity<byte[]> entity = null;

	    // 파일데이터, HttpHeader 전송
	    try (InputStream inputStream = new FileInputStream(rootPath + fileName)) {
	        entity = new ResponseEntity<>(IOUtils.toByteArray(inputStream), httpHeaders, HttpStatus.CREATED);
	    } catch (Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	}
	
	// 게시글 파일 삭제 : 게시글 작성 페이지
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName, HttpServletRequest request) {
	    ResponseEntity<String> entity = null;

	    try {
	        UploadFileUtils.deleteFile(fileName, request);
	        entity = new ResponseEntity<>("DELETED", HttpStatus.OK);
	    } catch (Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
	    }

	    return entity;
	}
}
