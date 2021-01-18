<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<!--CSS Local LINK:START-->    
<link rel="stylesheet" type="text/css" href="/minishop/resources/bootstrap4/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/minishop/resources/custom/css/orderForm.css">
<link rel="stylesheet" type="text/css" href="/minishop/resources/custom/css/popup.css">	 
	
<style>
	.review_form{
		width: 100%;
	    position: relative;
	    margin: 10px 0 0;
   	    border: 1px solid #dfdfdf;
	    line-height: 1.5;
	    border-spacing: 0;
  	  	border-collapse: collapse;
	}
	.review_list_th{
	    padding: 11px 0 10px;
	    border: 1px solid #dfdfdf;
	    border-bottom-width: 0;
	    color: #353535;
	    font-weight: normal;
	    background-color: #fbfafa;
	    text-align: center;
	}

</style>	
	<!--CSS Local LINK:END-->
	
<div class="">  	

	<div class="form-row">	
		<div class="col" align="center">
 			<h2 class="first">[개별주문서조회]</h2>		
 		</div>
	</div>

	<input type="hidden" name="order_no" value="${order_no}">
	<input type="hidden" id="old_state" value="${old_state}">	
	<input type="hidden" id="new_state" value="${new_state}">	
	<div class="card card-body">		
		<h5 class="sub-title-undeline">[기본 정보]</h5>
		<div class="form-row ">	
			<div class="col-1" align="center">
				<label for="order_no" class="under-line-title">#</label>
			</div>	
			<div class="col-2" align="center">
				<font id="order_no"></font>
			</div>	
			<div class="col-2" align="center">
				<label for="order_id" class="under-line-title">주문ID</label>
		  	</div>	
			<div class="col-2" align="center">
				<font id="order_id"></font>
			</div>							  
			<div class="col-2" align="center">
				<label for="order_date" class="under-line-title">최초주문일</label>
		  	</div>	
			<div class="col-3" align="center">
				<font id="order_date"></font>
			</div>				  			  		  				  	
		</div>	

		<div class="form-row ">	
			<div class="col-1" align="center">
				<label for="order_state" class="under-line-title">상태</label>
		  	</div>	
			<div class="col-2" align="center">
				<font id="order_state"></font>
			</div>			
			<div class="col-2" align="center">
				<label for="order_name" class="under-line-title">주문자</label>
			</div>	
			<div class="col-2" align="center">
				<font id="order_name"></font>
			</div>				  	  			  	
			<div class="col-2" align="center">
				<label for="order_logtime" class="under-line-title">최종수정일</label>
		  	</div>	
			<div class="col-3" align="center">
				<font id="order_logtime"></font>
			</div>					  				  	
		</div>	
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
		</div>
		
		
		<form id="modifyDeliveryForm">
		<table>
			<tr>
		<th><strong>우편번호  <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"/></strong></th>
			<td>
				<input type="text" id="sample2_postcode" name="sample2_postcode" placeholder="우편번호">
				<input type="button" onclick="sample2_execDaumPostcode()" id="checkPost" value="우편번호 찾기" disabled><br>
				<input type="text" id="sample2_address" name="sample2_address" placeholder="주소" size="46"><br>
				<input type="text" id="sample2_detailAddress" name="sample2_detailAddress" placeholder="상세주소">
				<input type="text" id="sample2_extraAddress" name="sample2_extraAddress" placeholder="참고항목">		

<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
				<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
				<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
				</div>


			</td>
		</tr>
		</table>
			<div class="form-row justify-content-center">
				<div class="form-group col" align="right">      								
					<button type="button" id="doModifyDelivery" class="btn btn-outline-info">반영하기</button>			
				</div>
			</div>				
			<hr  class="sub-secondary-hr" noshade/>					 
		</form>
		
		
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
					<th class="review_list_th">#</th>
					<th class="review_list_th">상품이미지</th>
					<th class="review_list_th">상품명</th>
					<th class="review_list_th">판매단가</th>	
					<th class="review_list_th">수량</th>						
					<th class="review_list_th">합계</th>										
				</tr>
			</thead>  
			<tbody>
				<tr>
					<th scope="row"></th>
					<td colspan="6">
					</td>		   		
			   	</tr>
			</tbody> 	  
		</table>
		
		
		<hr  class="sub-secondary-hr" noshade/>

	<style>
		.pqytotalTable{
			width: 50%;
			float: right;
			margin-left: 65%;
		}
	
	</style>
		<table class="pqytotalTable">
			<tr>
				<th class="">상품 합계</th>
				<td class="">
					: <span id="productTotalDiv"></span>	
				</td>
			</tr>
			<tr>
				<th class="">배송료</th>
				<td class="">
					: <span id="deliveryFeeDiv"></span>	
				</td>
			</tr>
			<tr>
				<th class="">총 합계</th>
				<td class="">
					: <span id="subTotalDiv"></span>
				</td>
			</tr>
		</table>
									
		<hr class="sub-hr" noshade/>	

			
		<h5 class="sub-title-undeline">[결제 정보]</h5>		
		
		<table id="paymentTable" class="review_form">
			<thead>
			    <tr>
					<th class="review_list_th">결제방법</th>
					<th class="review_list_th">결제일자</th>
					<th class="review_list_th">결제금액</th>
					<th class="review_list_th">비고</th>	
				</tr>
			</thead>  
			<tbody>
				<tr>
					<th scope="row"></th>
					<td colspan="4">
					</td>		   		
			   	</tr>
			</tbody> 	  
		</table>
			
		<hr class="sub-hr" noshade/>	


			
		<h5 class="sub-title-undeline">[추가 정보]</h5>	
		<div class="form-row">
			<div class="col-8">
				<input type="checkbox" id="extraAddCheck" value="1">추가 정보를 변경합니다
			</div>
			<div class="col-4"></div>
		</div>			

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
		<div class="form-row justify-content-center">
			<div class="form-group col" align="right">      								
				<button type="button" id="modifyExtra" class="btn btn-outline-info" disabled>반영하기</button>			
			</div>
		</div>
		<form id="changeDiv">
			<div class="form-row justify-content-center">
				<div class="form-group col" align="center">      								
					<h6><strong>[<font id="oldState"></font>]상태에서 [<font id="newState"></font>]상태로 변경합니다.</strong></h6>
					<p>(주)상태 변경시에는 하단의 확인 버튼으로 최종 반영됩니다.<br> 확인 없이 창을 닫을 경우 원상태로 복귀합니다.</p>
				</div>
			</div>	
			<div class="form-row justify-content-center">
				<div class="form-group col" align="center">      								
					<input type="button" class="btn btn-outline-danger btn-block" id="stateChangeBtn" value="확인"/>
				</div>
			</div>
		</form>								
	</div>
</div>		
							

	<!--JavaScript Local LINK:START-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/custom/js/general/post.daum.js"></script>	
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/bootstrap4/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="/resources/custom/js/adminOrder/personalOrderView.js"></script>
	<!--JavaScript Local LINK:END-->