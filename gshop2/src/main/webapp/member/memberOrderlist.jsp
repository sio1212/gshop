<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

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
	.orderBtn {
		width: 60px;
		height: 30px;
		display: inline-block;
		padding: 5px 0;
    	line-height:16px;
    	text-align:center;
	    background-color:#1C1C1C;
	    color:white;
	    margin: 2px;
	    font-size: 12px;
	    cursor: pointer;
	    vertical-align: middle;
	    margin-top: 0.5px;
	}	
	</style>
    
	<div class="review">
	 	<div class="review_main">
	 		<span>ORDER LIST</span><p class="review_beaty">주문하신 내역을 확인하세요.</p>
	 	</div>
	</div> 	
	<hr class="sub-hr" noshade/>	
	
		<table id="orderListTable" class="review_form">
			<thead>
			    <tr>
					<th class="review_list_th">#</th>
					<th class="review_list_th">주문일자</th>
					<th class="review_list_th">구매내역</th>
					<th class="review_list_th">상태</th>	
					<th class="review_list_th">확인/신청</th>						
				</tr>
			</thead>  
			<tbody>
				<tr>
					<th scope="row"></th>
					<td colspan="5">
					</td>		   		
			   	</tr>
			</tbody> 	  
		</table>
	
	<hr  class="sub-secondary-hr" noshade/>
	
		<div align="right">
			<input type="button" class="reviewBtn_write" value="1:1문의" id="personalQABtn">	
			<input type="button" class="reviewBtn_write" value="돌아가기" id="returnBtn">	
		</div><br><br><br>	
	
	<!--JavaScript Local LINK:START-->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/custom/js/member/memberOrderlist.js"></script>	
	<!--JavaScript Local LINK:END-->