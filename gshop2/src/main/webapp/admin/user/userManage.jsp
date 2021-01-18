<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	    margin: 25px 0 0;
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
		width:100px;
    	line-height:20px;
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
	.info_btn{
		background-color:#1C1C1C;
	    color:white;
	}
</style>		
	
	
	<table id="memberListTable" class="review_form">
			<thead>
			    <tr>
					<th class="review_list_th">#</th>
					<th class="review_list_th">회원명</th>
					<th class="review_list_th">아이디</th>	
					<th class="review_list_th">등급</th>						
					<th class="review_list_th">가입일자</th>	
					<th class="review_list_th">상태</th>	
					<th class="review_list_th">비고</th>	
				</tr>
			</thead>  
			<tbody>
				<tr>
					<th scope="row"></th>
					<td colspan="7">
					</td>		   		
			   	</tr>
			</tbody> 	  
		</table><br><br>
	
		<!-- MEMBERLIST:START -->
		<form id="memberListForm"></form>
		<!-- MEMBERLIST:END -->		
	<div class="form-row align-items-center">
		<div class="form-group col" align="right"> 
			<input type="button" class="reviewBtn_write" value="전체 혜택 지급" id="giveBenefitAll">	
			<input type="button" class="reviewBtn_write" value="전체 공지 발송" id="giveNoticeAll">	
		</div>
	</div><br><br><br>
	<!--JavaScript Local LINK:START-->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/custom/js/adminUser/userManage.js"></script>	
	<!--JavaScript Local LINK:END-->