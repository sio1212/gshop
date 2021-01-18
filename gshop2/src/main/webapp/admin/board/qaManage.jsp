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
		</style>
	
<div class="col-lg-8">
	<div class="row" id="titleDiv">
		<div class="col">
				<h3>답변대기중인 문의글 현황</h3>
			</div>	
		</div>
		
		<input type="hidden" id="pg" value="${pg}"/>	
		<div class="table">
			<table id="qaTable" class="review_form">
			    <tr>
					<th  class="review_list_th">#</th>
					<th  class="review_list_th">제목</th>
					<th  class="review_list_th">작성자</th>
					<th  class="review_list_th">상품번호</th>					
					<th  class="review_list_th">작성일</th>
					<th  class="review_list_th">구분</th>					
			  </tr>
			   <tbody>
			   	<tr>
			   		<th scope="row"></th>
			   		<td colspan="5"></td>			   		
			   	</tr>
			   </tbody> 	  
			</table>
		</div>		

	<div class="container-fluid">
			<nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center" id="boardPagingDiv"></ul>
			</nav>
	</div>
 			
	</div>	


	<!--JavaScript Local LINK:START-->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/custom/js/qa/board.qa.js"></script>
<script type="text/javascript" src="/resources/custom/js/adminBoard/qaManage.js"></script>
	<!--JavaScript Local LINK:END-->