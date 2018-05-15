/**
 * 
 */
package com.hhi.wiart.common.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

/**
 * <PRE>
 * 1. ClassName: MediaUtils
 * 2. FileName : MediaUtils.java
 * 3. Package  : com.hhi.wiart.util
 * 4. Comment  : UploadFileUtils클래스에서 추출한 파일의 확장자명을 대문자로 변환하고, mediaMap에 담긴 값을 호출한 뒤 리턴한다.
 *  	    	 3가지(jpg,gif,png) 이미지 파일일 경우에는 값이 복사되어 리턴되지만, 아닐경우에는 null상태로 리턴된다.
 * 5. 작성자   : hhi
 * 6. 작성일   : 2018. 5. 11.
 * 7. 변경이력
 *		이름	:	일자	    : 변경내용
 *     ———————————————————————————————————
 *		hhi :	2018. 5. 11.	: 신규 개발.
 * </PRE>
 */

public class MediaUtils {
	private static Map<String, MediaType> mediaTypeMap;
	// 자동로딩
    // 클래스 초기화 블럭
    static {
        mediaTypeMap = new HashMap<>();
        mediaTypeMap.put("JPG", MediaType.IMAGE_JPEG);
        mediaTypeMap.put("GIF", MediaType.IMAGE_GIF);
        mediaTypeMap.put("PNG", MediaType.IMAGE_PNG);
    }

    // 파일 타입
    public static MediaType getMediaType(String fileName) {
        String formatName = getFormatName(fileName);
        return mediaTypeMap.get(formatName);
    }

    // 파일 확장자 추출
    static String getFormatName(String fileName) {
        return fileName.substring(fileName.lastIndexOf(".") + 1).toUpperCase();
    }
}
