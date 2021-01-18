<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
	<!--CSS Local LINK:START--> 
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
		
		</style>
<div class="col-lg-8">
	<div class="row" id="titleDiv">
		<div class="col">
			<h3>매출 현황</h3>		
		</div>
	</div>  
	<input type="hidden" id="pg" value="1">	
	<div class="form-row justify-content-center">
		<div class="col-6"></div>
		<div class="col-1"><label>[기준]</label></div>
		<div class="col-2">
			<select id="sortSubject" class="form-control-plaintext inline-form">
				<option value="">[정렬기준]</option>
				<option value="sales_date">매출일자</option>			
				<option value="order_no">주문번호</option>
				<option value="order_id">주문자</option>
				<option value="sales_revenue">거래합계</option>																					
			</select>
		</div>
		<div class="col-1"><label>[차순]</label></div>
		<div class="col-2">
			<select id="sortType" class="form-control-plaintext inline-form">
				<option value="">[정렬차순]</option>
				<option value="desc">내림차순</option>	
				<option value="asc">오름차순</option>							
			</select>
		</div>														
	</div>
	<br>
	<div class="table-responsive-md table-hover">
	
		<table id="salesInfoTable" class="review_form">
			<caption>(단위:원)</caption>
			<thead>
			    <tr>
					<th class="review_list_th">#</th>
					<th class="review_list_th">주문<br>번호</th>
					<th class="review_list_th">주문자</th>
					<th class="review_list_th">거래합계</th>	
					<th class="review_list_th">현금<br>결제</th>						
					<th class="review_list_th">카드<br>결제</th>										
					<th class="review_list_th">포인트<br>결제</th>			
					<th class="review_list_th">쿠폰<br>결제</th>			
					<th class="review_list_th">기타<br>금액</th>			
					<th class="review_list_th">매출일자</th>			
				</tr>
			</thead>  
			<tbody>
			</tbody> 	  
		</table>
	</div>
	
	<div class="form-row align-items-center">
		<div class="col-3">
			<a id="reloadIcon" href="#"><i class="fas fa-retweet">새로고침</i></a>
		</div>
		<div class="col-9"></div>
	</div>	
	
	<div class="form-row justify-content-center subContent">
		<div class="col">
			<nav aria-label="Page navigation">
			  	<ul class="pagination justify-content-center" id="salesInfoPagingDiv"></ul>
			</nav>
		</div>								
	</div>

	<div class="table-responsive-md table-hover">	
	
	
		<table id="totalSalesTable" class="review_form"	>
			<caption>(단위:원)</caption>
			<thead>
			    <tr>
					<th class="review_list_th">총누적거래수</th>
					<th class="review_list_th">총매출:합계</th>
					<th class="review_list_th">총매출:현금</th>
					<th class="review_list_th">총매출:카드</th>	
					<th class="review_list_th">총매출:포인트</th>						
					<th class="review_list_th">총매출:쿠폰</th>										
					<th class="review_list_th">총매출:기타</th>			
				</tr>
			</thead>  
			<tbody>
			</tbody> 	  
		</table>
	
	</div>
	
	<form id="salesInfoSearch" method="post" name="salesInfoSearch">	
		<div class="form-row justify-content-center">	
			<input type="hidden" name="pg" value="1">					
			<div class="col-sm-2">
				<select id="searchOption" name="searchOption" class="form-control-plaintext inline-form">
					<option value="">검색조건</option>
					<option value="order_no">주문번호</option>
					<option value="order_id">주문자</option>
					<option value="sales_date">매출일자</option>	
				</select>			
			</div>
			<div class="col-sm-4">
		    	<input type="text"  class="form-control-plaintext inline-form" id="keyword" name="keyword" value="${keyword}">			
			</div>
			<div class="col-2">
			    <input type="button" id="salesInfoSearchBtn" class="form-control btn btn-outline-dark" value="검색">		
			</div>
			<div class="col-2">
			    <input type="button" id="openChart" class="form-control btn btn-outline-info" value="차트분석">		
			</div>							
		</div>				
	</form>

				
</div>
	<!--JavaScript Local LINK:START-->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/custom/js/adminShop/salesInfo.js"></script>	
	<!--JavaScript Local LINK:END-->