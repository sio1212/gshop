	package member.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import admin.bean.AdminDTO;
import admin.dao.AdminDAO;
import mail.bean.Mailing;
import mail.bean.MessageDTO;
import member.bean.MemberDTO;
import member.dao.MemberDAO;
import product.bean.ProductDTO;
import trading.bean.CouponDTO;
import trading.bean.FileMaker;
import trading.bean.JsonTransitioner;
import trading.bean.OrderDTO;
import trading.bean.ShoppingCart;
import trading.dao.TradingDAO;

@Controller
@RequestMapping(value = "/member/**")
public class MemberController {
	
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private TradingDAO tradingDAO;
	@Autowired
	private Mailing mailing;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private AdminDAO adminDAO;
	@Autowired
	JsonTransitioner jsonTrans;
	
	// 로그인 화면 이동
	@RequestMapping(value = "/loginForm.do" , method = RequestMethod.GET)
	public ModelAndView loginForm() {
		
		ModelAndView mav = new ModelAndView();
			mav.addObject("location", "loginForm");
			mav.addObject("display", "/member/loginForm.jsp");
			mav.setViewName("/main/home");
		
			return mav;
	}

	// 아이디/비밀번호 찾기 화면 이동
	@RequestMapping(value = "/findForm.do" , method = RequestMethod.GET)
	public ModelAndView findForm() {
	
		ModelAndView mav = new ModelAndView();
			mav.addObject("display", "/member/findForm.jsp");
			mav.setViewName("/main/home");

			return mav;	  
	}
		
	// 로그인 체크
	@RequestMapping(value = "/login.do" , method = RequestMethod.POST)
	@ResponseBody
	public String login(@RequestParam String id, String pwd, String autoLogin, HttpSession session, HttpServletResponse response,Model model) {
		
		int timeLimit=60*60*24*2; // 이틀
		String objectPwd;
		String sessionId= session.getId();
		String json;
		
		ShoppingCart shoppingCart;	
		List<ProductDTO> cartList;
		
			//(1) 회원 정보 찾기
			MemberDTO memberDTO = memberDAO.checkId(id);
			if(memberDTO==null) return "invalidLogin";
			//(2) 비밀번호 일치 확인
			objectPwd = memberDTO.getPwd();
			if(passwordEncoder.matches(pwd, objectPwd)) {
				if(memberDTO.getState()==3) return "invalidate";
				else {
						session.setAttribute("memberDTO", memberDTO);
						
					if(memberDTO.getState()==0) {					
						return  "adminLogin";}
						
						Cookie loginCookie = new Cookie("loginCookie",sessionId);				
							loginCookie.setPath("/");
							loginCookie.setMaxAge(timeLimit);
							response.addCookie(loginCookie);
					//(3) 자동로그인 관련 처리	
					if(autoLogin.equals("1")) {
						Date sessionLimit = new Date(System.currentTimeMillis()+(1000*timeLimit));
							memberDAO.keepLogin(id, sessionId, sessionLimit);}
					
					//(4) 장바구니 관련 처리
							shoppingCart = tradingDAO.getCartList(memberDTO.getId());

					if(shoppingCart!=null) {
							json = shoppingCart.getCartList_json();
							cartList = jsonTrans.makeJsonToList(json);
							if(cartList!=null) {
								session.setAttribute("cartList", cartList);
								shoppingCart.setCartList(cartList);}
							
							session.setAttribute("shoppingCart", shoppingCart);}
					
					
					return "userLogin";}}	
			return "fail";
	}
	
	// 로그아웃하기
		@RequestMapping(value="/logout.do",method=RequestMethod.GET)

		public ModelAndView logout(HttpServletRequest request,HttpServletResponse response, HttpSession session){
			
			String cartList_json;
			
			Object object = session.getAttribute("memberDTO");
			
			if(object != null) {
				MemberDTO memberDTO = (MemberDTO) object;
				ShoppingCart shoppingCart = (ShoppingCart)session.getAttribute("shoppingCart");
				if(shoppingCart!=null) {
					List<ProductDTO> cartList = shoppingCart.getCartList();
					if(cartList!=null) {
							cartList_json = jsonTrans.makeListToJson(cartList);
							shoppingCart.setCartList_json(cartList_json);
							shoppingCart.setMemberid(memberDTO.getId());
							tradingDAO.storeCartList(shoppingCart);}}
					
					session.removeAttribute("memberDTO");
					session.invalidate();
					
				Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
					if(loginCookie != null) {
							loginCookie.setPath("/");
							loginCookie.setMaxAge(0);
							response.addCookie(loginCookie);
							memberDAO.keepLogin(memberDTO.getId(),"NONE",new Date());}}
			else {
				Object guestDTO = session.getAttribute("guestDTO");
				if(guestDTO!=null) {
					session.removeAttribute("guestDTO");
					session.invalidate();
				}
			}
			ModelAndView mav = new ModelAndView();
				mav.setViewName("/common/returnHome");
				
			return mav;
		}	
	
	// 회원가입 화면 이동
	@RequestMapping(value = "/writeForm.do" , method = RequestMethod.GET)
	public ModelAndView writeForm() {
		
		ModelAndView mav = new ModelAndView();
			mav.addObject("location", "joinForm");
			mav.addObject("display", "/member/writeForm.jsp");
			mav.setViewName("/main/home");
			
		return mav;
	}
	
	@RequestMapping(value="/write.do" , method = RequestMethod.POST)
	@ResponseBody 
	public String write(@ModelAttribute MemberDTO memberDTO) throws ParseException {
		String pwd;
		int result;
		
			pwd = passwordEncoder.encode(memberDTO.getPwd());
			memberDTO.setPwd(pwd);
			
			result = memberDAO.write(memberDTO);
		
		if(result!=0) {
			MessageDTO messageDTO = new MessageDTO();
			messageDTO.setReceiver(memberDTO.getName()+"님");
			messageDTO.setReceiveAddr(memberDTO.getEmail1()+"@"+memberDTO.getTextemail());
			messageDTO = mailing.sendWelcomeMail(messageDTO);
			
		AdminDTO adminDTO = adminDAO.getAdmin();
			mailing.sendMail(adminDTO, messageDTO);
			
			CouponDTO couponDTO = new CouponDTO();
				couponDTO.setGrant_id(memberDTO.getId());
				couponDTO.setCoupon_no(9999);
				couponDTO.setCoupon_duedate(new SimpleDateFormat("yyyyMMdd").parse("99991231"));
				couponDTO.setPersonal_code(messageDTO.getCode());		
				tradingDAO.setCoupon(couponDTO);
			
			return "success";}	
		else return "fail";
	}
	
	// 아이디 중복 체크하기 
	@RequestMapping(value="/checkId.do" , method = RequestMethod.POST)
	@ResponseBody
	public String checkId(@RequestParam String id) {
		
		MemberDTO memberDTO = memberDAO.checkId(id);
		if(memberDTO==null)
			return "not_exist";
		else
			return "exist";
	}
	// 아이디 검색요청 결과 보내기
	@RequestMapping(value="/findLostId.do",method=RequestMethod.POST)
	@ResponseBody
	public String findLostId(@RequestParam Map<String,String> map) {
		String id;
		String result;	
			
		MemberDTO memberDTO = memberDAO.findLostId(map);
			
		if(memberDTO==null) return "not_exist"; 
		else id = memberDTO.getId();
			
		StringBuffer data= new StringBuffer();
			
		if(id.length()>=5) {
			for(int i=0;i<id.length()-4;i++) {
				data.append("*");}
				result = data+"";
				result = id.substring(0, 4)+result;}
		else {
			for(int i=0;i<id.length()-2;i++) {
				data.append("*");}
				result = data+"";
				result = id.substring(0, 2)+result;}
			
		return result;
	}
	
	// 비밀번호 재설정 메일 전송하기
		@RequestMapping(value="/findLostPwd.do",method=RequestMethod.POST)
		@ResponseBody
		public String findLostPwd(@RequestParam Map<String,String> map){
			String id;
			String resetPwd;
			
				id = map.get("findID");
			MemberDTO memberDTO = memberDAO.checkId(id);
			if(memberDTO==null|| !memberDTO.getEmail1().equals(map.get("findPwdemail1")) || !memberDTO.getTextemail().equals(map.get("findPwdemail2")) ) {
				return "not_exist";
			}
			
			MessageDTO messageDTO = new MessageDTO();
				messageDTO.setReceiver(memberDTO.getName()+" 님");
				messageDTO.setReceiveAddr(memberDTO.getEmail1()+"@"+memberDTO.getTextemail());
				resetPwd = mailing.getKey(8);
				messageDTO = mailing.sendResetPwdMail(messageDTO, resetPwd);
				
			AdminDTO adminDTO = adminDAO.getAdmin();
				mailing.sendMail(adminDTO, messageDTO);
				
				memberDTO.setPwd(passwordEncoder.encode(resetPwd));
				memberDAO.setNewPwd(memberDTO);
				
			return resetPwd;
		}	
		
	// 관리자계정 접속(접속 후 관리자 화면으로 이동)
	@RequestMapping(value="/adminLogin.do",method = RequestMethod.GET)
	public ModelAndView adminLogin(HttpSession session) {
		
		AdminDTO adminDTO = adminDAO.getAdmin();
			session.setAttribute("adminDTO", adminDTO);	
		
		ModelAndView mav = new ModelAndView();
			mav.addObject("location", "adminHome");
			mav.addObject("display", "/admin/shop/adminManage.jsp");//초기화면은 임시로 관리자 정보 화면
			mav.setViewName("/main/home");
		
	return mav;
	}	
	//18. 회원 주문 현황 화면 이동
		@RequestMapping(value="/memberOrderlist.do",method=RequestMethod.GET)
		public ModelAndView memberOrderlist(){
			
			ModelAndView mav = new ModelAndView();
				mav.addObject("location","member");
				mav.addObject("display", "/member/memberOrderlist.jsp");
				mav.setViewName("/main/home");
				
			return mav;
		}	

		//19. 회원 주문 목록 호출
		@RequestMapping(value="/getOrderList.do",method = RequestMethod.GET)
		public ModelAndView getOrderList(HttpSession session) {
			MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberDTO");
		
			List<OrderDTO> orderList = tradingDAO.getOrderList(memberDTO.getId());
			for(OrderDTO data: orderList) {
				List<ProductDTO> productList = jsonTrans.makeJsonToList(data.getOrderlist_json());
				data.setOrderList(productList);
			}
			ModelAndView mav = new ModelAndView();
				mav.addObject("orderList", orderList);
				mav.setViewName("jsonView");
			return mav;
		}
		/*
		 *   [ M E M B E R J O I N ] 
		 * 
		 */
		// 이메일 인증번호 보내기/받기
		@RequestMapping(value="/checkEmail.do",method=RequestMethod.POST)
		@ResponseBody
		public String checkEmail(@RequestParam String email,HttpSession session){
			String checkNum;
			
			MessageDTO messageDTO = new MessageDTO();
			MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberDTO");
			
			if(memberDTO!=null) {
				messageDTO.setReceiver(memberDTO.getName()+" 회원님");}
			
			else {messageDTO.setReceiver("예비 회원님");}
			
				messageDTO.setReceiveAddr(email);
				checkNum = mailing.checkNum();
				messageDTO = mailing.sendConfirmMail(messageDTO, checkNum);
				
			AdminDTO adminDTO = adminDAO.getAdmin();
				mailing.sendMail(adminDTO, messageDTO);
			
			return checkNum;
		}	
		
	/*
	 *   [ M Y P A G E ]
	 */
		
		// 회원 정보 수정
		@RequestMapping(value = "/modifyForm.do" , method = RequestMethod.GET)
		public ModelAndView modifyForm() {
		
			ModelAndView mav = new ModelAndView();
				mav.addObject("display", "/member/memberModifyForm.jsp");
				mav.setViewName("/main/home");

				return mav;	  
		}
		
		// 회원 정보 화면 이동
		@RequestMapping(value = "/memberView.do" , method = RequestMethod.GET)
		public ModelAndView memberView() {
			
			ModelAndView mav = new ModelAndView();
				mav.addObject("location", "member");
				mav.addObject("display", "/member/memberView.jsp");
				mav.setViewName("/main/home");
				
			return mav;
		}
		// 탈퇴 요청 띄우기 
		@RequestMapping(value="/memberDelete.do",method = RequestMethod.GET)
		public ModelAndView memberDelete() {
			ModelAndView mav = new ModelAndView();
				mav.setViewName("/member/memberDelete");
				
			return mav;
		}	
		//13. 비번 체크하기
		@RequestMapping(value="/checkPwd.do",method=RequestMethod.POST)
		@ResponseBody	
		public String checkPwd(@RequestParam String pwd,HttpSession session) {
		
			String objectPwd;
			
			MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberDTO");
				objectPwd = memberDTO.getPwd();
			if(passwordEncoder.matches(pwd, objectPwd)) {return "success";}
			else {return "fail";}
		
		}	
		//15. 이메일 변경 팝업창 이동하기
		@RequestMapping(value="/changeEmailForm.do",method=RequestMethod.GET)
		public ModelAndView changeEmailForm() {
			
			ModelAndView mav = new ModelAndView();
				mav.setViewName("/member/changeEmailForm");
				
			return mav;		
		}
		//14. 비번 변경하기
		@RequestMapping(value="/changePwd.do",method=RequestMethod.POST)
		@ResponseBody
		public String changePwd(@RequestParam Map<String,String> map,HttpSession session) {
			
			String objectPwd;
			String newPwd;
			
			MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberDTO");
				objectPwd = memberDTO.getPwd();
			if(!passwordEncoder.matches(map.get("pwd"), objectPwd)) {return "fail";}
			else {
					newPwd = passwordEncoder.encode(map.get("newPwd"));
					memberDTO.setPwd(newPwd);	
					memberDAO.setNewPwd(memberDTO);	
					session.setAttribute("memberDTO", memberDTO);		
				return "success";}
		}
		//20. 회원 관리 정보 호출하기
		@RequestMapping(value="/getUserInfo.do",method=RequestMethod.GET)
		@ResponseBody
		public ModelAndView getUserInfo(HttpSession session) {

			MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
			Map<String,Object> map = new HashMap<String,Object>();
				map = tradingDAO.getUserInfo(memberDTO.getId());
				
			ModelAndView mav = new ModelAndView();
				mav.addObject("map", map);
				mav.setViewName("jsonView");
				
			return mav;
		}
		// 탈퇴 요청 처리 
		@RequestMapping(value="/delete.do",method=RequestMethod.POST)
		@ResponseBody
		public String delete(@RequestParam Map<String,String> map,HttpServletRequest request,HttpServletResponse response, HttpSession session){
			
			MemberDTO memberDTO  = (MemberDTO)session.getAttribute("memberDTO");
			String pwd=map.get("deletePwd");
			
			if(memberDTO != null) {		
				String objectPwd = memberDTO.getPwd();
				
				if(passwordEncoder.matches(pwd, objectPwd)) {
						memberDAO.deleteMember(memberDTO.getId());
						
						map.put("id",memberDTO.getId());
						memberDAO.deleteMemberAdmin(map);
					List<OrderDTO> orderList = tradingDAO.getOrderList(memberDTO.getId());
					String orderPwd = mailing.getKey(8); 
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
						if(orderList!=null) {
							for(OrderDTO dto : orderList) {
									dto.setOrder_id(sdf.format(dto.getOrder_date()).toString()+"-"+dto.getOrder_no());
									dto.setOrder_pwd(passwordEncoder.encode(orderPwd));
									tradingDAO.setNewOrderId(dto);
									tradingDAO.setNewOrderPwd(dto);}}		
						
					MessageDTO messageDTO = new MessageDTO();
						messageDTO.setCode(orderPwd);
						messageDTO.setReceiver(memberDTO.getName()+"님");
						messageDTO.setReceiveAddr(map.get("email"));
						messageDTO = mailing.sendGoodbyeMail(messageDTO);
					
		
					FileMaker filemaker = new FileMaker();
					
					File file = filemaker.makeOrderList(memberDTO.getName(),orderList);
					
					messageDTO.setMailData(file);
					
					AdminDTO adminDTO = adminDAO.getAdmin();
						mailing.sendMailwithFile(adminDTO, messageDTO);
			
						
					return "submitSuccess";
				}
				else return "pwdCheckFailed";}

			return "fail";		
		}
		// 개인문의 창
		@RequestMapping(value = "/personalQAForm.do" , method = RequestMethod.GET)
		public ModelAndView personalQAForm() {
			ModelAndView mav = new ModelAndView();
			 	mav.setViewName("/memeber/personalQAForm");
			 return mav;
		}
		
		
		
		/*
		 *  S T A R T    M E M B E R  C O U P O N 
		 */
		
		// 회원 쿠폰 목록 조회
		@RequestMapping(value="/memberCouponlist.do" , method = RequestMethod.GET)
		public ModelAndView memberCouponlist() {
			
			ModelAndView mav = new ModelAndView();
				mav.addObject("location", "member");
				mav.addObject("display", "/member/memberCouponlist.jsp");
				mav.setViewName("/main/home");
				
			return mav;
		}
		
		// 회원 쿠폰 목록 호출
		@RequestMapping(value="/getCouponlist.do",method = RequestMethod.GET)
		public ModelAndView getCouponlist(HttpSession session) {
			
			MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberDTO");
			
			List<CouponDTO> couponlist = tradingDAO.getCouponListAll(memberDTO.getId());
			
			ModelAndView mav = new ModelAndView();
				mav.addObject("couponlist", couponlist);
				mav.setViewName("jsonView");
			
			return mav;
		}

		/*
		 *  E N D   M E M B E R  C O U P O N 
		 */
}
