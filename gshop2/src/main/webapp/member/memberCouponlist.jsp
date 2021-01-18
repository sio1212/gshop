<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		.review_list_th{
		    padding: 11px 0 10px;
		    border: 1px solid #dfdfdf;
		    border-bottom-width: 0;
		    color: #353535;
		    font-weight: normal;
		    background-color: #fbfafa;
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
		</style>
    
	<div class="review">
	 	<div class="review_main">
	 		<span>Coupon List</span><p class="review_beaty">쿠폰 목록을 확인하시고 사용해주세요.</p>	
		</div>
	</div>   	
	<hr class="sub-hr" noshade/>	
	
		<table id="couponTable" class="review_form">
			<thead>
			    <tr>
					<th class="review_list_th" style="text-decoration:underline;text-underline-position:under">#</th>
					<th class="review_list_th" style="text-decoration:underline;text-underline-position:under">이름</th>
					<th class="review_list_th" style="text-decoration:underline;text-underline-position:under">분류</th>
					<th class="review_list_th" style="text-decoration:underline;text-underline-position:under">할인액(률)</th>	
					<th class="review_list_th" style="text-decoration:underline;text-underline-position:under">유효기간</th>						
					<th class="review_list_th" style="text-decoration:underline;text-underline-position:under">상태</th>										
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
	
	
	<hr class="sub-hr" noshade/>
	
	<div id="detailInfo"></div>		
	
		<div align="right">      								
			<button type="button" id="returnBtn" class="reviewBtn_write">돌아가기</button>					
		</div>
	
	<!--JavaScript Local LINK:START-->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/custom/js/member/memberCouponlist.js"></script>	
	<!--JavaScript Local LINK:END-->