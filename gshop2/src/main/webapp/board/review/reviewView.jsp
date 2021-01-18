<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
	.reviews{
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
	.review_sub{
		display: inline-block;
	    padding: 0 0 0 12px;
	    color: #2e2e2e;
	    font-size: 16px;
	    background: url(//img.echosting.cafe24.com/skin/base/layout/ico_heading.gif) 0 50% no-repeat;
		font-weight: bold;
	}
	.review_form{
		width: 100%;
	    position: relative;
	    margin: 10px 0 0;
	    border: 1px solid  #dfdfdf;
	    border-top: 0;
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
	}
	.review_td{
		border-top: 1px solid #dfdfdf;
	    color: #353535;
	    vertical-align: middle;
	    display: table-cell;
	    padding: 8px 10px 7px;
	    border: 1px solid #d5d5d5;
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
</style>


<div class="col-lg-8">
	<div class="reviews">
	 	<div class="review_main">
	 			<span class="review_sub">REVIEW</span>	<p class="review_beaty">여러분의 소중한 구매후기를 남겨주세요.</p>	
		</div>
	</div>
	
		<input type="hidden" id="pg" value="${pg}"/>
		<input type="hidden" id="review_seq" value="${reviewboardDTO.review_seq}"/>
		<input type="hidden" id="review_pseq" value="${reviewboardDTO.review_seq}"/>
		<input type="hidden" id="productid" name="productid" value="${reviewboardDTO.productid}"/>
		<input type="hidden" id="review_pwd" value="${reviewboardDTO.review_pwd}"/>

	<table class="review_form">
		<tbody>
			<tr>
				<th class="review_th">글번호</th>
				<td class="review_td">${reviewboardDTO.review_seq}</td>			
			</tr>
			<tr>
				<th class="review_th">상품번호</th>
				<td class="review_td">[${reviewboardDTO.productid}]</td>
			</tr>	
			<tr>
				<th class="review_th">작성자</th>
				<td class="review_td">${reviewboardDTO.name}</td>
			</tr>	
			<tr>
				<th class="review_th">작성일</th>
				<td class="review_td"><fmt:formatDate value="${reviewboardDTO.review_logtime}" pattern="yyyy년 MM월 dd일"/></td>
			</tr>	
			<tr>
				<th class="review_th">제목</th>
				<td class="review_td">${reviewboardDTO.review_subject}</td>
			</tr>	
			<tr>
				<th class="review_th">조회수</th>
				<td class="review_td">${reviewboardDTO.review_hit}</td>
			</tr>
			<tr>
				<th class="review_th">상품 이미지</th>
				<td class="review_td">
				<a class="dddd" href=/product/productView.do?product_name_no=${product_name_no}>
				<img src=/storage/showProduct.do?product_name_image=${reviewboardDTO.productid}></a>
				</td>
			</tr>
			<tr>
				<th class="review_th">CONTENT</th>
				<td class="review_td">${reviewboardDTO.review_content}</td>
			</tr>
				
		</tbody>
	
	
	
	</table>
	
	
		<c:if test="${reviewboardDTO.user_id==memberDTO.id}">
			<div class="col-2  reviewDiv">				  
				<input type="button" class="review_btn" value="수정하기"  id="reviewModifyFormBtn">
			</div>	
			<div class="col-2  reviewDiv">
				<input type="button" class="review_btn" value="삭제하기" id="reviewDeleteBtn">						
			</div>						  	
		</c:if>
	
	
	
	
	<form name="reviewViewForm">	
	</form>
	 
	<div class="form-group row" id="btnDiv">
		<div class="col-4"></div>	 
		<div class="col-2  reviewDiv">				    
			<input type="button" class="review_btn" value="답글달기" id="reviewReplyFormBtn">	
		</div>	  
		<div class="col-2  reviewDiv">				
			<input type="button" value="목록으로" class="review_btn"
					onclick="location.href='/board/review/reviewList.do?pg=${pg}'">										    									
		</div>
	</div>	
	
	<div id="pwdConfirm" class="form-row justify-content-center">
		<div class="col-1"></div>		
		<div class="col-4 reviewDiv">
			<input type="text" id="alertText" readonly class="form-control-plaintext" value="글의 비밀번호를 입력하세요"/>
		</div>
		<div class="col-3 reviewDiv">
			<input type="password" class="form-control" placeholder="비밀번호 입력" id="rePwd"/>			
		</div>
		<div class="col-2 reviewDiv">
			<input type="button" class="btn btn-outline-dark" value="확인" id="checkReviewPwd"/>			
		</div>		
		<input type="hidden" id="purpose" value=""> 						
	</div>				
</div><br><br><br><br><br><br><br><br>

	<!--JavaScript Local LINK:START-->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/custom/js/review/board.review.js"></script>
<script type="text/javascript" src="/resources/custom/js/review/reviewView.js"></script>
	<!--JavaScript Local LINK:END-->
