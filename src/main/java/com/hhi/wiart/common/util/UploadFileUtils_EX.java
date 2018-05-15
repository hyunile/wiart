/**
 * 
 */
package com.hhi.wiart.common.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

import com.ibm.icu.text.DecimalFormat;
import com.ibm.icu.util.Calendar;

/**
 * <PRE>
 * 1. ClassName: UploadFileUtils
 * 2. FileName : UploadFileUtils.java
 * 3. Package  : com.hhi.wiart.util
 * 4. Comment  : UploadFileUtils
 * 5. 작성자   : hhi
 * 6. 작성일   : 2018. 5. 11.
 * 7. 변경이력
 *		이름	:	일자	    : 변경내용
 *     ———————————————————————————————————
 *		hhi :	2018. 5. 11.	: 신규 개발.
 * </PRE>
 */

public class UploadFileUtils_EX {

	/**
	 * 
	파일을 한 디렉토리에 계속 저장해 파일이 많이지면 나중에 검색속도가 느려지고, 파일관리가 쉽지가 않다. 
	그렇기 때문에 파일을 업로드할 때마다 날짜별(연,월,일)로 디렉토리를 생성하도록 처리해주었다. 
	calcPath()메서드에서 날짜별 디렉토리를 추출하고, makeDir()메서드로 디렉토리를 생성한다.
	업로드된 파일이 이미지 파일일 경우에는 뷰에서 미리보기 화면을 보여주기 위해 썸네일 이미지를 생성한다. 
	원본파일의 확장자명을 추출하고, 변수formatName에 저장하여 MeidaUtils클래스에서 이미지 파일 여부를 확인하여 리턴한다. 
	리턴된 변수formatName이 null이 아니면 makeThumbnail()메서드에서 썸네일을 생성하고, 
	null일 경우 makeIcon()메서드에서 아이콘을 생성한다.
	 */
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData)throws Exception{
        // UUID 발급
        UUID uuid = UUID.randomUUID();
        // 저장할 파일명 = UUID + 원본이름
        String savedName = uuid.toString() + "_" + originalName;
        // 업로드할 디렉토리(날짜별 폴더) 생성 
        String savedPath = calcPath(uploadPath);
        // 파일 경로(기존의 업로드경로+날짜별경로), 파일명을 받아 파일 객체 생성
        File target = new File(uploadPath + savedPath, savedName);
        // 임시 디렉토리에 업로드된 파일을 지정된 디렉토리로 복사
        FileCopyUtils.copy(fileData, target);
        // 썸네일을 생성하기 위한 파일의 확장자 검사
        // 파일명이 aaa.bbb.ccc.jpg일 경우 마지막 마침표를 찾기 위해
        String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
        String uploadedFileName = null;
        // 이미지 파일은 썸네일 사용
        if (MediaUtils.getMediaType(formatName) != null) {
            // 썸네일 생성
            uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
        // 나머지는 아이콘
        } else {
            // 아이콘 생성
            uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
        }
        return uploadedFileName;
		
	}
	
	// 날짜별 디렉토리 추출
	private static String calcPath(String uploadPath){
		Calendar cal = Calendar.getInstance();
		// File.separator : 디렉토리 구분자(\\
		// 연도, ex) \\2018
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		System.out.println("yearPath : " + yearPath);
		// 월, ex) \\2018\\05
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		System.out.println("monthPath : " + monthPath);
		// 날짜, ex) \\2018\\05\\01
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		System.out.println("datePath : " + datePath);
		// 디렉토리 생성 메서드 호출
		makeDir(uploadPath, yearPath, monthPath, datePath);
		return datePath;
	}
	
	// 디렉토리 생성
	private static void makeDir(String uploadPath, String... paths){
		// 디렉토리가 존재하면
		if(new File(paths[paths.length - 1]).exists()){
			return;
		}
		// 디렉토리가 존재하지 않으면
		for(String path : paths){
			File dirPath = new File(uploadPath + path);
			if(!dirPath.exists()){
				dirPath.mkdirs(); //디렉토리 생성
			}
		}
	}
	// 썸네일 생성
    private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
        // 이미지를 읽기 위한 버퍼
        BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
        // 100픽셀 단위의 썸네일 생성
        BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
        // 썸네일의 이름을 생성(원본파일명에 's_'를 붙임)
        String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;
        File newFile = new File(thumbnailName);
        String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
        // 썸네일 생성
        ImageIO.write(destImg, formatName.toUpperCase(), newFile);
        // 썸네일의 이름을 리턴함
        return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
    }
    
    // 아이콘 생성
    private static String makeIcon(String uploadPath, String path, String fileName) throws Exception {
        // 아이콘의 이름
        String iconName = uploadPath + path + File.separator + fileName;
        // 아이콘 이름을 리턴
        // File.separatorChar : 디렉토리 구분자
        // 윈도우 \ , 유닉스(리눅스) /         
        return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
    }
}
