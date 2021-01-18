package com.gshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/*
 *쇼핑몰 메인 제어용 클래스(공통 논리, 특정 계층에 속하지 않는 경우 포함)
 */
@Controller
public class HomeController {
		
	//1. 쇼핑몰 내부 메인 이동
	@RequestMapping(value = "/main/home.do", method = RequestMethod.GET)
	public ModelAndView home() {
		/*
		 *  ModelAndView : 데이터와 뷰를 동시에 설정이 가능
		 *  addObject : 뷰로 보낼 데이터 값 ("변수 이름", "데이터 값")
		 *  setViewName : 뷰의 이름을 설정 (뷰의 경로) 
		 *  return 값으로 ModelAndView 객체를 반환
		 *  jsp도 똑같이 Data : ${~~} 
		 */
		ModelAndView mav = new ModelAndView();
		mav.addObject("location", "home");
		mav.addObject("display", "/main/content.jsp");
		mav.addObject("headline", "/main/header.jsp");
		mav.addObject("productmain", "/product/productmain.jsp");
		// display 변수에 content.jsp 넣어서 표현 
		mav.addObject("menu", "/main/left.jsp");
		mav.setViewName("/main/home");		
		return mav;
	}
	
}
