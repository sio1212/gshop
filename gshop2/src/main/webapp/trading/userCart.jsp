<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!--CSS Local LINK:START-->
<link rel="stylesheet" type="text/css" href="/resources/custom/css/userproduct.css">
	<!--CSS Local LINK:END-->
	
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
	.searchform{
		float: left;
		padding: 1px;
		text-align: center;
	}
	.searchforms{
		display: table;
		margin-left: 35%;
	}
	.writer{
		height: 22px;	
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
		width:70px;
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
	.form_check_input{
		width: 15px;
	    padding: 11px 0 10px;
	    border: 1px solid #dfdfdf;
	    border-bottom-width: 0;
	    color: #353535;
	    font-weight: normal;
	    background-color: #fbfafa;
	}
	.input_check{
		vertical-align: middle;
	}
	.cartedit{
		float: right;	
	}
	#totalDiv{
		color : red;
		font-size: 16px;
		border: 1px solid #dfdfdf;
	}
	#totalDivs{
		color : red;
		font-size: 16px;
		border: 1px solid #dfdfdf;
	}
	</style>

	<div class="review">
	 	<div class="review_main">
	 			<span>장바구니</span>
		</div>
	</div>
	
	<input type="hidden" id="memberID" value="${memberDTO.id}"/>
	<form id="cartListForm" method="post" action="/trading/removeCart.do">

		<table id="product_cart" class="review_form">
			<thead>
			    <tr>
					<th class="form_check_input">
					<input class="form_check_input" type="checkbox" id="checkAll" style="width:10px;height:10px;">
					</th>
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
					<td colspan="6	">
					</td>		   		
			   	</tr>
			</tbody> 	  
		</table>
			
	</form>
	
	<form id="cartOrderForm" method="post" action="/trading/orderForm.do">
		<input type="hidden" name="directOrder" value="false"/>
		<input type="hidden" name="product_name_no" value=""/>
		<input type="hidden" name="cart_qty" value="0"/>
	</form>
	
	<hr width="100%" color="darkgray" noshade/><br><br>
	
			<table id="" class="review_form">
			<thead>
			    <tr>
					<th class="review_list_th" style="font-weight: bold; font-size: 15px;">총 상품금액</th>
					<th class="review_list_th" style="font-weight: bold; font-size: 15px;">결제예정금액</th>										
				</tr>
			</thead>  
			<tbody>
				<tr>
					<td id="totalDivs" align="center"   style="border: 1px solid #dfdfdf;"></td>		   		
					<td id="totalDiv" align="center"></td>		   		
			   	</tr>
			</tbody> 	  
		</table>
	
	
	<br><br><br>		
	
		<div class="cartedit">
			<input type="button" class="reviewBtn" value="삭제 하기" id="choiceDelete">	
			<input type="button" class="reviewBtn" value="계속 쇼핑" id="goCategory">	
			<input type="button" class="reviewBtn" value="주문 하기" id="choiceOrder">	
		</div>
	<br><br><br><br><br>
	

 	<!--JavaScript Local LINK:START-->	
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/custom/js/trading/userCart.js"></script>
	<!--JavaScript Local LINK:END-->