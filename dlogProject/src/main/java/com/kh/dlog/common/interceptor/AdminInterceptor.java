package com.kh.dlog.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.dlog.member.model.vo.Member;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		// true리턴 : 기존의 흐름대로 해당 controller 구동시키겠다는걸 의미
		// false리턴 : 기존에 실행하려고 했던 controller 구동시키지 않음을 의미
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser") != null && ((Member)session.getAttribute("loginUser")).getMemberNo() == 1) { // 로그인 전
			
			return true;
		}else { // 로그인 후
			session.setAttribute("alertMsg", "잘못된 접근입니다.");
			response.sendRedirect(request.getContextPath());
			
			return false;
		}
		
	}
}
