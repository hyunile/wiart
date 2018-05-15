package com.hhi.wiart.model;

import org.springframework.web.multipart.MultipartFile;

public class FileVO {
	
	//photo_uploader.html페이지의 form태그내에 존재하는 file 태그의 name명과 일치시켜줌
    private MultipartFile Filedata;
    //callback URL
    private String callback;
    //콜백함수??
    private String callback_func;
 
	private String fileSize;	//업로드 파일 사이즈

	private String fileUpdateYn;	//파일 수정 여부 (수정시 기존파일 삭제때 사용)
	
	private String originFileKeys; //기존 파일 키 (수정시 기존파일 삭제때 사용)
	
	private String uploadFileKeys;	//업로드 파일 키값
	
	private String uploadFileNames;	//업로드파일 이름
	
	private String isAttachFile;
	
	private String[] files;
	
	private int fileCnt;
	
	public int getFileCnt() {
		return fileCnt;
	}

	public void setFileCnt(int fileCnt) {
		this.fileCnt = fileCnt;
	}

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
		setFileCnt(files.length);
	}

	public MultipartFile getFiledata() {
		return Filedata;
	}

	public void setFiledata(MultipartFile filedata) {
		Filedata = filedata;
	}

	public String getCallback() {
		return callback;
	}

	public void setCallback(String callback) {
		this.callback = callback;
	}

	public String getCallback_func() {
		return callback_func;
	}

	public void setCallback_func(String callback_func) {
		this.callback_func = callback_func;
	}

	public String getFileSize() {
		return fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}

	public String getFileUpdateYn() {
		return fileUpdateYn;
	}

	public void setFileUpdateYn(String fileUpdateYn) {
		this.fileUpdateYn = fileUpdateYn;
	}

	public String getOriginFileKeys() {
		return originFileKeys;
	}

	public void setOriginFileKeys(String originFileKeys) {
		this.originFileKeys = originFileKeys;
	}

	public String getUploadFileKeys() {
		return uploadFileKeys;
	}

	public void setUploadFileKeys(String uploadFileKeys) {
		this.uploadFileKeys = uploadFileKeys;
	}

	public String getUploadFileNames() {
		return uploadFileNames;
	}

	public void setUploadFileNames(String uploadFileNames) {
		this.uploadFileNames = uploadFileNames;
	}

	public String getIsAttachFile() {
		return isAttachFile;
	}

	public void setIsAttachFile(String isAttachFile) {
		this.isAttachFile = isAttachFile;
	}
}
