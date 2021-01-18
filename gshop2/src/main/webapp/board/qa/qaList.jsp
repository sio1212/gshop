<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="/resources/fontawesome5/css/all.css">
	
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
	
	.page_wrap {
	text-align:center;
	font-size:0;
 }
.page_nation {
	display:inline-block;
}
.page_nation .none {
	display:none;
}
.page_nation a {
	display:block;
	margin:0 3px;
	float:left;
	border:1px solid #e6e6e6;
	width:28px;
	height:28px;
	line-height:28px;
	text-align:center;
	background-color:#fff;
	font-size:13px;
	color:#999999;
	text-decoration:none;
}
.page_nation .arrow {
	border:1px solid #ccc;
}
.page_nation .pprev {
	background:#f8f8f8 url('img/page_pprev.png') no-repeat center center;
	margin-left:0;
}
.page_nation .prev {
	background:#f8f8f8 url('image/page_prev.png') no-repeat center center;
	margin-right:7px;
}
.page_nation .next {
	background:#f8f8f8 url('image/page_next.png') no-repeat center center;
	margin-left:7px;
}
.page_nation .nnext {
	background:#f8f8f8 url('img/page_nnext.png') no-repeat center center;
	margin-right:0;
}
.page_nation a.active {
	background-color:#42454c;
	color:#fff;
	border:1px solid #42454c;
}
</style>	
	<div class="review">
	 	<div class="review_main">
	 			<span>Q & A</span><p class="review_beaty">궁금한점은 글을 남겨주시면 답변해드려요.</p>	
		</div>
	</div>
	
	<input type="hidden" id="pg" value="${pg}"/>
	<input type="hidden" id="userName" value="${memberDTO.name}"/>
		
		<table id="qaTable" class="review_form">
			<thead>
			    <tr>
					<th class="review_list_th">#</th>
					<th class="review_list_th">제목</th>
					<th class="review_list_th">작성자</th>
					<th class="review_list_th">상품번호</th>	
					<th class="review_list_th">작성일</th>						
					<th class="review_list_th">구분</th>										
					<th class="review_list_th">답변</th>			
				</tr>
			</thead>  
			<tbody>
				<tr>
					<th scope="row"></th>
					<td colspan="6">
					</td>	  
		</table>
	<br>		   		
			   	</tr>
			</tbody> 	
	
	<div class='page_wrap'>
		
	<div class='page_nation'>
			<nav aria-label="Page navigation">
				<div id="boardPagingDiv"></div>			
			</nav>
	</div>
	</div>	
	<form id="reviewSearch">
		<div class="searchforms">
			<input type="hidden" name="pg" value="1">	
			<div class="searchform">
				<select  id="searchOption" class="writer">
					<option value="name">작성자</option>
					<option value="user_id">아이디</option>
			        <option value="qa_subject">제목</option>
			    </select>			
			</div>
			<div class="searchform">
		    	<input type="text"  id="keyword" value="${keyword}">			
			</div>
			<div class="searchform">
		    	<input type="button" id="qaSearchBtn" class="reviewBtn" value="검색">
			</div>
		</div>
  	</form>
  	
  	
			<div class="col-2">
			    <input type="button" id="goQaWrite" class="reviewBtn_write" value="글쓰기">		
			</div><br><br><br><br>		
		
	<!--JavaScript Local LINK:START-->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/custom/js/qa/board.qa.js"></script>
<script type="text/javascript" src="/resources/custom/js/qa/qaList.js"></script>
	<!--JavaScript Local LINK:END-->