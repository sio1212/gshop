<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
	
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
	.review_td_name{
		width: 390px;
	}
	.review_form{
		width: 100%;
	    position: relative;
	    margin: 10px 0 0;
	    border: 1px solid;
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
	.review_ths{
	    padding: 11px 0 10px 18px;
	    border: 1px solid #dfdfdf;
	    border-bottom-width: 0;
	    color: #353535;
	    text-align: left;
	    font-weight: normal;
	    background-color: #fbfafa;
	    width: 150px;
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
		width:80px;
    	line-height:30px;
    	text-align:center;
	    background-color:#1C1C1C;
	    color:white;
	    margin: 2px;
	    margin-bottom: 20px;
	    font-size: 13px;
	    float: left;
	    cursor: pointer;
	}
	.review_Btn{
		align-items: center;
		display: block;
		padding-bottom: 100px;
	}
	.eee{
		padding-left: 38%;
	}
</style>	

	<div class="reviews">
	 	<div class="review_main">
	 			<span class="review_sub">REVIEW</span>	<p class="review_beaty">여러분의 소중한 구매후기를 남겨주세요.</p>	
		</div>
	</div>
	
	<c:if test="${memberDTO!=null}">
		<input type="hidden" id="user_id" value="${memberDTO.id}">
		<input type="hidden" id="name" value="${memberDTO.name}">
	</c:if>
	
	<input type="hidden" name="productid" value="${productID}"/>
	<input type="hidden" name="product_name_no" value="${product_name_no}"/>
		
	
		<table class="review_form">
			<tbody>
				<tr>
					<th class="review_th">제목</th>	
					<td class="review_td">
						<input type="text" class="review_td_name" name="review_subject" id="review_subject" placeholder="제목을 입력해주세요.">
					</td>	
				</tr>
				<tr>
					<th class="review_th">상품명</th>
					<td class="review_td">
						<select id="productid">
							<option value="">[리뷰상품]</option>   
						</select>	
					</td>
				</tr>
				<tr>
					<th class="review_th">상품 이미지</th>
					<td height="0" class="review_td">
						<div style="height: 100%" id="imgDiv"></div>					
					</td>
				</tr>
				<tr>
					<th class="review_th">상품 이미지</th>
					<td height="0" class="review_td">
						<div id="getname"></div>					
					</td>
				</tr>
			</tbody>
		</table>
		
		<br><br>
			<span class="review_sub">CONTENT</span><br><br>
		    <textarea id="review_content"></textarea>
		<br><br>
	
	    
		<table class="review_form">
			<tbody>
				<tr>
					<th class="review_ths">글 비밀번호</th>	
					<td class="review_td">
					     <input type="password" id="review_pwd" placeholder="비밀번호 입력">
					</td>	
				</tr>
				<tr>
					<th class="review_ths">재확인</th>
					<td class="review_td">
					     <input type="password" id="review_repwd" placeholder="비밀번호 재확인">
					</td>
				</tr>
			</tbody>
		</table><br><br><br>
	
		<div class="review_Btn">  
			<div class="eee">
				<input type="button" class="reviewBtn" value="리뷰 올리기" id="reviewWriteBtn">
				
				<input type="button" id="reviewReset" class="reviewBtn" value="다시작성">
				
				<input type="button" id="reviewReturn" class="reviewBtn" value="목록">									    									
			</div>    
		</div>
					
	<div class="">
		<div class="form-group col-5" id="missing"></div>		
	</div>
	
 
 	<!--JavaScript Local LINK:START-->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.ckeditor.com/4.12.1/standard/ckeditor.js"></script>
<script type="text/javascript" src="/resources/custom/js/general/ckeditor4.js"></script>
<script type="text/javascript" src="/resources/custom/js/review/board.review.js"></script>
<script type="text/javascript" src="/resources/custom/js/review/reviewWriteForm.js"></script>
	<!--JavaScript Local LINK:END-->