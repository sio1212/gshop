<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



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
	.review_td{
		border-top: 1px solid #dfdfdf;
	    color: #353535;
	    vertical-align: middle;
	    display: table-cell;
	    padding: 8px 10px 7px;
	    border: 1px solid #d5d5d5;
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
	.replyd:before {
		content: url('/image/icon_re.gif');
		padding-right: 4px;
		vertical-align: middle;
	}
	
	
</style>	

<!--  R E V I E W   S T A R T-->

	<div class="review">
	 	<div class="review_main">
	 			<span>REVIEW</span>	<p class="review_beaty">여러분의 소중한 구매후기를 남겨주세요.</p>	
		</div>
	</div>
	
	<input type="hidden" id="pg" value="${pg}">
	<input type="hidden" id="userName" value="${memberDTO.name}"/>	
	
		<table id="reviewTable" class="review_form">
			<thead>
			    <tr>
					<th class="review_list_th">#</th>
					<th class="review_list_th">제목</th>
					<th class="review_list_th">작성자</th>
					<th class="review_list_th">상품번호</th>	
					<th class="review_list_th">상품이미지</th>						
					<th class="review_list_th">조회수</th>										
					<th class="review_list_th">작성일</th>			
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
	<br>		
		<div class="">
		   <input type="button" id="goReviewWrite" class="reviewBtn_write" value="글쓰기">		
		</div><br><br> 
	
	<div class="form-row align-items-center subContent">
		<div class="col">
			<nav aria-label="Page navigation">
				<ul class="pagination justify-content-center" id="boardPagingDiv"></ul>			
			</nav>
		</div>								
	</div><br><br><br>			
		
	<form id="reviewSearch">
		<div class="searchforms">
			<input type="hidden" name="pg" value="1">	
			<div class="searchform">
				<select name="searchOption" id="searchOption" class="writer">
					<option value="name">작성자</option>
					<option value="user_id">아이디</option>
			        <option value="qa_subject">제목</option>
			    </select>			
			</div>
			<div class="searchform">
		    	<input type="text"  name="keyword" id="keyword" value="${keyword}">			
			</div>
			<div class="searchform">
		    	<input type="button" id="reviewSearchBtn" class="reviewBtn" value="검색">
			</div>
		</div>
  	</form>
  	
  	
  	
  	<!-- 
  	
  	<div>
  		<a href>
<img src="//img.echosting.cafe24.com/skin/base/common/btn_page_prev.gif" alt="이전 페이지">
  		</a>
  		<ol>
  			<li style="    margin-left: 0;">
  			<li style="margin: 0 0 0 -1px;">
  			<li>
  			<li>
  		</ol>
		<a href>
		<img src="//img.echosting.cafe24.com/skin/base/common/btn_page_next.gif" alt="다음 페이지">
		</a>  		
  	</div>
  	 -->
  	<br><br><br><br>


	<!--JavaScript Local LINK:START-->	 	
<script type="text/javascript"  src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/custom/js/review/board.review.js"></script>
<script type="text/javascript" src="/resources/custom/js/review/reviewList.js"></script>
	<!--JavaScript Local LINK:END-->
