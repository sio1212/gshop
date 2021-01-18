<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.productList_view{
		width: 100%;
		height: 100%;
	}
	.productList_Form{
		width: 100%;
		display: inline-block;
		text-align: center;
	    list-style-type: disc;
	    margin-block-start: 1em;
	    margin-block-end: 1em;
	    margin-inline-start: 1px;
	    margin-inline-end: 0px;
	    padding-inline-start: 20px;
	}
	.proBox{
		position: relative;
		width: 90%;
		text-align: center;
	}
	.thumbnail{
		position: relative;
		text-align: center;
	}
	.product_description{
		position: relative;
		margin: 0 auto;
	    padding: 25px 10px 0px 10px;
	    font-size: 12px;
	    line-height: 18px;
	    text-align: center;
	}
	.des_inner{
		text-align: left;
	}
	.product_name{
		display: block;
		border-bottom: 1px solid #ccc;
	}
	.product_price{
		display: block;
		font-weight: bold;
	}
	.testyo{
		float: left;
		width: 33.33%;
		display: inline-block;
		margin: 20px 0px;
	}
	.product{
		margin: 0;
		padding: 0;
		display: block;
	}
	
	.evtIco_obj {
	    display: inline-block;
	    box-sizing: border-box;
	    height: 13px;
	    margin-right: 3px;
	    padding: 0 1px;
	    border: 1px solid #86b0a5;
	    font-size: 10px;
	    line-height: 10px;
	    margin-bottom: 0px;
	    font-family: spoqa M;
	    vertical-align: middle;
	}
	.special{
	}
	#ggg{
		border-bottom: 1px solid #ccc;
		font-size: 15px;
		font-weight: bold;
		padding: 10% 0 10px;
		letter-spacing: 1pt;
		text-align: center;
		margin: 8px 0;
	}
</style>
    
		<h3 id="ggg">
      		<span>SPECIAL</span>
		</h3><br><br>        	
		
		
		<div class="special">
			<input type="hidden" id="condition" value="${condition}">  
				 

		<ul class='productList_Form'>
		 	<div id="mainList2" class="row"></div>
		 </ul>
		</div>		
		



	<!--JavaScript Local LINK:START-->

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/custom/js/product/eventProductList.js"></script>
	<!--JavaScript Local LINK:END-->
