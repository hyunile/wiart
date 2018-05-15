package com.hhi.wiart.common.util;

import javax.servlet.http.HttpServletRequest;

public interface SessionStorageProvider {
	
	/**
	 * Session 속성을 구한다.
	 * @param request
	 * @param key
	 * @return object
	 */
	public Object getAttribute(HttpServletRequest request, String key);
	
	/**
	 * Session 속성을 구한다.
	 * @param sessionId
	 * @param key
	 * @return
	 */
	public Object getAttribute(String sessionId, String key);
	
	
	/**
	 * session 속성을 설정한다.
	 * @param request
	 * @param key
	 * @param value
	 * @return
	 */
	public Object setAttribute(HttpServletRequest request, String key, Object value);
	
	/**
	 * Session 속성을 삭제한다.
	 *
	 * @param	request : request
	 * @param	key : key
	 * @return
	*/
	public void removeAttribute(HttpServletRequest request, String key);
}
