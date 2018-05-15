package com.hhi.wiart.common.interceptor;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.mvc.WebContentInterceptor;


/**
 * 인증여부 체크 인터셉터
 * @author 공통서비스 개발팀 서준식
 * @since 2011.07.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2011.07.01  서준식          최초 생성
 *  2017.07.18  박인하          윤선생 프로젝트에 맞도록 변경
 *  </pre>
 */

public class AuthenticInterceptor extends WebContentInterceptor {

	/**
	 * 세션에 계정정보(LoginVO)가 있는지 여부로 인증 여부를 체크한다.
	 * 계정정보(LoginVO)가 없다면, 로그인 페이지로 이동한다.
	 */
//	
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException {
//
//		LoginVO loginVO = (LoginVO) UserDetailsHelper.getAuthenticatedUser();
//
//		if (loginVO.getOptor_id() != null) {
//			return true;
//		} else {
//			ModelAndView modelAndView = new ModelAndView("redirect:/com/userLogin.do");
//			throw new ModelAndViewDefiningException(modelAndView);
//		}
//	}

}
