<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
		
	<!--CSS Local LINK:START--> 
<link rel="stylesheet" href="/minishop/resources/custom/css/userboard.css">
	<!--CSS Local LINK:END-->
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
		
	<div id="titleDiv">
		<div>
				<h3>답변대기중인 문의글</h3>
			</div>	
		</div>
		
	 <form name="qaViewForm">
		<input type="hidden" id="pg" name="pg" value="${pg}"/>
		<input type="hidden" id="admin_pseq" name="admin_pseq" value="${qaBoardDTO.qa_seq }"/>
		<input type="hidden" id="qa_pseq" name="qa_pseq" value="${qaBoardDTO.qa_seq}"/>
		<input type="hidden" id="user_id" name="user_id" value="${qaBoardDTO.user_id}"/>	
		<div class="table-responsive">
			<table id="viewTable" class="review_form">
			    <tr>
					<th class="review_list_th">글번호</th>
					<th class="review_list_th">제목</th>
					<th class="review_list_th">작성자</th>
					<th class="review_list_th">상품번호</th>					
					<th class="review_list_th">작성일</th>			
			  </tr>
			   <tbody>
			   	<tr>
			   		<th scope="row" class="align-middle">${qaBoardDTO.qa_seq}</th>
			   		<td class="align-middle">${qaBoardDTO.qa_subject}</td>			   		
			   		<td class="align-middle">${qaBoardDTO.name}</td>
			   		<td class="align-middle">
			   		<c:if test="${qaBoardDTO.productid==null}">[문의 상품 없음]</c:if>
			   		<c:if test="${qaBoardDTO.productid!=null}">[${qaBoardDTO.productid}]</c:if>
			   		
			   		</td>		
			   		<td class="align-middle"><fmt:formatDate value="${qaBoardDTO.qa_logtime}" pattern="yyyy년 MM월 dd일"/></td>		   				   		   		
			   	</tr>
			   	<tr class="thead-dark">
			   		<th colspan="5" class="align-middle">문의하신 내용</th>		   				   		   		
			   	</tr>	
			   	<tr>
			   		<td class="align-middle">${qaBoardDTO.qa_content}</td>	   				   		   		
			   	</tr>				   					   			   	
			   	<tr>
			   		<th colspan="5" class="align-middle">
			   		<i id="adminAns" class="fas fa-check-circle">관리자 답변</i>
			   		</th>		   				   		   		
			   	</tr>

			   	<tr>
			   		<td id="answer" colspan="5" class="align-middle">
						  <textarea id="admin_content" class="md-textarea form-control" rows="3"></textarea>		   		
			   		</td>	   				   		   		
			   	</tr>				   		   				   	
			</tbody>
		</table>
	  </div>
	</form>	
			
		<div class="form-group" id="btnDiv">
			<div class="row">
				<div align="right">   
				<input type="button" class="reviewBtn_write" id="adminWriteBtn" value="답변 작성">			  	
				<input type="button"  id="resetAns" class="reviewBtn_write" value="답변 재작성">			
				<input type="button" value="돌아가기" class="reviewBtn_write"
					onclick="location.href='/admin/board/qaManage.do?pg=${pg}'">										    									
				</div>
		    </div>	
	</div><br><br><br>
	
	<!--JavaScript Local LINK:START-->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/custom/js/qa/board.qa.js"></script>
<script type="text/javascript" src="/resources/custom/js/adminBoard/qaManageView.js"></script>
	<!--JavaScript Local LINK:END-->
