/**
 * 
 */
package com.hhi.wiart.common.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

/**
 * <PRE>
 * 1. ClassName: CommonExceptionAdvice
 * 2. FileName : CommonExceptionAdvice.java
 * 3. Package  : com.hhi.wiart.common.exception
 * 4. Comment  :
 * 5. 작성자   : hhi
 * 6. 작성일   : 2018. 5. 15.
 * 7. 변경이력
 *		이름	:	일자	    : 변경내용
 *     ———————————————————————————————————
 *		hhi :	2018. 5. 15.	: 신규 개발.
 * </PRE>
 */

@ControllerAdvice
public class CommonExceptionAdvice {

	private static final Logger log = LoggerFactory.getLogger(CommonExceptionAdvice.class);
	
	@ExceptionHandler(Exception.class)
	public ModelAndView commonException(Exception e) {
		
		log.info(" Exception e : {}" , e.toString());
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("exception", e);
		modelAndView.setViewName("/commons/exception");
		
		return modelAndView;
	}
}
