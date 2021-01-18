package admin.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import admin.bean.AdminDTO;
import admin.dao.AdminDAO;
import mail.bean.Mailing;
import mail.bean.MessageDTO;
import member.bean.MemberDTO;
import member.dao.MemberDAO;
import trading.bean.CouponDTO;
import trading.dao.TradingDAO;
/*
 * 관리자: 회원 관리를 제어하는 클래스
 */
@Controller
@RequestMapping(value="/admin/user/**")
public class AdminUserController {

	@Autowired
	AdminDAO adminDAO;
	
	@Autowired
	MemberDAO memberDAO;
	@Autowired
	TradingDAO tradingDAO;
	@Autowired
	Mailing mailing;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	//1. 관리자 회원 조회 화면 이동
	@RequestMapping(value="/userManage.do",method= RequestMethod.GET)
	public ModelAndView userManage() {
		
		ModelAndView mav = new ModelAndView();
			mav.addObject("location","userAdmin");		
			mav.addObject("display", "/admin/user/userManage.jsp");
			mav.setViewName("/main/home");
			
		return mav;
	}
	
	//2. 회원 정보 가져오기
		@RequestMapping(value="/getMemberList.do",method=RequestMethod.GET)
		public ModelAndView getMemberList() {
			
			List<MemberDTO> memberList = memberDAO.getMemberList();
			
			ModelAndView mav = new ModelAndView();
				mav.addObject("memberList",memberList);
				mav.setViewName("jsonView");
				
			return mav;
		}
		//3. 개별 회원 정보 조회 화면 이동
		@RequestMapping(value="/memberDetailView.do",method=RequestMethod.GET)
		public ModelAndView memberDetailView(@RequestParam String id) {
					
			ModelAndView mav = new ModelAndView();
				mav.addObject("id",id);
				mav.setViewName("/admin/user/memberDetailView");
			
			return mav;
		}		
		// 개별 회원 정보 호출
		@RequestMapping(value="/getMemberDetail.do",method=RequestMethod.GET)
		public ModelAndView getMemberDetail(@RequestParam String id) {
			
			Map<String,Object> map = tradingDAO.getUserInfo(id);
			MemberDTO memberDTO = memberDAO.getUser(id);
			if(memberDTO.getState()==3) {
			}
				map.put("memberDTO", memberDTO);
			
			ModelAndView mav = new ModelAndView();
				mav.addObject("memberInfo",map);
				mav.setViewName("jsonView");
			
			return mav;
		}	
		
		//12. 1:1문의 목록으로 이동
		@RequestMapping(value="/personalQAManager.do",method= RequestMethod.GET)	
		public ModelAndView personalQAManager() {
			
			ModelAndView mav = new ModelAndView();
				mav.addObject("location","userAdmin");
				mav.addObject("display", "/admin/user/personalQAManager.jsp");
				mav.setViewName("/main/home");
				
			return mav;		
		}		
		
		//13. 1:1문의 리스트 가져오기
		@RequestMapping(value="/getPersonalQAList.do",method=RequestMethod.GET)
		@ResponseBody	
		public ModelAndView getPersonalQAList() {
			ModelAndView mav = new ModelAndView();
			 List<MessageDTO> personalQAList = adminDAO.getPersonalQAList();
				mav.addObject("personalQAList",personalQAList);
				mav.setViewName("jsonView");
			
			return mav;				
		}
		//5. 개별 1:1문의 팝업창 이동
		@RequestMapping(value="/personalQAFormAdmin.do",method=RequestMethod.GET)
		public ModelAndView personalQAFormAdmin(@RequestParam String seq) {
			ModelAndView mav = new ModelAndView();
			 MessageDTO messageDTO = adminDAO.getPersonalQA(seq);
				mav.addObject("messageDTO",messageDTO);
				mav.setViewName("/admin/user/personalQAFormAdmin");
			return mav;				
		}	
		
		//6. 1:1문의 답변(메일 전송) & 삭제
		@RequestMapping(value="/replyPersonalQA.do",method=RequestMethod.POST)
		@ResponseBody
		public String replyPersonalQA(@ModelAttribute MessageDTO messageDTO) {
			
			String subject = "[고객님의 1:1문의에 대한 답변입니다] RE: "+messageDTO.getSubject();
			String content = StringEscapeUtils.unescapeHtml4(messageDTO.getContent());
				messageDTO.setSubject(subject);
				messageDTO.setSender("[Kissin' Bugs]");
				messageDTO.setContent(content);
				messageDTO.setContainHTML(true);
			AdminDTO adminDTO = adminDAO.getAdmin();
				
				mailing.sendMailwithFile(adminDTO, messageDTO);
				adminDAO.deleteQA(messageDTO.getSeq()+"");
			
				return "success";
		}
}
