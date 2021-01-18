<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<!--CSS Local STYLE:START-->
<link rel="stylesheet" href="/resources/custom/css/orderForm.css">
	<!--CSS Local STYLE:END-->   
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>

	.review{
		display: block;	
		border-bottom: 1px solid #e8e8e8;
		min-height: 30px;
    	margin: 10px 0 20px;
    	padding-bottom: 10px;
	
	}
	.review_main{
	    font-size: 14px;
	    letter-spacing: 1pt;
	    padding-top: 100px;
	    display: block;
	}
	.review_beaty{
		display: inline-block;
	    margin: 0 0 0 6px;
	    padding: 0 0 0 10px;
	    font-size: 12px;
	    color: #bbb;
	    vertical-align: bottom;
	    background: url(//img.echosting.cafe24.com/skin/base/layout/ico_bar.gif) no-repeat 0 0;
	}
	.review_form{
		width: 100%;
	    position: relative;
	    margin: 10px 0 0;
   	    border: 1px solid #dfdfdf;
	    line-height: 1.5;
	    border-spacing: 0;
    	border-collapse: collapse;
	}
	.review_list_ths{
	    padding: 11px 0 10px;
	    border: 1px solid #dfdfdf;
	    border-bottom-width: 0;
	    color: #353535;
	    font-weight: normal;
	    background-color: #fbfafa;
	}
	.review_list_thss{
	    padding: 11px 0 10px;
	    border: 1px solid #dfdfdf;
	    border-bottom-width: 0;
	    color: #353535;
	    background-color: #fbfafa;
	    width: 15%;
	    text-align: left;
	    font-weight: bold;
	    padding-left: 20px;
	}
	.list_td{
		border-top: 1px solid #dfdfdf;
	    color: #353535;
	    vertical-align: middle;
	    display: table-cell;
	    padding: 8px 10px 7px;
	    border: 1px solid #d5d5d5;
	}
	.review_td{
		border-top: 1px solid #dfdfdf;
	    color: #353535;
	    vertical-align: middle;
	    display: table-cell;
	    padding: 8px 10px 7px;
	    border: 1px solid #d5d5d5;
	}
	.reviewBtn {
		display: inline-block;
		width:50px;
    	line-height:16px;
    	text-align:center;
	    background-color:#1C1C1C;
	    color:white;
	    margin: 2px;
	    margin-bottom: 20px;
	    font-size: 13px;
	    float: left;
	    cursor: pointer;
	    vertical-align: middle;
	    margin-top: 0.5px;
	}
	.reviewBtn_write{
		display: inline-block;
		width:80px;
    	line-height:30px;
    	text-align:center;
	    background-color:#1C1C1C;
	    color:white;
	    margin: 2px;
	    margin-bottom: 20px;
	    font-size: 13px;
	    cursor: pointer;
	    float: right;
	}
	.totalamount{
		float: left;
		padding-right: 5px;
		font-size: 13px;
		font-weight: bold;
	}
	.review_list_ths1{
	    padding: 11px 0 10px;
	    border: 1px solid #dfdfdf;
	    border-bottom-width: 0;
	    color: #353535;
	    font-weight: normal;
	    background-color: #fbfafa;
	}
	.contro{
		padding-left: 65%;
	}
	.point_td{
		border-top: 1px solid #dfdfdf;
	    color: #353535;
	    vertical-align: middle;
	    display: table-cell;
	    border: 1px solid #d5d5d5;
	}
</style>	
	    

	<div class="row" id="titleDiv">
		<div class="col">
	 		<h3>주문 내역서</h3>		
	 	</div>
	</div>
		<input type="hidden" name="order_no" value="${order_no}"/>
		<h5 class="sub-title-undeline">[기본 정보]</h5>
		
		<table class="review_form">
			<tr >
				<th class="review_list_ths">#</th>
				<th class="review_list_ths">주문아이디</th>
				<th class="review_list_ths">최초주문일</th>
				<th class="review_list_ths">상태</th>
				<th class="review_list_ths">주문자</th>
				<th class="review_list_ths">최종수정일</th>
			</tr>
			<tr>
				<td class="list_td" align="center">
				<font id="order_no"></font>
				</td>
				<td class="list_td" align="center">
				<font id="order_id"></font>
				</td>
				<td class="list_td" align="center">
				<font id="order_date"></font>
				</td>
				<td class="list_td" align="center">
				<font id="order_state"></font>
				</td>
				<td class="list_td" align="center">
				<font id="order_name"></font>
				</td>
				<td class="list_td" align="center">
				<font id="order_logtime"></font>
				</td>
			</tr>
		</table>
		
		<div class="form-row">	
			<div class="col-2" align="center">
				<label for="order_statement" class="under-line-title">비고</label>
		  	</div>	
			<div class="col-10" align="center">
				<input type="text" readonly class="form-control-plaintext inline-form" id="order_statement"/>			
			</div>	
		</div>
		
	<hr class="sub-hr" noshade/>			
		<h5 class="sub-title-undeline">[배송 정보]</h5>  
		<div class="form-row" >
		
			
			<div class="col-2" align="center">	
				<label for="selectModify">배송지</label>						
			</div>		
			<div class="col-4"></div>				
			<div class="col-6">
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" id="original" name="selectModify" class="custom-control-input" value="original" checked>
					<label class="custom-control-label" for="original">기존주소</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" id="new" name="selectModify" class="custom-control-input" value="new">
					<label class="custom-control-label" for="new">변경주소</label>								
				</div>
			</div>						  				  	
		</div>
 	 	<div class="form-row" id="zip">
			<div class="col-2" align="center">
				<label for="zipcode" class="under-line-title">우편번호</label>
			</div>
		    <div class="col-10" align="center">
				<font id="order_address"></font> 
		    </div>
		    <div id="info"></div>
		</div>
			
		

		<hr class="sub-hr" noshade/>
		<h5 class="sub-title-undeline">[연락 정보]</h5>		
		<div class="form-row">
			<div class="col-8">
				<input type="checkbox" id="modifyCheck" value="1">연락 정보를 변경합니다
			</div>
			<div class="col-4"></div>
		</div>					
 	 	
 	 	<div class="form-row" id="zip">
			<div class="col-2" align="center">
				<label for="order_tel" class="under-line-title">회신연락처</label>
			</div>
		    <div class="col-10" align="center">
		    	<input type="tel" id="order_tel" readonly class="form-control-plaintext inline-form"/>
		    </div>
		</div>		
 	 	<div class="form-row" id="zip">
			<div class="col-2" align="center">
				<label for="order_email" class="under-line-title">회신이메일</label>
			</div>
		    <div class="col-10" align="center">
		    	<input type="email" id="order_email" readonly class="form-control-plaintext inline-form"/>		
		    </div>
		</div>		
		<div class="form-row justify-content-center">
			<div class="form-group col" align="right">      								
				<button type="button" id="modifyContact" class="btn btn-outline-info" disabled>반영하기</button>			
			</div>
		</div>
		
		
		
		<hr class="sub-hr" noshade/>
				
		<h5 class="sub-title-undeline">[상품 구입 내역]</h5>
			
		<table id="cartListTable" class="review_form">
			<thead>
			    <tr>
					<th class="review_list_ths" style="font-weight: bold;">#</th>
					<th class="review_list_ths"style="font-weight: bold;">상품이미지</th>
					<th class="review_list_ths"style="font-weight: bold;">상품명</th>
					<th class="review_list_ths"style="font-weight: bold;">판매단가</th>	
					<th class="review_list_ths"style="font-weight: bold;">수량</th>						
					<th class="review_list_ths"style="font-weight: bold;">합계</th>										
				</tr>
			</thead>  
			<tbody>
				<tr>
					<th scope="row"></th>
					<td colspan="6"></td>		   		
			   	</tr>
			</tbody> 
		</table><br>
		
		<hr  class="sub-secondary-hr" noshade/>

		<table class="review_form">
			<tr>
				<th>상품 합계</th>
				<th>배송료</th>
				<th>총 합계</th>
			</tr>
			<tr>
				<td>
					<div class="" align="center" id="productTotalDiv"></div>	
				</td>
				<td>
					<div class="" align="center" id="deliveryFeeDiv"></div>	
				</td>
				<td>
					<div class="" align="center" id="subTotalDiv"></div>
				</td>
			</tr>
		</table><br>	
	
		
		
									
		<hr class="sub-hr" noshade/>	
			
		<h5 class="sub-title-undeline">[결제 정보]</h5>	
		
		<table id="paymentTable" class="review_form">
			<thead>
			    <tr>
					<th class="review_list_ths" style="font-weight: bold;text-decoration:underline;text-underline-position:under">결제방법</th>
					<th class="review_list_ths" style="font-weight: bold;text-decoration:underline;text-underline-position:under">결제일자</th>
					<th class="review_list_ths" style="font-weight: bold;text-decoration:underline;text-underline-position:under">결제금액</th>
					<th class="review_list_ths" style="font-weight: bold;text-decoration:underline;text-underline-position:under">비고</th>
				</tr>
			</thead>  
			<tbody>
				<tr>
					<th scope="row"></th>
					<td colspan="4"></td>		   		
			   	</tr>
			</tbody> 
		</table><br>	
			
			
			
		<hr class="sub-hr" noshade/>	
			
		<h5 class="sub-title-undeline">[추가 정보]</h5>	
	
		<div class="form-row">					
			<div class="col-2" align="center">
				<label for="order_deliverynum" class="under-line-title">배송장번호</label>
		  	</div>	
			<div class="col-10" align="center">
				<input type="text" readonly class="form-control-plaintext inline-form" id="order_deliverynum"/>
			</div>							  				  			  		  				  	
		</div>			
		<div class="form-row">					
			<div class="col-2" align="center">
				<label for="order_refundaccount" class="under-line-title">환불계좌</label>
		  	</div>	
			<div class="col-10" align="center">
				<input type="text" readonly class="form-control-plaintext inline-form"  id="order_refundaccount"/>
			</div>							  				  			  		  				  	
		</div>	

		
		<hr class="sub-hr" noshade/>
			
		<div class="form-row justify-content-center">
			<div class="form-group col" align="right">      								
				<button type="button" id="orderCancelBtn" class="btn btn-outline-secondary">주문취소</button>	
				<button type="button" id="requestRefundBtn" class="btn btn-outline-danger">환불요청</button>	
				<button type="button" id="deliveryConfirmBtn" class="btn btn-outline-primary">수취확인</button>
				<button type="button" id="personalQABtn" class="btn btn-outline-info">1:1문의</button>				
			</div>
		</div>	

 	<!--JavaScript Local LINK:START-->	
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/custom/js/general/post.daum.js"></script>		
<script type="text/javascript" src="/resources/custom/js/trading/orderView.js"></script>
	<!--JavaScript Local LINK:END-->