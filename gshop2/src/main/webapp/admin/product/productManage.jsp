<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!--CSS Local LINK:START--> 
<link rel="stylesheet" href="/resources/custom/css/userproduct.css">
	<!--CSS Local LINK:END-->
	<br><br><br>
<div class="col-lg-8" style="border:1px solid;">
	
	<div class="row" id="titleDiv">
		<div class="col">
			<h3>등록상품현황</h3>
		</div>
	</div>  
	
	<input type="hidden" id="pg" value="${pg}">	
		
	<div class="form-row align-items-center">
		<table id="productTable">
			<thead class="thead-dark">
				<tr>
					<th scope="col">#</th>			    
					<th scope="col">상품이미지</th>	
					<th scope="col">등록코드</th>
					<th scope="col">상품분류</th>					
					<th scope="col">상품명</th>	
					<th scope="col">할인가능여부</th>										
					<th scope="col">상품등록여부</th>					
				</tr>
			</thead>  
			<tbody>
				<tr>
			   		<th scope="row"></th>
			   		<td colspan="7"></td>			   		
			   	</tr>
			</tbody> 	  
		</table>
	</div>		
			
	<div class="form-row justify-content-center subContent">
		<div class="col">
			<nav aria-label="Page navigation">
			  	<ul class="pagination justify-content-center" id="productPagingDiv"></ul>
			</nav>
		</div>								
	</div>

	<form id="productSearch">	
		<div class="productSearch_form">	
			<input type="hidden" name="pg" value="1">					
			<div class="col-sm-2">
				<select name="searchOption" id="searchOption" class="form-control">		
					<option value="productid">등록 코드</option>					
					<option value="product_name_no">상품 코드</option>
					<option value="productName">상품명</option>
				</select>	
			</div><br>
			<div class="col-sm-4">
		    	<input type="text"  class="form-control" id="keyword" value="${keyword}">			
			    <input type="button" id="productSearchBtn" class="searchBtn" value="검색" width="10px;">		
			</div>
			
		</div>				
	</form>	
</div>

	<!--JavaScript Local LINK:START-->	 	
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/custom/js/adminProduct/admin.product.js"></script>
<script type="text/javascript" src="/resources/custom/js/adminProduct/productManage.js"></script>
	<!--JavaScript Local LINK:END-->
