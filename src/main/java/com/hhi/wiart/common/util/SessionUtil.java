package com.hhi.wiart.common.util;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public final class SessionUtil {

	/** Logger */
	private static final Logger LOG = LoggerFactory.getLogger(SessionUtil.class);
	
	/** 세션 저장소 provider. */
	private static final List<SessionStorageProvider> SESSION_STORAGE_PROVIDERS = new ArrayList<SessionStorageProvider>();
	
	/** 세션 타입. */
	private static final String SESSION_STORAGE = "was";
	
	/**
	 * 생성자 생성불가.
	 */
	private SessionUtil() {
		throw new AssertionError("Unacceptable Constructor");
	}
	
	public static void initProvider(){
		synchronized(SessionUtil.class){
			if(SESSION_STORAGE_PROVIDERS.size() > 0){
				return;
			}
		}
	}
}
