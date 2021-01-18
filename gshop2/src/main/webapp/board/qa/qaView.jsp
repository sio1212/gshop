<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
	<link rel="stylesheet" type="text/css" href="/resources/fontawesome5/css/all.css">
	
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
	.review_tdd{
		border-top: 1px solid #dfdfdf;
	    color: #353535;
	    vertical-align: middle;
	    display: table-cell;
	    padding: 8px 10px 7px;
	    border: 1px solid #d5d5d5;
	    font-weight: bold;
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
	.review_btns{
		display: inline-block;
		width:40px;
    	line-height:20px;
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
</style>
	
	<div class="reviews">
	 	<div class="review_main">
	 		<span class="review_sub">Q & A</span>	<p class="review_beaty">궁금한점은 글을 남겨주시면 답변해드려요.</p>	
		</div>
	</div>
	
 	<form name="qaViewForm">
 	
		<input type="hidden" id="pg" value="${pg}"/>
		<input type="hidden" id="qa_seq" value="${qaBoardDTO.qa_seq}"/>
		<input type="hidden" id="qa_pseq" value="${qaBoardDTO.qa_seq}"/>
		<input type="hidden" id="qa_pwd" value="${qaBoardDTO.qa_pwd}"/>		
		<input type="hidden" id="qa_reply" value="${qaBoardDTO.qa_reply}"/>
		
		<table class="review_form">
		<tbody>
			<tr>
				<th class="review_th">글번호</th>
				<td class="review_td">${qaBoardDTO.qa_seq}</td>			
			</tr>
			<tr>
				<th class="review_th">상품번호</th>
				<td class="review_td">
					<c:if test="${qaBoardDTO.productid==null}">[문의 상품 없음]</c:if>
					<c:if test="${qaBoardDTO.productid!=null}">[${qaBoardDTO.productid}]</c:if>	
				</td>
			</tr>	
			<tr>
				<th class="review_th">작성자</th>
				<td class="review_td">${qaBoardDTO.name}</td>
			</tr>	
			<tr>
				<th class="review_th">작성일</th>
				<td class="review_td"><fmt:formatDate value="${qaBoardDTO.qa_logtime}" pattern="yyyy년 MM월 dd일"/></td>
			</tr>	
			<tr>
				<th class="review_th">제목</th>
				<td class="review_td">${qaBoardDTO.qa_subject}</td>
			</tr>	
			<tr>
				<th class="review_th">문의하신 내용</th>
				<td class="review_td">${qaBoardDTO.qa_content}</td>
			</tr>
			<tr>
				<th class="review_th" id="adminAns">관리자 답변</th>
				<td class="review_tdd" id="answer">
					<c:if test="${qaBoardDTO.qa_reply=='0'}">
				   		아직 답변이 존재하지 않습니다.
				   	</c:if>
					<c:if test="${qaBoardDTO.qa_reply=='1'}">
					   	[관리자의 답변이 들어오는 자리입니다.]
					</c:if>	
				</td>
			</tr>
		</tbody>
	</table>
	</form>	<br><br><br>
	
	<div class="form_edit"  id="btnDiv">
			<div class="form_row">		
		<c:if test="${qaBoardDTO.user_id==memberDTO.id || qaBoardDTO.user_id==guestDTO.guest_id}">	
				<c:if test="${qaBoardDTO.qa_reply=='0'}">				
					<input type="button" class="review_btn" value="수정하기"  id="qaModifyFormBtn">	
				</c:if>					
				<c:if test="${qaBoardDTO.qa_reply=='1'}">
					<input type="button" class="review_btn" value="수정불가"  disabled>					
				</c:if>																
				<input type="button" class="review_btn" value="삭제하기" id="qaDeleteBtn">					
		</c:if>								
			<input type="button" value="목록으로" class="review_btn" onclick="location.href='/board/qa/qaList.do?pg=${pg}'">			
			</div>
		</div><br><br><br><br><br><br>					
		
	
	<div id="pwdConfirm" class="pwd_Confirm">
		<div class="pwd_Confirms"><i class="fas fa-exclamation">
			<input type="text" id="alertText" readonly class="pwd_readConfirm" value="글의 비밀번호를 입력하세요"/>
		</i>
		</div>
		<div class="pwd_Confirms">
			<input type="password" class="review_btnss" placeholder="비밀번호 입력" id="rePwd"/>			
			<input type="button" class="review_btns"  value="확인" id="checkQaPwd"/>			
		</div>		
		<input type="hidden" id="purpose" value=""> 						
	</div>				
<br><br><br><br><br><br><br><br>		

	<!--JavaScript Local LINK:START-->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/custom/js/qa/board.qa.js"></script>
<script type="text/javascript" src="/resources/custom/js/qa/qaView.js"></script>
	<!--JavaScript Local LINK:END-->