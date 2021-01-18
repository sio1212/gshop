<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    


	<input type="hidden" id="SEQ" value="${SEQ}"/>
	<input type="hidden" id="productID" value="${productDTO.productID}"/>
	<input type="hidden" id="product_name_no" value="${productDTO.product_name_no}"/>
	<input type="hidden" id="unitcost" value="${productDTO.unitcost}"/>
	<input type="hidden" id="stock" value="${productDTO.stock}"/>	
	<input type="hidden" id="userName" value="${memberDTO.name}"/>
	<input type="hidden" id="memberID" value="${memberDTO.id}"/>
<style>

	.product_imgs{
 	   	width: 350px;
    	height: 400px;
	}
	.product_detail{
	    position: relative;
	    margin: 0 auto;
	    padding: 0px 0 0 0;
	    display: block;
	}
	.product_detail_1{
		margin: 0px auto;
	    width: 900px;
	    clear: both;
	    display: block;
	}
	.product_detai{
	}
	.product_detail_2{
	    position: Relative;
	    float: left;
	    width: 400px;
	    text-align: center;
		display: block;
		padding-top: 100px;
	}
	.product_detail_3{
	}
	.product_detail_4{
		position: Relative;
	    float: left;
	    width: 400px;
	    margin: 1px 0 0 90px;
	    background: #fff;
		padding-top: 100px;
	}
	.custom_info{
		border-bottom: 1px solid #ccc; 
		padding-bottom: 10px;
		letter-spacing: 1pt;
		font-size: 15px;
	}
	.custom_info1{
	    color: #353535;
	    line-height: 18px;
        text-align: center;
        padding-top: 55%;
	}
	.product_price{
		
	}
	.original_price{
		color: darkgrey;
		font-size: 15px;
		text-decoration: line-through;
	}
	.product_price{
		color:#008BCC;
		font-weight: bold;
		font-size: 15px;
	}
	.btnarea{
		overflow: hidden;
	    margin: 0 0 15px;
	    text-align: left;
	}
	.btnarea_1{
		background: #fff;
	    color: #000;
	    border: 2px solid #000;
	    width: 362px;
	    padding: 0px 0;
	    margin: 0 3px;
	    letter-spacing: 1.5px;
	    font-size: 12px;
	    font-weight: 400;
	    height: 53px;
	    line-height: 53px;
	    cursor: pointer;
	}
	.total_price{
		font-size: 15px;
		letter-spacing: 1pt;
	}
	.detail_ima{
		width: 100%; 
		height: 100%;
	}
	.plaintext{
		width: 40px;
	}
</style>	
					
	<!-- 상단 제품 정보 -->
<div class="product_detail">
	<div class="product_detail_1">
		<div class="product_detai"> 
			<div class="product_detail_2">
				<div class="product_detail_3">
			   		<img class="detail_ima" src="/storage/showProduct.do?product_name_image=${productDTO.product_name_image}">
				</div>
			</div>

			<div class="product_detail_4">
		
			   		<span style="font-size: 15px; font-weight: bold;">${productDTO.productName}</span><br><br><br>
				   <div>
				   	<c:if test="${productDTO.product_name_price<=productDTO.unitcost}">
						<div class="product_price">판매가&emsp;<fmt:formatNumber type="number" value="${productDTO.unitcost}" pattern="#,###"/>원</div>
					</c:if><br><br>
					<c:if test="${productDTO.product_name_price>productDTO.unitcost}">
						<div class="original_price">정상가&emsp;<fmt:formatNumber type="number" value="${productDTO.product_name_price}" pattern="#,###"/>원</div><br>
						<div class="product_price">판매가&emsp;<fmt:formatNumber type="number" value="${productDTO.unitcost}" pattern="#,###"/>원</div><br>	<br>					
					</c:if>	
				   </div>
					
			   		<span style="font-size: 13px;">수량</span><br><br>
						<div class="btn-group" role="group" aria-label="Second group">
						 	<button type="button" id="cart_minus" class="btn"><i aria-hidden="true"></i>-</button>
							<input type="number" class="plaintext" id="cart_qty" value="1">
							<button type="button" id="cart_plus" class="btn"><i aria-hidden="true"></i>+</button>
  						</div><br><br>		   		
					<div class="total_price">TOTAL&emsp;<font id="totalCost"><fmt:formatNumber type="number" value="${productDTO.unitcost}" pattern="#,###"/></font>원</div>
						<br><br>
						<div class="btnarea">
							<button type="button" id="putCartBtn" class="btnarea_1">ADD TO CART</button>
						</div>
						<div class="btnarea">
							<button type="button" id="putCartBtns" class="btnarea_1">BUY NOW</button>
						</div>
						<div class="btnarea">
							<button type="button" id="putCartBtns" class="btnarea_1">WISH LIST</button>
						</div>
			</div>
		</div>
	</div>
</div>
			<form id="buyNowForm" method="post" action="/trading/orderForm.do">
				<input type="hidden" name="directOrder" value="true"/>
				<input type="hidden" name="product_name_no" value=""/>
				<input type="hidden" name="cart_qty" value="1"/>
			</form>
		
				<div class="custom_info1">
					<div class="custom_info">
					   		<span>CUSTOMER INFORMATION</span>
					</div>
	
					   		${productDTO.product_name_detail}
				</div>			
		
			<div class="col" align="center">
				<button type="button" id="writeQABtn" class="">이 상품의 문의 쓰기</button>
				<button type="button" id="writeReviewBtn" class="">이 상품의 뷰 쓰기</button>
			</div>
		
	 	<!-- shop policies -->
	

   	<!--JavaScript Local LINK:START--> 
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/custom/js/product/productView.js"></script>
	<!--JavaScript Local LINK:END-->