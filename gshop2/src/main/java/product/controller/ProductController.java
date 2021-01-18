package product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import board.dao.BoardDAO;
import member.bean.MemberDTO;
import product.bean.ProductDTO;
import product.bean.ProductPaging;
import product.dao.ProductDAO;
/*
 * 상품 관련 활동을 제어하는 클래스
 */
@Controller
@RequestMapping(value="/product/**")
public class ProductController {
		
		@Autowired
		ProductDAO productDAO;
		@Autowired
		ProductPaging productPaging;
		@Autowired
		BoardDAO boardDAO;
		
		// 목록 가져오기(한페이지당 3게시물,3블록 표시)
		@RequestMapping(value="/userproductList.do",method= RequestMethod.POST)
		public ModelAndView productList(@RequestParam(required=false,defaultValue="1") String pg){
			
			int page = Integer.parseInt(pg);
			int endNum = page*9;
			int startNum = endNum-8;	
			int totalA = 0;
			
			Map<String,String> map = new HashMap<String,String>();
				map.put("tableName", "product_name");
				totalA = productDAO.getTotalA(map);
			
			List<ProductDTO> productList = productDAO.productList(startNum, endNum);
		
				productPaging.setCurrentPage(page);
				productPaging.setPageBlock(3);
				productPaging.setPageSize(3);
				productPaging.setTotalA(totalA);
				productPaging.makePagingHTML();;	 
			
			ModelAndView mav = new ModelAndView();
				mav.addObject("productPaging", productPaging);
				mav.addObject("productList", productList);
				mav.setViewName("jsonView");
				
			return mav;
		}
		// 상품 목록으로 이동
		@RequestMapping(value="/categories.do",method = RequestMethod.GET)
		public ModelAndView categories(@RequestParam(required=false,defaultValue="ALL") String product_category_name, @RequestParam(required=false,defaultValue="new") String order) {
			
			ModelAndView mav = new ModelAndView();		
				mav.addObject("location", "category");
				mav.addObject("product_category_name", product_category_name);
				mav.addObject("order",order);
				mav.addObject("display", "/product/categories.jsp");
				mav.setViewName("/main/home");
				
			return mav;
		}

		// 검색어 또는 카테고리로 검색한 목록 호출하기
		@RequestMapping(value="/getUserProductList.do",method = RequestMethod.GET)
		public ModelAndView getUserProductList(@RequestParam(required=false,defaultValue="ALL") String product_category_name,@RequestParam(required=false,defaultValue="new") String order,
				String searchOption, @RequestParam(required=false,defaultValue="") String searchWord) {
			
			List<ProductDTO> productList = productDAO.getUserProductList(product_category_name,order,searchOption,searchWord);
			
			if(productList!=null) {
				for(ProductDTO data: productList) {
					data.makeProductListHTML();}}

			ModelAndView mav = new ModelAndView();
				mav.addObject("product_category_name", product_category_name);
				mav.addObject("order",order);
				mav.addObject("searchOption",searchOption);			
				mav.addObject("searchWord",searchWord);
				mav.addObject("productList", productList);		
				mav.setViewName("jsonView");
				
			return mav;
		}
		
		
		@RequestMapping(value="/eventProductList.do",method = RequestMethod.GET)
		public ModelAndView eventProductList(@RequestParam(required=false,defaultValue="onSale") String condition) {
			
			ModelAndView mav = new ModelAndView();		

				mav.addObject("condition", condition);
				mav.addObject("display", "/product/productmain2.jsp");
				mav.setViewName("/main/home");
				return mav;
		}
		
		@RequestMapping(value="/getSpecialProductList.do",method = RequestMethod.GET)
		public ModelAndView getSpecialProductList(@RequestParam(required=false,defaultValue="onSale") String condition, String searchOption,
			@RequestParam(required=false,defaultValue="") String searchWord) {
			
			List<ProductDTO> productList = productDAO.getUserProductList("ALL","name",searchOption,searchWord);
			
			if(productList!=null) {
				for(ProductDTO data: productList) {data.makeSpecialListHTML(condition);}			
			}
			ModelAndView mav = new ModelAndView();
				mav.addObject("condition",condition);
				mav.addObject("searchOption",searchOption);			
				mav.addObject("searchWord",searchWord);
				mav.addObject("productList", productList);		
				mav.setViewName("jsonView");
				
			return mav;
		}	
		
	// 특정 상품 조회 화면 이동
		@RequestMapping(value="/productView.do",method = RequestMethod.GET)
		public ModelAndView productView(@RequestParam String product_name_no, HttpSession session,HttpServletRequest request,HttpServletResponse response) {
			
			String id=""; 
			String SEQ="NO"; 
			boolean today = false;
			MemberDTO memberDTO =null;
			
			// 조회자 정보 호출하기
			memberDTO = (MemberDTO)session.getAttribute("memberDTO");
				if(memberDTO!=null) id=memberDTO.getId();
			
		
			// 상품 정보 호출
			ProductDTO productDTO = productDAO.getProductInfo(product_name_no);
			
			ModelAndView mav = new ModelAndView();
				mav.addObject("productDTO", productDTO);
				mav.addObject("SEQ",SEQ);		
				mav.addObject("location","category");
				mav.addObject("display", "/product/productView.jsp");
				mav.setViewName("/main/home");
				
			return mav;
		}
		// 전체 목록 호출하기(1.리뷰 후기 글쓰기)
		@RequestMapping(value="/getAllproduct.do", method = RequestMethod.GET)
		public ModelAndView getAllproduct() {
			
			List<ProductDTO> productList = productDAO.getUserProductList("ALL","name","","");
			
			if(productList!=null) {
				for(ProductDTO data: productList) {data.makeProductListHTML();}			
			}
			ModelAndView mav = new ModelAndView();
				mav.addObject("productList", productList);		
				mav.setViewName("jsonView");
				
			return mav;
		}	
	
		@RequestMapping(value="/getproduct.do", method = RequestMethod.GET)
		public ModelAndView getproduct(HttpServletRequest request,HttpServletResponse response, String product_name_no) {
			
			String productid = request.getParameter("productid");
			Map<String, Object>parMap = new HashMap<String, Object>();
			parMap.put("productid",productid);
			
			List<ProductDTO> productDTO = productDAO.reviewdo(product_name_no);
			
			ModelAndView mav = new ModelAndView();
				mav.addObject("productDTO", productDTO);
				mav.setViewName("jsonView");
			return mav;
		}

		/*
		 *    P R O D U C T    L I K E 
		 */
		@RequestMapping(value="/likeOnAndOff.do",method = RequestMethod.GET)
		@ResponseBody
		public String likeOnAndOff(@RequestParam int product_name_no, HttpSession session){
			
			String id="";
			MemberDTO memberDTO =null;
			
			memberDTO = (MemberDTO)session.getAttribute("memberDTO");
			if(memberDTO!=null) id=memberDTO.getId();
			if(!id.equals("")) {
				//(2) 좋아요 처리하기
				Map<String,String> map = new HashMap<String,String>();
					map.put("USERID", id);
					map.put("PRODUCT_NO", product_name_no+"");		
					int result = productDAO.getLikeValue(map);	
					if(result==0) {
						productDAO.addLike(map);
						return "YES";}
					else if(result!=0){
						productDAO.removeLike(result);
						return "NO";}}
			
			return "NO";
			}
}