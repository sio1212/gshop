<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	.postdesign{
		margin: 2px;
	}	
</style>			 

	<div class="review">
	 	<div class="review_main">
	 			<span>ORDER</span>	
		</div>
	</div>
	
	<input type="hidden" id="directOrder" value="${directOrder}"/>
	<hr class="sub-hr" noshade/>
		<div align="center">
	 		<h5 style="text-decoration:underline; text-undeline-position: under; letter-spacing: 2pt;font-size: 13px;color:#C35F5F">ORDER LIST</h5>		
	 	</div>	
	<hr  class="sub-secondary-hr" noshade/>
	
		<table id="orderviewTable" class="review_form">
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
					<td colspan="6">
					</td>		   		
			   	</tr>
			</tbody> 
		</table><br>
	
		<table class="review_form">
			<thead>
			    <tr>
					<th class="review_list_ths1">
					<div class="contro">
						<div class="totalamount" id="productTotalDiv"></div>	
						<div class="totalamount" id="deliveryFeeDiv"></div>	
						<div class="totalamount" id="subTotalDiv" style="color:#008bcc;font-size: 14px;"></div>
					</div>
					</th>
				</tr>
		</table>
	
	<hr  class="sub-secondary-hr" noshade/><br><br>
	

	
	<hr class="sub-hr" noshade/>
	
		<div align="center">
		 	<h5 style="text-decoration:underline;text-undeline-position: under;letter-spacing: 2pt;font-size: 13px;color:#C35F5F">ORDER INFO</h5>		
		 </div>	
		
	<hr  class="sub-secondary-hr" noshade/>		
		
		<table class="review_form">
			<thead>
			    <tr>
					<th class="review_list_thss">배송지 선택</th>
						<td class="list_td">
							<input class="form-check-input" type="radio" name="pesonalInfo" id="originalP" value="originalP" checked>
							<label class="form-check-label" for="originalP">기존</label>
							<input class="form-check-input" type="radio" name="pesonalInfo" id="newP" value="newP">
							<label class="form-check-label" for="newP">신규</label>
						</td>
				</tr>
				<tr>
					<th class="review_list_thss">주문자명</th>
					<td class="list_td">
						<input type="text" class="form-control-plaintext inline-form" id="order_name" value="" placeholder="주문하신 분의 이름 입력"> 
					</td>		   		
				</tr>	
				<tr>
					<th class="review_list_thss">수령자명</th>
					<td class="list_td">
						<input type="text" class="form-control-plaintext inline-form" id="order_receiver" value="" placeholder="받으실 분의 이름 입력"> 
					</td>		   		
				</tr>	
				<tr>
					<th class="review_list_thss">주문자 연락처</th>	
					<td class="list_td">
						<input type="text" class="form-control-plaintext inline-form" id="order_tel" value="" placeholder="ex>010-1234-5678">
					</td>		   		
				</tr>	
				<tr>
					<th class="review_list_thss">주문자 이메일</th>						
					<td class="list_td">
						<input type="email" class="form-control-plaintext inline-form" id="order_email" value="" placeholder="order@naver.com"> 
					</td>		   		
				</tr>	
			</thead>  
		</table><br>
		<div class="form-group col" align="center">
			<h5 style="color:red;font-weight:bold">[주의 바랍니다]</h5>
			<p>주문자님께서는 자신의 메일과 연락번호를 정확하게 확인 바랍니다.</p>
			<p>주문시의 연락처가 올바르지 않았거나 주문확인서가 정확하게 전달되지 않은 경우에는 고객센터에 직접 문의하시기 바랍니다.</p>
		</div>	    
			
	<hr class="sub-hr" noshade/>
	
		<div class="col" align="center">
	 		<h5 style="text-decoration:underline;text-undeline-position: under;letter-spacing: 2pt;font-size: 13px;color:#C35F5F ">The Delivery Address</h5>		
	 	</div>	
	
	<hr  class="sub-secondary-hr" noshade/>

			<table class="review_form">
			<thead>
			    <tr>
					<th class="review_list_thss">배송지 선택</th>
						<td class="list_td">
							<input class="form-check-input" type="radio" name="delivery" id="original" value="original" checked>
							<label class="form-check-label" for="original">기존</label>
							<input class="form-check-input" type="radio" name="delivery" id="new" value="new">
							<label class="form-check-label" for="new">신규</label>
						</td>
				</tr>
				<tr>
					<th class="review_list_thss"><strong>우편번호<img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"/></strong></th>
					<td class="list_td">
						<input class="postdesign" type="text" id="sample2_postcode" name="sample2_postcode" placeholder="우편번호" style="vertical-align: middle;">
						<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기"style="cursor: pointer;vertical-align: middle;height: 20px;color: white;background-color:#3C5A91;font-size: 10px;"><br>
						<input class="postdesign" type="text" id="sample2_address" name="sample2_address" placeholder="주소" size="46"><br>
						<input class="postdesign" type="text" id="sample2_detailAddress" name="sample2_detailAddress" placeholder="상세주소">
						<input class="postdesign" type="text" id="sample2_extraAddress" name="sample2_extraAddress" placeholder="참고항목">		
		<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
						<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
						</div>
					</td>
					</tr>
			</thead>  
		</table><br>

	<hr  class="sub-secondary-hr" noshade/><br><br>	
	
	<hr class="sub-hr" noshade/>

		<div class="col" align="center">
	 		<h5 style="text-decoration:underline;text-undeline-position: under;color:#C35F5F;font-size: 13px;letter-spacing: 2pt;">Coupon & Point</h5>		
	 	</div>	

	<hr  class="sub-secondary-hr" noshade/>	
	
		<table class="review_form">
			<thead>
			    <tr>
					<th class="review_list_ths" style="font-weight: bold;">총 할인가능액</th>
					<th class="review_list_ths"style="font-weight: bold;">사용 여부</th>
					<th class="review_list_ths"style="font-weight: bold;">포인트</th>
					<th class="review_list_ths"style="font-weight: bold;">쿠폰</th>	
					<th class="review_list_ths"style="font-weight: bold;">총 할인액</th>						
				</tr>
			</thead>  
			<tbody>
				<tr>
					<td class="point_td">
						<div class="" align="center" id="discoutableTotal"></div>			
					</td>		   		
					<td class="point_td">
						<div class="" align="center">
							<input class="" type="radio" name="useBenefit" id="yes" value="yes" checked>
							<label class="" for="original">사용함</label>
						</div>
						<div class=""align="center">
							<input class="" type="radio" name="useBenefit" id="no" value="no">
							<label class="" for="new">사용안함</label>
						</div>
					</td>		   		
					<td class="point_td">
						<div class="" align="center">			
							<input type="number" class="" id="point" value=""/> 		
						</div>
						<div class="" align="center">(점)</div>
						<div class=""></div>		
						<div class="">* 보유 포인트 : <font id="member_point"></font> (점)</div>
					</td>		   		
					<td class="point_td" style="width:80px;">
						<div class="" align="center">			
							<select id="coupon_no" class=""  style="border-bottom:1px solid;" >
								<option value="">[지급 쿠폰 선택]</option>   
							</select>				
						</div>			
						<div class="" id="couponDiv"></div>
					</td>		   		
					<td class="point_td">
						<div class="" id="couponWarningDiv"></div>				
						<div class="" align="center" id="discountTotal"></div>		
					</td>		   		
			   	</tr>
			</tbody> 
		</table><br>
	
	<br><br>
	
	<hr class="sub-hr" noshade/>
	
	<div class="form-row align-items-center">
		<div class="col" align="center">
	 		<h5 style="text-decoration:underline;text-undeline-position: under;color:#C35F5F;font-size: 13px;letter-spacing: 2pt;">Pay</h5>		
	 	</div>	
	</div>
	
	<hr  class="sub-secondary-hr" noshade/>
	
		<table class="review_form">
		  <tr>
		    <th class="review_list_thss">결제하실 금액</th>
			<td class="list_td">
				<div id="finalTotal"></div>				
			</td>
		  </tr>
		  <tr>
		  	<th class="review_list_thss">결제수단 선택</th>
		    <td class="list_td">
			<input type="radio" name="payment" id="card" value="1" checked>
			<label for="card">카드결제</label>
			<input type="radio" name="payment" id="bank" value="2">
			<label for="bank">무통장결제</label>
			<input type="radio" name="payment" id="etc" value="3" disabled>
			<label for="etc">기타</label>
		    </td>
		  </tr>
		</table>
	
		<hr  class="sub-secondary-hr" noshade/>	
	
	<div class="" id="cardDiv">
		<div class="" align="center">
			<h5 style="color:red;font-weight:bold;">[이 쇼핑몰은 상용이 아니므로 결제 API가 도입되지 않았습니다]</h5><br>
			<p>*진행을 위해서 아래 부분을 체크해주세요.</p><br>
			<input class="" type="checkbox" id="cardPaid" value="1">
			<label class="" for="cardPaid">[카드결제]를 선택하였습니다</label>
		</div>
	</div>		

	<div class="" id="bankDiv">
		<div class="" align="center">
			<h5 style="color:red;font-weight:bold;">[이 쇼핑몰은 상용이 아니므로 결제 API가 도입되지 않았습니다]</h5><br>
			<p>*진행을 위해서 아래 부분을 체크해주세요.</p><br>
			<input class="" type="checkbox" id="bankPaid" value="1">
			<label class="" for="bankPaid">[무통장결제]를 선택하였습니다</label>
		</div>
	</div>	

	<div id="etcDiv">
		<div style="color:red;font-weight:bold;text-align:center;">[추가로 결제할 금액이 없습니다]</div>	
	</div>	
		
	<hr class="sub-hr" noshade/>
	
	
		<div align="right">
			<input type="button" class="reviewBtn_write" value="주문하기" id="choiceOrder">	
			<input type="button" class="reviewBtn_write" value="돌아가기" id="returnBtn">	
		</div><br><br><br>					
 	<!--JavaScript Local LINK:START-->	
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/custom/js/general/post.daum.js"></script>
<script type="text/javascript" src="/resources/custom/js/trading/orderForm.js"></script>
	<!--JavaScript Local LINK:END-->