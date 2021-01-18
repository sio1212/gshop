<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!--CSS Local LINK:START-->    
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
	}
</style>	
	<!--CSS Local LINK:END-->	
	<div class="review">
	 	<div class="review_main">
	 		<span>고객주문관리</span>	
		</div>
	</div>  	
	<input type="hidden" id="pg" value="${pg}">	
	<hr class="sub-hr" noshade/>	
	
	
	<table id="orderListTable" class="review_form">
			<thead>
			    <tr>
					<th class="review_list_th">#</th>
					<th class="review_list_th">주문일자</th>
					<th class="review_list_th">주문ID</th>
					<th class="review_list_th">주문자명</th>	
					<th class="review_list_th">주문내용</th>						
					<th class="review_list_th">거래상태</th>										
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
	
	<hr class="sub-hr" noshade/>

	<div class="form-row justify-content-center subContent">
		<div class="col">
			<nav aria-label="Page navigation">
			  	<ul class="pagination justify-content-center" id="orderPaingDiv"></ul>
			</nav>
		</div>								
	</div>	
	
	<form id="orderSearch" name="orderSearch">
		<div class="form-row justify-content-center">
			<div class="form-group col-2" align="center"></div>
			<div class="form-group col-2" align="center">
				<input type="hidden" name="pg" value="1">
				<select name="searchOption" id="searchOption" class="form-control">
			        <option value="order_no">주문번호</option>	
			        <option value="order_date">주문일자</option>			
			        <option value="order_id">주문ID</option>
					<option value="order_name">주문자명</option>
					<option value="order_state">거래상태</option>
			    </select>			
			</div>
			<div class="form-group col-3" align="center">
				<input type="text"  class="form-control" name="keyword" id="keyword" value="${keyword}">
			</div>
			<div class="form-group col-3" align="center">	
				<input type="button" id="orderSearchBtn" class="btn btn-outline-dark" value="주문검색">
				<input type="button" id="returnBtn" class="btn btn-outline-secondary" value="돌아가기">
			</div>	
			<div class="form-group col-2" align="center"></div>	   
		</div>
	</form>
	

	<!--JavaScript Local LINK:START-->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/custom/js/adminOrder/orderManage.js"></script>	
	<!--JavaScript Local LINK:END-->