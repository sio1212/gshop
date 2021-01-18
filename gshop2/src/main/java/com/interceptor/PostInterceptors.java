package com.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import admin.bean.AdminDTO;
import member.bean.MemberDTO;
@Component
public class PostInterceptors extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		HttpSession session = request.getSession();	
		
		AdminDTO adminDTO = (AdminDTO) session.getAttribute("adminDTO");

		
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberDTO");//현재 로그인 여부부터 확인
		if(memberDTO!=null) {
			return;
		}
	}
}