package admin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import member.bean.MemberDTO;
import member.dao.MemberDAO;
import product.bean.ProductCategory;
import product.bean.ProductDTO;
import product.dao.ProductDAO;
import salesInfo.bean.SalesInfoDTO;
import salesInfo.bean.SalesInfoPaging;
import salesInfo.bean.SortCollection;
import salesInfo.dao.SalesInfoDAO;
import trading.bean.CouponDTO;
import trading.bean.DeliveryDTO;
import trading.bean.EventDTO;
import trading.bean.JsonTransitioner;
import trading.bean.OrderDTO;
import trading.bean.PaymentMethod;
import trading.dao.TradingDAO;
/*
 * 관리자: 관리자 및 상점 정보를 제어하는 클래스
 */
@Controller
@RequestMapping(value="/admin/shop/**")
public class AdminShopController {

	@Autowired
	TradingDAO tradingDAO;
	
	@Autowired
	MemberDAO memberDAO;
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	SalesInfoDAO salesInfoDAO;
	
	@Autowired
	JsonTransitioner jsonTrans;
	
	@Autowired
	SalesInfoPaging salesInfoPaging;
	
	
	//1. 관리자 정보 화면 이동
	@RequestMapping(value="/adminManage.do",method = RequestMethod.GET)
	public ModelAndView adminManage() {
		
		ModelAndView mav = new ModelAndView();
			mav.addObject("location", "shopAdmin");
			mav.addObject("display", "/admin/shop/adminManage.jsp");
			mav.setViewName("/main/home");
			
		return mav;
	}	
	
	/*
	 *		매 출 관 련  
	 */
	//2. 매출 정보 화면 이동
	@RequestMapping(value="/salesInfo.do",method = RequestMethod.GET)
	public ModelAndView salesInfo(@RequestParam(required = false,defaultValue = "1") String pg) {
		
		ModelAndView mav = new ModelAndView();
			mav.addObject("location", "shopAdmin");
			mav.addObject("pg", pg);
			mav.addObject("display", "/admin/shop/salesInfo.jsp");
			mav.setViewName("/main/home");
			
		return mav;
	}	
	//12. 매출 목록 가져오기(한페이지당 10게시물,3블록 표시)
	@RequestMapping(value="/getsalesInfoList.do",method= RequestMethod.POST)
	public ModelAndView getsalesInfoList(@RequestParam(required=false,defaultValue="1") String pg,@RequestParam(required=false,defaultValue="sales_date") String sortSubject,@RequestParam(required=false,defaultValue="desc") String sortType){
		
		int page = Integer.parseInt(pg);
		int endNum = page*10;
		int startNum = endNum-9;		
		int totalA=0;
				
			totalA = salesInfoDAO.getTotalA();
			Map<String,String> map = new HashMap<String,String>();
				map.put("startNum", startNum+"");
				map.put("endNum", endNum+"");
				map.put("sortSubject", sortSubject);
				map.put("sortType", sortType);	
		List<SalesInfoDTO> salesInfoList = salesInfoDAO.getsalesInfoList(map);

			salesInfoPaging.setCurrentPage(page);
			salesInfoPaging.setPageBlock(3);
			salesInfoPaging.setPageSize(10);
			salesInfoPaging.setTotalA(totalA);
			salesInfoPaging.makePagingHTML();
		
			for(SalesInfoDTO dto : salesInfoList) {
				
				OrderDTO orderDTO = tradingDAO.getOrderInfo(dto.getOrder_no());
				List<ProductDTO> productList = jsonTrans.makeJsonToList(orderDTO.getOrderlist_json());
				List<OrderDTO> paymentInfo = jsonTrans.makeJsonToPaymentList(dto.getSales_payment_json());
				
					dto.setSales_product_Info(productList);
					dto.setSales_payment_Info(paymentInfo);
					dto.setSuit_total(0); dto.setAcc_total(0);dto.setCoat_total(0); dto.setBottom_total(0); dto.setTee_total(0); dto.setOuter_total(0); dto.setShirt_total(0); dto.setShoes_total(0); dto.setUnknown_total(0);
					dto.setCard_total(0); dto.setCash_total(0); dto.setCoupon_total(0); dto.setPoint_total(0); dto.setEtc_total(0);
				
				for(ProductDTO product : productList) {
					if(product.getProduct_category_no()==ProductCategory.COAT.ordinal()) dto.setCoat_total(product.getUnitcost()*product.getCart_qty());
					else if(product.getProduct_category_no()==ProductCategory.BOTTOM.ordinal())  dto.setBottom_total(product.getUnitcost()*product.getUnitcost()*product.getCart_qty());
					else if(product.getProduct_category_no()==ProductCategory.ACC.ordinal())  dto.setAcc_total(product.getUnitcost()*product.getCart_qty());
					else if(product.getProduct_category_no()==ProductCategory.SHIRT.ordinal()) dto.setShirt_total(product.getUnitcost()*product.getCart_qty());
					else if(product.getProduct_category_no()==ProductCategory.SUIT.ordinal()) dto.setSuit_total(product.getUnitcost()*product.getCart_qty());
					else if(product.getProduct_category_no()==ProductCategory.TEE.ordinal()) dto.setTee_total(product.getUnitcost()*product.getCart_qty());
					else if(product.getProduct_category_no()==ProductCategory.OUTER.ordinal()) dto.setOuter_total(product.getUnitcost()*product.getCart_qty());
					
				}
				
				for(OrderDTO payment: paymentInfo) {
					if(payment.getPayment_method()==PaymentMethod.CARD.ordinal()) dto.setCard_total(payment.getPayment_amount());
					else if(payment.getPayment_method()==PaymentMethod.CASH.ordinal()) dto.setCash_total(payment.getPayment_amount());
					else if(payment.getPayment_method()==PaymentMethod.POINT.ordinal()) dto.setPoint_total(payment.getPayment_amount());
					else if(payment.getPayment_method()==PaymentMethod.COUPON.ordinal()) dto.setCoupon_total(payment.getPayment_amount());
					else dto.setEtc_total(payment.getPayment_amount());
				}
			}	
		ModelAndView mav = new ModelAndView();
			mav.addObject("salesInfoPaging", salesInfoPaging);
			mav.addObject("salesInfoList", salesInfoList);
			mav.addObject("sortSubject", sortSubject);
			mav.addObject("sortType", sortType);	
			mav.setViewName("jsonView");
			
		return mav;
	}
	//14. 특정 검색어에 해당하는 차트 불러오기
		@RequestMapping(value="/salesChart.do",method= RequestMethod.GET)
		public ModelAndView salesChart() {

			ModelAndView mav = new ModelAndView();		
			mav.setViewName("/admin/shop/salesChart");
		
		return mav;	
		}	
		//15. 차트 분석을 위한 데이터 가져오기
		@RequestMapping(value="/getChartRawData.do",method= RequestMethod.POST)
		public ModelAndView getChartRawData(@RequestParam(required=false) String keyword, String searchOption) {
			
			int grobe_total=0;
			int total_previousM =0; int total_lastM =0; int total_thisM =0;
			int suit_previousM =0; int suit_lastM =0; int suit_thisM =0;
			int coat_previousM =0; int coat_lastM =0; int coat_thisM =0;
			int acc_previousM =0; int acc_lastM =0; int acc_thisM =0;		
			int bottom_previousM =0; int bottom_lastM =0; int bottom_thisM =0;
			int tee_previousM =0; int tee_lastM =0; int tee_thisM =0;
			int shirt_previousM =0; int shirt_lastM =0; int shirt_thisM =0;		
			int shoes_previousM =0; int shoes_lastM =0; int shoes_thisM =0;		
			int outer_previousM =0; int outer_lastM =0; int outer_thisM =0;
			
			Map<String,String> map = new HashMap<String,String>();
				map.put("keyword", keyword);
				map.put("searchOption", searchOption);
			List<SalesInfoDTO> totalSalesData = salesInfoDAO.getChartRawData(map);

			SimpleDateFormat sf = new SimpleDateFormat("MM");
			List<ProductDTO> dataList = productDAO.getInventoryCatalog();
			List<MemberDTO> memberList = memberDAO.getMemberList();
		for(SalesInfoDTO dto : totalSalesData) {	
			grobe_total+= dto.getSales_revenue();
			
			OrderDTO orderDTO = tradingDAO.getOrderInfo(dto.getOrder_no());
			List<ProductDTO> productList = jsonTrans.makeJsonToList(orderDTO.getOrderlist_json());
			List<OrderDTO> paymentInfo = jsonTrans.makeJsonToPaymentList(dto.getSales_payment_json());
			
				dto.setSales_product_Info(productList);
				dto.setSales_payment_Info(paymentInfo);
				dto.setSuit_total(0); dto.setAcc_total(0);dto.setCoat_total(0); dto.setBottom_total(0); dto.setTee_total(0); dto.setOuter_total(0); dto.setShirt_total(0); dto.setShoes_total(0); dto.setUnknown_total(0); 
				dto.setCard_total(0); dto.setCash_total(0); dto.setCoupon_total(0); dto.setPoint_total(0); dto.setEtc_total(0);
			

				
				for(ProductDTO product : productList) {
					for(ProductDTO data: dataList) {
						if(data.getProduct_name_no()==product.getProduct_name_no()) {
							int cart_qty = data.getCart_qty()+product.getCart_qty();
							data.setCart_qty(cart_qty);
							break;
						}
					}
					//ordinal() 열거체로 카테고리 목록 반환 입니다. 
					
					if(product.getProduct_category_no()==ProductCategory.COAT.ordinal()) dto.setCoat_total(product.getUnitcost()*product.getCart_qty());
					else if(product.getProduct_category_no()==ProductCategory.BOTTOM.ordinal())  dto.setBottom_total(product.getUnitcost()*product.getCart_qty());
					else if(product.getProduct_category_no()==ProductCategory.ACC.ordinal())  dto.setAcc_total(product.getUnitcost()*product.getCart_qty());
					else if(product.getProduct_category_no()==ProductCategory.SHIRT.ordinal()) dto.setShirt_total(product.getUnitcost()*product.getCart_qty());
					else if(product.getProduct_category_no()==ProductCategory.SUIT.ordinal()) dto.setSuit_total(product.getUnitcost()*product.getCart_qty());
					else if(product.getProduct_category_no()==ProductCategory.TEE.ordinal()) dto.setTee_total(product.getUnitcost()*product.getCart_qty());
					else if(product.getProduct_category_no()==ProductCategory.OUTER.ordinal()) dto.setOuter_total(product.getUnitcost()*product.getCart_qty());
					else if(product.getProduct_category_no()==ProductCategory.SHOES.ordinal()) dto.setShoes_total(product.getUnitcost()*product.getCart_qty());
					
					else dto.setUnknown_total(product.getUnitcost()*product.getCart_qty());
				}

			for(OrderDTO payment: paymentInfo) {
				if(payment.getPayment_method()==PaymentMethod.CARD.ordinal()) dto.setCard_total(payment.getPayment_amount());
				else if(payment.getPayment_method()==PaymentMethod.CASH.ordinal()) dto.setCash_total(payment.getPayment_amount());
				else if(payment.getPayment_method()==PaymentMethod.POINT.ordinal()) dto.setPoint_total(payment.getPayment_amount());
				else if(payment.getPayment_method()==PaymentMethod.COUPON.ordinal()) dto.setCoupon_total(payment.getPayment_amount());
				else dto.setEtc_total(payment.getPayment_amount());
			}
			int thisMonth = Integer.parseInt(sf.format(new Date()));
			int targetMonth = Integer.parseInt(sf.format(dto.getSales_date())); 
			if(targetMonth==thisMonth) {
				total_thisM += dto.getSales_revenue();
				suit_thisM += dto.getSuit_total();
				coat_thisM += dto.getCoat_total();
				acc_thisM += dto.getAcc_total();
				bottom_thisM += dto.getBottom_total();
				tee_thisM += dto.getTee_total();
				shirt_thisM += dto.getShirt_total();
				shoes_thisM += dto.getShoes_total();
				outer_thisM += dto.getOuter_total();
			}
			else if(targetMonth==thisMonth-1) {
				total_lastM += dto.getSales_revenue();
				suit_thisM += dto.getSuit_total();
				coat_thisM += dto.getCoat_total();
				acc_thisM += dto.getAcc_total();
				bottom_thisM += dto.getBottom_total();
				tee_thisM += dto.getTee_total();
				shirt_thisM += dto.getShirt_total();
				shoes_thisM += dto.getShoes_total();
				outer_thisM += dto.getOuter_total();
			}
			else {
				total_previousM += dto.getSales_revenue();
				suit_thisM += dto.getSuit_total();
				coat_thisM += dto.getCoat_total();
				acc_thisM += dto.getAcc_total();
				bottom_thisM += dto.getBottom_total();
				tee_thisM += dto.getTee_total();
				shirt_thisM += dto.getShirt_total();
				shoes_thisM += dto.getShoes_total();
				outer_thisM += dto.getOuter_total();
			}
			for(MemberDTO member: memberList) {
				if(dto.getOrder_id().equals(member.getId())) {
					member.setOrderTotal(member.getOrderTotal()+dto.getSales_revenue());
					member.setOrderNum(member.getOrderNum()+1);
					break;
				}
			}
		}
		
		//단위 분석 자료 추출:START
		SortCollection sortCollection = new SortCollection();
		Collections.sort(dataList,sortCollection.getSalesSort());	
		String maxRevenueItem = dataList.get(0).getProduct_name_no()+"";
		String minRevenueItem = dataList.get(dataList.size()-1).getProduct_name_no()+"";
		
		Collections.sort(dataList,sortCollection.getQtySort());
		String maxSalesItem = dataList.get(0).getProduct_name_no()+"";
		String minSalesItem = dataList.get(dataList.size()-1).getProduct_name_no()+"";
		
		Collections.sort(dataList,sortCollection.getHitSort());
		String mostViewedItem = dataList.get(0).getProduct_name_no()+"";
		
		Collections.sort(dataList,sortCollection.getLikeitSort());		
		String bestLikeitItem = dataList.get(0).getProduct_name_no()+"";
		
		Collections.sort(memberList,sortCollection.getOrderNumSort());
		String mostOrderedMember =memberList.get(0).getId();
		
		Collections.sort(memberList,sortCollection.getOrderTotalSort());
		String mostBenefitMemeber=memberList.get(0).getId();
		
		String salesDiffRatio = String.format("%.2f",(float)total_lastM/total_thisM*100);
		//단위 분석 자료 추출:END
		Map<String,Integer> periodicList = new HashMap<String,Integer>();
			periodicList.put("total_previousM", total_previousM);
			periodicList.put("total_lastM", total_lastM); 
			periodicList.put("total_thisM", total_thisM);
			periodicList.put("suit_previousM", suit_previousM);	
			periodicList.put("suit_lastM", suit_lastM);		
			periodicList.put("suit_thisM", suit_thisM);		
			periodicList.put("coat_previousM", coat_previousM);
			periodicList.put("coat_lastM", coat_lastM);
			periodicList.put("coat_thisM", coat_thisM);
			periodicList.put("acc_previousM", acc_previousM);
			periodicList.put("acc_lastM", acc_lastM);
			periodicList.put("acc_thisM", acc_thisM);
			periodicList.put("shirt_previousM", shirt_previousM);
			periodicList.put("shirt_lastM", shirt_lastM);
			periodicList.put("shirt_thisM", shirt_thisM);
			periodicList.put("tee_previousM", tee_previousM);
			periodicList.put("tee_lastM", tee_lastM);
			periodicList.put("tee_thisM", tee_thisM);
			periodicList.put("bottom_previousM", bottom_previousM);
			periodicList.put("bottom_lastM", bottom_lastM);
			periodicList.put("bottom_thisM", bottom_thisM);
			periodicList.put("shoes_previousM", shoes_previousM);
			periodicList.put("shoes_lastM", shoes_lastM);
			periodicList.put("shoes_thisM", shoes_thisM);
			periodicList.put("outer_previousM", outer_previousM);
			periodicList.put("outer_lastM", outer_lastM);
			periodicList.put("outer_thisM", outer_thisM);
			

		String[][] stringData = new String[9][3];
			stringData[0] = new String[] {"maxRevenueItem",maxRevenueItem,"/admin/product/productViewPop.do?product_name_no="+maxRevenueItem};
			stringData[1] = new String[] {"maxSalesItem",maxSalesItem,"/admin/product/productViewPop.do?product_name_no="+maxSalesItem};
			stringData[2] = new String[] {"minRevenueItem",minRevenueItem,"/admin/product/productViewPop.do?product_name_no="+minRevenueItem};
			stringData[3] = new String[] {"minSalesItem",minSalesItem,"/admin/product/productViewPop.do?product_name_no="+minSalesItem};
			stringData[4] = new String[] {"mostOrderedMember",mostOrderedMember,"/admin/user/memberDetailView.do?id="+mostOrderedMember};
			stringData[5] = new String[] {"mostBenefitMemeber",mostBenefitMemeber,"/admin/user/memberDetailView.do?id="+mostBenefitMemeber};
			stringData[6] = new String[] {"salesDiffRatio",salesDiffRatio+"%","N/A"};
			stringData[7] = new String[] {"mostViewedItem",mostViewedItem,"/admin/product/productViewPop.do?product_name_no="+mostViewedItem};
			stringData[8] = new String[] {"bestLikeitItem",bestLikeitItem,"/admin/product/productViewPop.do?product_name_no="+bestLikeitItem};
			
			Map<String,String> analysisData = new HashMap<String,String>();
			for(int i=0; i<9;i++) {
				analysisData.put(stringData[i][0], stringData[i][1]);
			}
			ModelAndView mav = new ModelAndView();	
			mav.addObject("totalSalesData", totalSalesData);
			mav.addObject("periodicList", periodicList);
			mav.addObject("analysisData", analysisData);
			mav.setViewName("jsonView");
		
		return mav;	
		}
			
}
