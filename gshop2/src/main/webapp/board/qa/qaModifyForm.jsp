<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	.review_th{
	    padding: 11px 0 10px 18px;
	    border: 1px solid #dfdfdf;
	    border-bottom-width: 0;
	    color: #353535;
	    text-align: left;
	    font-weight: normal;
	    background-color: #fbfafa;
	    width:  20%;
	}
	.review_td{
		border-top: 1px solid #dfdfdf;
	    color: #353535;
	    vertical-align: middle;
	    display: table-cell;
	    padding: 8px 10px 7px;
	    border: 1px solid #d5d5d5;
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
	.review_btn{
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
	}
		.form_edit{
		padding-left: 37%;
	}
	.form_row{
		float: left;
	}
	.pwd_Confirm{
		padding-left: 40%;
	}
	.pwd_readConfirm{
		border: none;
		font-size: 4px;
	}
	.content_form{
		margin: 0px; width: 840px; height: 363px;
	}
	.Confirm{
		color: red;
	}
</style>
  

	<div class="review">
	 	<div class="review_main">
	 		<span>Q & A Modify</span><p class="review_beaty">궁금한점은 글을 남겨주시면 답변해드려요.</p>	
		</div>
	</div>
	
	<input type="hidden" name="qa_seq" id="qa_seq" value="${qaBoardDTO.qa_seq}">
	<input type="hidden" name="pg" id="pg" value="${pg}">
	<input type="hidden" name="user_id" id="user_id" value="${qaBoardDTO.user_id}">	
	<input type="hidden" name="productid"  value="${qaBoardDTO.productid}">	
	<input type="hidden" id="qa_state" value="${qaBoardDTO.qa_state}"/>
	
	
	<table class="review_form">
		<tbody>
			<tr>
				<th class="review_th">제목</th>
				<td class="review_td">
				<input type="text" class="" id="qa_subject" value="${qaBoardDTO.qa_subject}">
				</td>
			</tr>
			<tr>
				<th class="review_th">상품명</th>
				<td class="review_td">
				<select id="productid" class="form-control">
					<option value="">[문의대상(선택)]</option>   
				</select>		    
				</td>
			</tr>	
			<tr>
				<th class="review_th">상품 이미지</th>
				<td class="review_td">
				<div style="height: 100%" id="imgDiv"></div>					
				</td>
			</tr>	
			<tr>
				<th class="review_th">CONTENT</th>
				<td class="review_td">
				<textarea class="content_form" id="qa_content" placeholder="문의하실 글의 내용을 입력해주세요.">${qaBoardDTO.qa_content}</textarea>
				</td>
			</tr>	
			<tr>
				<th class="review_th">글 비밀번호</th>
				<td class="review_td">
			     <input type="password" class="form-control" id="qa_pwd" placeholder="비밀번호 입력">
			     <input type="hidden" name="qa_check" id="qa_check" value="${qaBoardDTO.qa_pwd}">		
				</td>
			</tr>	
			<tr>
				<th class="review_th">구분</th>
				<td class="review_td" id="changeSecret">
				<c:if test="${qaBoardDTO.qa_state==0}">
					<button  class="btn btn-outline-secondary"><i class="fas fa-lock-open"></i></button>
				</c:if>
				<c:if test="${qaBoardDTO.qa_state==1}">
					<button  class="btn btn-outline-secondary"><i class="fas fa-lock"></i></button>
				</c:if>		    	
				</td>
			</tr>
		</tbody>
	</table><br><br><br>
	

	<div class="form_edit">
		<div class="form_row">      
			<input type="button" class="review_btn" value="수정하기" id="qaModifyBtn">
			<input type="button" id="qaReset" class="review_btn" value="다시작성">
			<input type="button" id="qaReturn" class="review_btn" value="뒤로가기">										    									
		</div>
	</div><br><br><br><br><br><br>		
							
	<div class="form_edit">
		<div class="Confirm" id="missingMod">
		</div>		
	</div><br><br><br><br><br> 


	<!--JavaScript Local LINK:START-->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/custom/js/qa/board.qa.js"></script>
<script type="text/javascript" src="/resources/custom/js/qa/qaModifyForm.js"></script>
	<!--JavaScript Local LINK:END-->








