package com.hhi.wiart.common.util;

import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import java.util.HashMap;
//import org.apache.commons.collections.map.ListOrderedMap;

public class CustomMap extends HashMap {
    /*
    protected CustomMap(Map map) {
        super(map);
        // TODO Auto-generated constructor stub
    }
    */
    /** serialVersionUID */
    private static final long serialVersionUID = -7700790403928325865L;
 
    /**
     * key 에 대하여 소문자로 변환하여 super.put
     * (ListOrderedMap) 을 호출한다.
     * @param key
     *        - '_' 가 포함된 변수명
     * @param value
     *        - 명시된 key 에 대한 값 (변경 없음)
     * @return previous value associated with specified
     *         key, or null if there was no mapping for
     *         key
     */
    public Object put(Object key, Object value) {
        return super.put(StringUtils.lowerCase((String) key), value);
    }

}
