<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
	.join_main {
		text-align: center;
	}
	.logintle {
		border: 1px solid;
		text-align: center;
		width: 50%;
		padding-top: 2%;
		margin: auto;
	}
	.thumbnail {
		display: table-cell;
	    padding: 0 15px;
	    width: 70px;
	    text-align: center;
	    vertical-align: middle;
	    
	}
	.information {
		display: table;
	    table-layout: fixed;
	    padding: 10px 0;
	    width: 100%;
	    box-sizing: border-box;
	    text-align: center;
	    border: 1px solid;
	}
	.description{
	    display: table-cell;
	    padding: 0 10px;
	    width: auto;
	    line-height: 1.5em;
	    border-left: 1px solid #e8e8e8;
	    vertical-align: middle;
	}
	.pwbtn {
		color: white;
		background-color: #1C1C1C;
		border: none;
		padding: 15px;
		cursor: pointer;
	}
	.modi {
		padding: 1%;
	}
	.modifyinfo input{
		border: 1px solid #d7d5d5;
	}
	th {
		background-color: #fbfafa;
		color: maroon;
		border: 1px solid #d7d5d5;
		padding: 15px;
		width: 115px;
	}
	td {
		padding-left: 6px;	
		border: 1px solid #d7d5d5;
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

<div class="join_main">
		<br><br><br><br><br><br>
		<h2>
    		<span>By.GeunT Welcome</span>
    	</h2>
        	<div id="underline"></div>	
		<h3>회원정보 수정</h3><br>
</div>

<div class="information">
	<p class="thumbnail">
	<img src="//img.echosting.cafe24.com/skin/base_ko_KR/member/img_member_default.gif">
	</p>
	<div class="description">
		<p style="font-size: 15px;">저희 쇼핑몰을 이용해 주셔서 감사합니다.
		<strong  style="color: #DBA901">${memberDTO.name}</strong> 님은
		<strong></strong> 회원이십니다.</p>
	</div>
</div><br><br><br>
	<form id="modifyForm">
	
		<input type="hidden" id="email1" value="${memberDTO.email1}">
 		<input type="hidden" id="textemail" value="${memberDTO.textemail}">  
  		<input type="hidden" id="tel1" value="${memberDTO.tel1}">  		
		<input type="hidden" id="checkPwd" value=""/>  


        <table class="modifyinfo" style="border:1px solid #d7d5d5;width:100%;border-spacing:0px;">
			<caption>회원 기본정보</caption>
        <colgroup>
		<tr>
			<th scope="row">아이디 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"></th>
                <td>
                    <input id="id" name="id" readonly="readonly" value="${memberDTO.id }" type="text">(영문소문자/숫자, 4~16자)
                </td>
        </tr>
		<tr>
			<th scope="row">비밀번호 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"></th>
                <td>
                	<input id="pwd" name="pwd" autocomplete="off" maxlength="16" value="${memberDTO.pwd}" type="password" readonly="readonly"> (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)
                </td>
            </tr>
		<tr class="">
			<th scope="row">비밀번호 확인 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"></th>
                <td>
                	<input id="repwd" name="repwd"  value="" type="password"><span id="pwConfirmMsg"></span>
				</td>
        </tr>
		<tr>
			<th scope="row">새 비밀번호</th>
                <td>
                	<input id="new_passwd" name="new_passwd"  maxlength="16"  value="" type="password"> (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)
                </td>
            </tr>
		<tr>
			<th scope="row">새 비밀번호 확인</th>
                <td>
                	<input id="new_passwd_confirm" name="new_passwd_confirm" maxlength="16" value="" type="password"> <span id="new_pwConfirmMsg"></span>
				</td>
            </tr>
		<tr style="display:">
			<th scope="row" id="">이름 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"></th>
                <td>
                	<input id="name" name="name" class="ec-member-name" placeholder="" maxlength="30" readonly="readonly" value="장근택" type="text">
                </td>
        </tr>
		<tr>
		<th><strong>우편번호  <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"/></strong></th>
			<td>
				<input class="postdesign" type="text" id="sample2_postcode" name="sample2_postcode" placeholder="&nbsp;우편번호"style="vertical-align: middle;">
				<input type="button" onclick="sample2_execDaumPostcode()" style="cursor: pointer;vertical-align: middle;height: 20px;color: white;background-color:#3C5A91;font-size: 10px;" value="우편번호 찾기"><br>
				<input class="postdesign" type="text" id="sample2_address" name="sample2_address" placeholder="&nbsp;주소" size="46"><br>
				<input class="postdesign" type="text" id="sample2_detailAddress" name="sample2_detailAddress" placeholder="&nbsp;상세주소">
				<input class="postdesign" type="text" id="sample2_extraAddress" name="sample2_extraAddress" placeholder="&nbsp;참고항목">		
<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
				<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
				<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
				</div>
			</td>
		</tr>
		<tr class="">
			<th scope="row">휴대전화 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" class="" alt="필수"></th>
                <td>
                	<select id="mobile1" name="mobile[]">
						<option value="010">010</option>
						<option value="011">011</option>
					</select>-<input id="mobile2" name="mobile[]" maxlength="4" value="" type="text">-<input id="mobile3" name="mobile[]" maxlength="4" value="" type="text">
				</td>
        </tr>
		<tr> 	
			<th><strong>이메일 주소  <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"/></strong></th>
			<td><input type="text" name="email1" id="email1" data-toggle="tooltip" data-placement="bottom" placeholder="&nbsp;이메일 주소" style="vertical-align: middle;"> @ 
			<input type="text" name="textemail" id="textemail" data-toggle="tooltip" data-placement="bottom" placeholder="&nbsp;이메일을 선택하세요." style="vertical-align: middle;"> 
	 				<select id="select" style="height: 22px;vertical-align: middle;">
	            		<option value="" disabled selected>E-Mail 선택</option>
	            		<option value="naver.com" id="naver.com">naver.com</option>
	            		<option value="gmail.com" id="gmail.com">gmail.com</option>
	            		<option value="daum.net" id="daum.net">daum.net</option>
	            		<option value="directly" id="textEmail">직접 입력하기</option>
	        		</select>&emsp;	
	        		<a id="goConfirm" style="vertical-align: middle;cursor: pointer;">
	        	<i id="Confirm" style="color: #FF9100;" class="fas fa-exclamation-triangle">인증</i></a>
        	<div id="confirmDiv">
			<div> 
				<input type="text" id="confirmNum" name="confirmNum" placeholder="인증번호 입력"/>
			</div>
			<div> 
				<button class="email_check" id="getConfirm" name="getConfirm" type="button">인증받기</button> 
				<button class="email_check" id="doConfirm" name="doConfirm" type="button">인증확인</button> 				      
				</div>	    
			</div>
	        </td>
		</tr>
</tbody>
</table><br>
		<div>	
			<div>
				<input type="button" value="회원정보수정" class="reviewBtn_write" id="modifyBtn" style="width:100px;">		
			</div>  
			<div>
				<input type="button" value="다시작성" class="reviewBtn_write" id="resetBtn">  				    									
			</div>
			<div>
				<input type="button" value="돌아가기" class="reviewBtn_write" id="returnBtn" >  				    									
			</div>			
		</div>	
</form><br><br><br>


<script type="text/javascript" src="/resources/custom/js/general/post.daum.js"></script>
<script type="text/javascript" src="/resources/custom/js/general/post.daum.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/custom/js/member/member.modify.js"></script>
