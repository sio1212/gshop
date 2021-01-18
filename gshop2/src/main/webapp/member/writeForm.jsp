<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="/resources/fontawesome5/css/all.css">

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	.join_main {
		text-align: center;
	}
	table {
		width: 100%;
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
	h3 {
		
		font-size: 15px;
	}
	.oe {
		text-align: right;
	}
	.btn_join {
	    text-align: center;
		width: 100px;
		padding: 5px;
		background-color: #1C1C1C;
		color: white;
		top:50%; 
    	left:50%;
    	border: none;
	}
	.btn_joins {
		text-align: center;
	}
	.joinTable input{
		border: 1px solid #d7d5d5;
	}
	.postdesign{
		margin: 2px;
	}	
	.email_check{
		color: white;
		background-color:#3C5A91;
		cursor: pointer;
		height: 20px;
		font-size: 10px;
		margin: 2px;
	}
	.sub{
		display: inline-block;
	    padding: 0 0 0 8px;
	    color: #2e2e2e;
	    font-size: 16px;
	    background: url(//img.echosting.cafe24.com/skin/base/layout/ico_heading.gif) 0 50% no-repeat;
		font-weight: bold;
	}
<!-- 
	 .agreeArea{
		margin: 0;
		padding: 20px;
		margin-left: auto;
		margin-right: auto;
		border: 5px solid #e8e8e8;
		color: #747474;
		line-height: 20px;
		border-width: 1px;
		border-color: #d7d5d5;
		background-color: #fbfafa;
		margin-top: -1px;
	 }
	.content{
		color: #747474;
		line-height: 20px;
		margin: 0;
		overflow: auto;
		height: 130px;
		padding: 20px;
		border: 1px solid #d5d5d5;
		background: #fff;
	}
	.agreeArea h3{
	    margin: 0 0 10px;
	    font-size: 12px;
	    color: #353535;
	}
	.content p{
	    padding: 0 0 10px;
	    display: block;
	    font-size: 12px;
	}
	.agreeArea .check{
		    padding: 7px 0 0 0;
	    color: #202020;
	    font-size: 12px;
	}
	.checkallbox{
		
		margin: 0;
		padding: 20px;
		margin-left: auto;
		margin-right: auto;
		border: 5px solid #e8e8e8;
		color: #404040;
		border-width: 1px;
		border-color: #d7d5d5;
		background-color: #fbfafa;
		position: relative;
		z-index: 2;
	}
	.ec-base-chk{
		font-size: 14px;
		color: #353535;
		line-height: 22px;
		display: inline-block;
		position: relative;
		margin: 0 8px 0 0;
		width: 22px;
		height: 22px;
		vertical-align: top;
		cursor: pointer;
	}
	.checkbox{
		font-size: 14px;
		color: #353535;
		line-height: 22px;
		cursor: pointer;
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background: url("//img.echosting.cafe24.com/skin/base/common/bg_join_check.png") no-repeat 0 0;
	}
	.checkallbox p{
		margin: 0;
		padding: 0;
		font-size: 14px;
		color: #353535;
		line-height: 22px;
	
	}

	input[type=radio] + label, input[type=checkbox] + label {
	    margin: 0 4px 0 2px;
	    display: inline-block; 
		cursor: pointer; 
	}

	.ec-base-chk input:checked + .checkbox {
	    background-position: -34px 0;
	}
	.agreeArea input{
		margin: 0;
		padding: 0;
		color: #353535;
		vertical-align: middle;
		width: 13px;
		height: 13px;
		border: 0;
	}
	.ec-base-chk{
		font-size: 14px;
		color: #353535;
		line-height: 22px;
		display: inline-block;
		position: relative;
		margin: 0 8px 0 0;
		width: 22px;
		height: 22px;
		vertical-align: top;
		cursor: pointer;
	}

	.ec-base-chk input {
		margin: 0;
		padding: 0;
		font-size: 100%;
		color: #353535;
		vertical-align: middle;
		border: 0;
		z-index: 1;
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		opacity: 0;
		cursor: pointer;
}

</style>
<form id="writeForm">
	<div class="join_main">
		<br><br><br><br><br><br>
		<h2>
    		<span>By.GeunT Welcome</span>
    	</h2>
        	<div id="underline"></div>	
		<h3 class="tt" style="letter-spacing: 2pt; font-size: 20px;">회원가입</h3>	<br>
	</div>
 	<h3 class="sub">기본 정보</h3>
 	<p class="oe"><img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"/>  필수입력사항</p>


<table style="border: 1px solid #d7d5d5; border-spacing: 0px;" class="joinTable">
	<tr>
		<th><strong>아이디  <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"/></strong></th>
		<td><input type="text" name="id" id="id" data-toggle="tooltip" data-placement="bottom" placeholder="&nbsp;아이디"> * (영/소문자 6~20자)
		<span id="writeResult" style="padding-left: 200px;"></span>
		</td>
	</tr>
	<tr>
		<th><strong>비밀번호  <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"/></strong></th>
		<td><input type="password" name="pwd" id="pwd" data-toggle="tooltip" data-placement="bottom" placeholder="&nbsp;비밀번호"> * (영문대소문자/숫자/특수문자 중 2가지 이상 조합, 8~16자)</td>
	</tr>
	<tr>
		<th><strong>비밀번호 확인  <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"/></strong></th>
		<td><input type="password" name="repwd" id="repwd" data-toggle="tooltip" data-placement="bottom" placeholder="&nbsp;비밀번호 확인"></td>
	</tr>
	<tr>
		<th><strong>이름  <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"/></strong></th>
		<td><input type="text" name="name" id="name" data-toggle="tooltip" data-placement="bottom" placeholder="&nbsp;이름"></td>
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
	        	<i id="Confirm" style="color: #FF9100;" class="fas fa-exclamation-triangle">인증 필수</i></a>
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
	<tr>
		<th><strong>휴대전화  <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"/></strong></th>
		<td>
 				<select name="tel1" id="tel1" style="width: 10">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="011">016</option>						
					<option value="019">019</option>
				</select>	
        		- <input type="text" id="tel2" name="tel2" data-toggle="tooltip" data-placement="bottom" value="" size="2">
        		- <input type="text" id="tel3" name="tel3" data-toggle="tooltip" data-placement="bottom" value="" size="2">
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
</table><br><br><br>
		<input type="hidden" id="checkId" value="">
		<input type="hidden" id="checkEmail" value="">	


<h3 class="sub">전체 동의</h3><br><br>
	<div class="checkallbox">
        <p><span class="ec-base-chk"><input type="checkbox" id="chkAll"><em class="checkbox"></em></span>
        <label for="sAgreeAllChecked"><strong>이용약관 및 개인정보수집 및 이용, 쇼핑정보 수신(선택)에 모두 동의합니다.</strong></label></p>
    </div>
	<div class="agreeArea">
        <h3>[필수] 이용약관 동의</h3>
        <div class="content">
            <div class="xans-element- xans-mall xans-mall-term ">
	<div class="agreeInner agreement">
		<p>제2조(정의)</p>
		<p>&nbsp;</p>①"몰" 이란 회사가 재화 또는 용역(이하 "재화등"이라 함)을 이용자에게 제공하기 위하여 컴퓨터등 정보통신설비를 이용하여 재화등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다. <br><br>②"이용자"란 "몰"에 접속하여 이 약관에 따라 "몰"이 제공하는 서비스를 받는 회원 및 비회원을 말합니다. <br><br>③ '회원'이라 함은 "몰"에 개인정보를 제공하여 회원등록을 한 자로서, "몰"의 정보를 지속적으로 제공받으며, "몰"이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다. <br><br>④ '비회원'이라 함은 회원에 가입하지 않고 "몰"이 제공하는 서비스를 이용하는 자를 말합니다. <br><br>
		<p>&nbsp;</p>
		<p>제3조 (약관등의 명시와 설명 및 개정) </p>
		<p>&nbsp;</p>① "몰"은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호·모사전송번호·전자우편주소, 사업자등록번호, 통신판매업신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다. <br><br>② "몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회·배송책임·환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다. <br><br>③ "몰"은 전자상거래등에서의소비자보호에관한법률, 약관의규제에관한법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진등에관한법률, 방문판매등에관한법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다. <br><br>④ "몰"이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "몰"은 개정전 내용과 개정후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. <br><br>⑤ "몰"이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간내에 "몰"에 송신하여 "몰"의 동의를 받은 경우에는 개정약관 조항이 적용됩니다. <br><br>⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래등에서의소비자보호에관한법률, 약관의규제등에관한법률, 공정거래위원회가 정하는 전자상거래등에서의소비자보호지침 및 관계법령 또는 상관례에 따릅니다. <br><br>
		<p>&nbsp;</p>
		<p>제4조(서비스의 제공 및 변경) </p>
		<p>&nbsp;</p>① "몰"은 다음과 같은 업무를 수행합니다. 1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결 2. 구매계약이 체결된 재화 또는 용역의 배송 3. 기타 "몰"이 정하는 업무 <br><br>②"몰"은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다. <br><br>③"몰"이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다. <br><br>④전항의 경우 "몰"은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, "몰"이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다. <br><br>
		<p>&nbsp;</p>
		<p>제5조(서비스의 중단) </p>
		<p>&nbsp;</p>① "몰"은 컴퓨터 등 정보통신설비의 보수점검·교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다. <br><br>②"몰"은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, "몰"이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다. <br><br>③사업종목의 전환, 사업의 포기, 업체간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 "몰"은 제8조에 정한 방법으로 이용자에게 통지하고 당초 "몰"에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, "몰"이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 "몰"에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다. <br><br>
		<p>&nbsp;</p>
		<p>제6조(회원가입) </p>
		<p>&nbsp;</p>① 이용자는 "몰"이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다. <br><br>② "몰"은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당하지 않는 한 회원으로 등록합니다. 1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실후 3년이 경과한 자로서 "몰"의 회원재가입 승낙을 얻은 경우에는 예외로 한다. 2. 등록 내용에 허위, 기재누락, 오기가 있는 경우 3. 기타 회원으로 등록하는 것이 "몰"의 기술상 현저히 지장이 있다고 판단되는 경우 <br><br>③ 회원가입계약의 성립시기는 "몰"의 승낙이 회원에게 도달한 시점으로 합니다. <br><br>④ 회원은 제15조제1항에 의한 등록사항에 변경이 있는 경우, 즉시 전자우편 기타 방법으로 "몰"에 대하여 그 변경사항을 알려야 합니다. <br><br>
		<p>&nbsp;</p>
		<p>제7조(회원 탈퇴 및 자격 상실 등) </p>
		<p>&nbsp;</p>① 회원은 "몰"에 언제든지 탈퇴를 요청할 수 있으며 "몰"은 즉시 회원탈퇴를 처리합니다. <br><br>② 회원이 다음 각호의 사유에 해당하는 경우, "몰"은 회원자격을 제한 및 정지시킬 수 있습니다. 
		<p></p>
		<p>&nbsp;</p>
		<p>1. 가입 신청시에 허위 내용을 등록한 경우 </p>
		<p>2. "몰"을 이용하여 구입한 재화등의 대금, 기타 "몰"이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우 </p>
		<p>3. 다른 사람의 "몰" 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우 </p>
		<p>4. "몰"을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우 </p>
		<p>&nbsp;</p>
		<p>③ "몰"이 회원 자격을 제한·정지 시킨후, 동일한 행위가 2회이상 반복되거나 30일이내에 그 사유가 시정되지 아니하는 경우 "몰"은 회원자격을 상실시킬 수 있습니다. </p>
		<p>&nbsp;</p>
		<p>④ "몰"이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다. </p>
		<p>&nbsp;</p>
		<p>제8조(회원에 대한 통지) </p>
		<p>&nbsp;</p>
		<p>① "몰"이 회원에 대한 통지를 하는 경우, 회원이 "몰"과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다. </p>
		<p>&nbsp;</p>
		<p>② "몰"은 불특정다수 회원에 대한 통지의 경우 1주일이상 "몰" 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다. </p>
		<p>&nbsp;</p>
		<p>제9조(구매신청) "몰"이용자는 "몰"상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, "몰"은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. 단, 회원인 경우 제2호 내지 제4호의 적용을 제외할 수 있습니다. </p>
		<p>&nbsp;</p>
		<p>1. 재화등의 검색 및 선택 </p>
		<p>2. 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력 </p>
		<p>3. 약관내용, 청약철회권이 제한되는 서비스, 배송료·설치비 등의 비용부담과 관련한 내용에 대한 확인 </p>
		<p>4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭) </p>
		<p>5. 재화등의 구매신청 및 이에 관한 확인 또는 "몰"의 확인에 대한 동의 </p>
		<p>6. 결제방법의 선택 </p>
		<p>&nbsp;</p>
		<p>제10조 (계약의 성립) </p>
		<p>&nbsp;</p>
		<p>① "몰"은 제9조와 같은 구매신청에 대하여 다음 각호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다. </p>
		<p>1. 신청 내용에 허위, 기재누락, 오기가 있는 경우 </p>
		<p>2. 미성년자가 담배, 주류등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우 </p>
		<p>3. 기타 구매신청에 승낙하는 것이 "몰" 기술상 현저히 지장이 있다고 판단하는 경우 </p>
		<p>&nbsp;</p>
		<p>② "몰"의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다. </p>
		<p>&nbsp;</p>
		<p>③ "몰"의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소등에 관한 정보등을 포함하여야 합니다. 
		</p><p>&nbsp;</p>제11조(지급방법) "몰"에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각호의 방법중 가용한 방법으로 할 수 있습니다. 단, "몰"은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다. 
		<p></p>
		<p>&nbsp;</p>
		<p>1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체 </p>
		<p>2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제 </p>
		<p>3. 온라인무통장입금 </p>
		<p>4. 전자화폐에 의한 결제 </p>
		<p>5. 수령시 대금지급 </p>
		<p>6. 마일리지 등 "몰"이 지급한 포인트에 의한 결제 </p>
		<p>7. "몰"과 계약을 맺었거나 "몰"이 인정한 상품권에 의한 결제 </p>
		<p>8. 기타 전자적 지급 방법에 의한 대금 지급 등 </p>
		<p>&nbsp;</p>
		<p>제12조(수신확인통지·구매신청 변경 및 취소) </p>
		<p>&nbsp;</p>
		<p>① "몰"은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다. </p>
		<p>&nbsp;</p>
		<p>② 수신확인통지를 받은 이용자는 의사표시의 불일치등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 "몰"은 배송전에 이용자의 요청이 있는 경우에는 지체없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.</p>
		<p>&nbsp;</p>
		<p>제13조(재화등의 공급) </p>
		<p>&nbsp;</p>
		<p>① "몰"은 이용자와 재화등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, "몰"이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 2영업일 이내에 조치를 취합니다. 이때 "몰"은 이용자가 재화등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다. </p>
		<p>&nbsp;</p>
		<p>②"몰"은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 "몰"이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 "몰"이 고의·과실이 없음을 입증한 경우에는 그러하지 아니합니다. </p>
		<p>&nbsp;</p>
		<p>제14조(환급) </p>
		<p>&nbsp;</p>
		<p>"몰"은 이용자가 구매신청한 재화등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 2영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다. </p>
		<p>&nbsp;</p>
		<p>제15조(청약철회 등) </p>
		<p>&nbsp;</p>
		<p>①"몰"과 재화등의 구매에 관한 계약을 체결한 이용자는 수신확인의 통지를 받은 날부터 7일 이내에는 청약의 철회를 할 수 있습니다. </p>
		<p>&nbsp;</p>
		<p>② 이용자는 재화등을 배송받은 경우 다음 각호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다. </p>
		<p>&nbsp;</p>
		<p>1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다) </p>
		<p>2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우 </p>
		<p>3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우 </p>
		<p>4. 같은 성능을 지닌 재화등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우 </p>
		<p>&nbsp;</p>
		<p>③ 제2항제2호 내지 제4호의 경우에 "몰"이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회등이 제한되지 않습니다. </p>
		<p>&nbsp;</p>
		<p>④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화등의 내용이 표시 광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화등을 공급받은 날부터 3월이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다. </p>
		<p>&nbsp;</p>
		<p>제16조(청약철회 등의 효과) </p>
		<p>&nbsp;</p>
		<p>① "몰"은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화등의 대금을 환급합니다. 이 경우 "몰"이 이용자에게 재화등의 환급을 지연한 때에는 그 지연기간에 대하여 공정거래위원회가 정하여 고시하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다. </p>
		<p>&nbsp;</p>
		<p>② "몰"은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화등의 대금을 지급한 때에는 지체없이 당해 결제수단을 제공한 사업자로 하여금 재화등의 대금의 청구를 정지 또는 취소하도록 요청합니다. </p>
		<p>&nbsp;</p>
		<p>③ 청약철회등의 경우 공급받은 재화등의 반환에 필요한 비용은 이용자가 부담합니다. "몰"은 이용자에게 청약철회등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화등의 내용이 표시 광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회등을 하는 경우 재화등의 반환에 필요한 비용은 "몰"이 부담합니다. </p>
		<p>&nbsp;</p>
		<p>④ 이용자가 재화등을 제공받을때 발송비를 부담한 경우에 "몰"은 청약철회시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다. </p>
		<p>&nbsp;</p>
		<p>제17조(개인정보보호) </p>
		<p>&nbsp;</p>
		<p>①"몰"은 이용자의 정보수집시 구매계약 이행에 필요한 최소한의 정보를 수집합니다. 다음 사항을 필수사항으로 하며 그 외 사항은 선택사항으로 합니다. </p>
		<p>&nbsp;</p>
		<p>1. 성명 </p>
		<p>2. 주민등록번호(회원의 경우) 또는 외국인등록번호 </p>
		<p>3. 주소 </p>
		<p>4. 전화번호</p>
		<p>5. 희망ID(회원의 경우) </p>
		<p>6. 비밀번호(회원의 경우) </p>
		<p>7. 전자우편주소(또는 이동전화번호) </p>
		<p>&nbsp;</p>
		<p>② "몰"이 이용자의 개인식별이 가능한 개인정보를 수집하는 때에는 반드시 당해 이용자의 동의를 받습니다. </p>
		<p>&nbsp;</p>
		<p>③제공된 개인정보는 당해 이용자의 동의없이 목적외의 이용이나 제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 　몰　이 집니다. 다만, 다음의 경우에는 예외로 합니다. </p>
		<p>&nbsp;</p>
		<p>1. 배송업무상 배송업체에게 배송에 필요한 최소한의 이용자의 정보(성명, 주소, 전화번호)를 알려주는 경우 </p>
		<p>2. 통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우 </p>
		<p>3. 재화등의 거래에 따른 대금정산을 위하여 필요한 경우 </p>
		<p>4. 도용방지를 위하여 본인확인에 필요한 경우 </p>
		<p>5. 법률의 규정 또는 법률에 의하여 필요한 불가피한 사유가 있는 경우 </p>
		<p>&nbsp;</p>
		<p>④"몰"이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 정보통신망이용촉진등에관한법률 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다. </p>
		<p>&nbsp;</p>
		<p>⑤이용자는 언제든지 "몰"이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 "몰"은 이에 대해 지체없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 "몰"은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다. </p>
		<p>&nbsp;</p>
		<p>⑥ "몰"은 개인정보 보호를 위하여 관리자를 한정하여 그 수를 최소화하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다. </p>
		<p>&nbsp;</p>
		<p>⑦ "몰" 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체없이 파기합니다. </p>
		<p>&nbsp;</p>
		<p>제18조("몰"의 의무) </p>
		<p>&nbsp;</p>
		<p>① "몰"은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화·용역을 제공하는데 최선을 다하여야 합니다. </p>
		<p>&nbsp;</p>
		<p>② "몰"은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다. </p>
		<p>&nbsp;</p>
		<p>③ "몰"이 상품이나 용역에 대하여 「표시·광고의공정화에관한법률」 제3조 소정의 부당한 표시·광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다. </p>
		<p>&nbsp;</p>
		<p>④ "몰"은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다. </p>
		<p>&nbsp;</p>
		<p>제19조(회원의 ID 및 비밀번호에 대한 의무) </p>
		<p>&nbsp;</p>
		<p>① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다. </p>
		<p>&nbsp;</p>
		<p>② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다. </p>
		<p>&nbsp;</p>
		<p>③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 "몰"에 통보하고 "몰"의 안내가 있는 경우에는 그에 따라야 합니다. </p>
		<p>&nbsp;</p>
		<p>제20조(이용자의 의무) </p>
		<p>&nbsp;</p>
		<p>이용자는 다음 행위를 하여서는 안됩니다. </p>
		<p>&nbsp;</p>
		<p>1. 신청 또는 변경시 허위 내용의 등록 </p>
		<p>2. 타인의 정보 도용 </p>
		<p>3. "몰"에 게시된 정보의 변경 </p>
		<p>4. "몰"이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시 </p>
		<p>5. "몰" 기타 제3자의 저작권 등 지적재산권에 대한 침해 </p>
		<p>6. "몰" 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위 </p>
		<p>7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위 </p>
		<p>&nbsp;</p>
		<p>제21조(연결"몰"과 피연결"몰" 간의 관계) </p>
		<p>&nbsp;</p>
		<p>① 상위 "몰"과 하위 "몰"이 하이퍼 링크(예: 하이퍼 링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 "몰"(웹 사이트)이라고 하고 후자를 피연결 "몰"(웹사이트)이라고 합니다. </p>
		<p>&nbsp;</p>
		<p>②연결"몰"은 피연결"몰"이 독자적으로 제공하는 재화등에 의하여 이용자와 행하는 거래에 대해서 보증책임을 지지 않는다는 뜻을 연결"몰"의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증책임을 지지 않습니다. </p>
		<p>&nbsp;</p>
		<p>제22조(저작권의 귀속 및 이용제한) </p>
		<p>&nbsp;</p>
		<p>① "몰"이 작성한 저작물에 대한 저작권 기타 지적재산권은 "몰"에 귀속합니다. </p>
		<p>&nbsp;</p>
		<p>② 이용자는 "몰"을 이용함으로써 얻은 정보 중 "몰"에게 지적재산권이 귀속된 정보를 "몰"의 사전 승낙없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다. </p>
		<p>&nbsp;</p>
		<p>③ "몰"은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다. </p>
		<p>&nbsp;</p>
		<p>제23조(분쟁해결) </p>
		<p>&nbsp;</p>
		<p>① "몰"은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치·운영합니다. </p>
		<p>&nbsp;</p>
		<p>② "몰"은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다. </p>
		<p>&nbsp;</p>
		<p>③"몰"과 이용자간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시 도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다. </p>
		<p>&nbsp;</p>
		<p>제24조(재판권 및 준거법) </p>
		<p>&nbsp;</p>
		<p>①"몰"과 이용자간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다. </p>
		<p>&nbsp;</p>
		<p>②"몰"과 이용자간에 제기된 전자상거래 소송에는 한국법을 적용합니다.</p>부 칙(시행일) 이 약관은 년 월 일부터 시행합니다. </div><div class="agreeInner agreement"><br></div><div class="agreeInner agreement"><br></div><div class="agreeInner agreement"><div class="xans-element- xans-mall xans-mall-term "><div class="agreeInner agreement">#카카오 알림톡 시행에관한 내용</div><div class="agreeInner agreement">"바이흰티 쇼핑몰"은 회원가입.주문안내.배송안내 등 비광고성 정보를 카카오톡 알림톡으로 알려드리며,만약 알림톡 수신이 불가능하거나 수신 차단하신 경우에는 일반 문자 메시지로 보내드립니다. 카카오 알림톡을 통해 안내되는 정보를 와이파이가 아닌 이동통신망으로 이용할경우, 알림톡 수신중 데이터 요금이 발생할 수 있습니다. 카카오톡을 통해 발송되는 알림톡 수신을 원치 않으실 경우 반드시 알림톡을 차단하여 주시기 바랍니다. </div><div class="agreeInner agreement"><br></div><div class="agreeInner agreement"><p style="margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);"><font color="#333333" face="Arial, sans-serif"><span style="font-size: 14px;"><br></span></font></p><p style="margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);"><font color="#333333" face="Arial, sans-serif"><span style="font-size: 14px;">#카카오톡 알림톡 시행에 관한 내용</span></font></p><p style="margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);"><font color="#333333" face="Arial, sans-serif"><span style="font-size: 14px;"><br></span></font></p><p style="margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);"><font color="#333333" face="Arial, sans-serif"><span style="font-size: 14px;">“ㄷ는 회원가입, 주문안내, 배송안내 등 비광고성 정보를 카카오톡 알림톡으로 알려드리며, 만약 알림톡 수신이 불가능하거나 수신 차단하신 경우에는 일반 문자메시지로 보내드립니다. 카카오톡 알림톡을 통해 안내되는 정보를 와이파이가 아닌 이동통신망으로 이용할 경우, 알림톡 수신 중 데이터 요금이 발생할 수 있습니다. 카카오톡을 통해 발송되는 알림톡 수신을 원치 않으실 경우 반드시 알림톡을 차단하여 주시기 바랍니다.</span></font></p><p style="margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);"><font color="#333333" face="Arial, sans-serif"><span style="font-size: 14px;"><br></span></font></p><p style="margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);"><font color="#333333" face="Arial, sans-serif"><span style="font-size: 14px;">&nbsp;</span></font></p><p style="margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);"><font color="#333333" face="Arial, sans-serif"><span style="font-size: 14px;"><br></span></font></p><p style="margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);"><font color="#333333" face="Arial, sans-serif"><span style="font-size: 14px;">#카카오톡 상담톡 시행에 관한 내용</span></font></p><p style="margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);"><font color="#333333" face="Arial, sans-serif"><span style="font-size: 14px;"><br></span></font></p><p style="margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);"><font color="#333333" face="Arial, sans-serif"><span style="font-size: 14px;">바이흰티는 상담업무를 카카오톡 상담톡으로 진행하며, 만약 카카오톡을 통해 안내되는 상담 내용을 Wi-Fi 나 PC가 아닌 이동통신망으로 이용할 경우, 데이터 요금이 발생할 수 있습니다. 카카오톡을 통해 상담을 원치 않으실 경우 고객센터, 게시판 문의를 이용해 주시기 바랍니다.</span></font></p><p style="margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);"><font color="#333333" face="Arial, sans-serif"><span style="font-size: 14px;"><br></span></font></p><p style="margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);"><font color="#333333" face="Arial, sans-serif"><span style="font-size: 14px;">&nbsp;</span></font></p><p style="margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);"><font color="#333333" face="Arial, sans-serif"><span style="font-size: 14px;"><br></span></font></p><p style="margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);"><font color="#333333" face="Arial, sans-serif"><span style="font-size: 14px;">&nbsp;</span></font></p><p style="margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);"><font color="#333333" face="Arial, sans-serif"><span style="font-size: 14px;"><br></span></font></p><p style="margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);"><font color="#333333" face="Arial, sans-serif"><span style="font-size: 14px;">- 개인정보처리방침</span></font></p><p style="margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);"><font color="#333333" face="Arial, sans-serif"><span style="font-size: 14px;"><br></span></font></p><p style="margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);"><font color="#333333" face="Arial, sans-serif"><span style="font-size: 14px;">#개인정보의 위탁 처리</span></font></p><p style="margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);"><font color="#333333" face="Arial, sans-serif"><span style="font-size: 14px;"><br></span></font></p><p style="margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);"><font color="#333333" face="Arial, sans-serif"><span style="font-size: 14px;">바이흰티는 서비스 향상을 위해 관계법령에 따라 회원의 동의를 얻거나 관련 사항을 공개 또는 고지 후 회원의 개인정보를 외부에 위탁하여 처리하고 있습니다. 바이흰티는 개인정보처리 수탁자와 그 업무의 내용은 다음과 같습니다.</span></font></p><p style="margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);"><font color="#333333" face="Arial, sans-serif"><span style="font-size: 14px;"><br></span></font></p><p style="margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);"><font color="#333333" face="Arial, sans-serif"><span style="font-size: 14px;">&nbsp;</span></font></p><p style="margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);"><font color="#333333" face="Arial, sans-serif"><span style="font-size: 14px;"><br></span></font></p><p style="margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);"><font color="#333333" face="Arial, sans-serif"><span style="font-size: 14px;">- 수탁자 : (주)루나소프트</span></font></p><p style="margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);"><font color="#333333" face="Arial, sans-serif"><span style="font-size: 14px;"><br></span></font></p><p style="margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);"><font color="#333333" face="Arial, sans-serif"><span style="font-size: 14px;">- 위탁 업무 내용 : 카카오톡 알림톡(정보성 메시지) 발송 업무 및 톡 기반 상담 서비스 제공</span></font></p><p style="margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);"><font color="#333333" face="Arial, sans-serif"><span style="font-size: 14px;"><br></span></font></p><p style="margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);"><font color="#333333" face="Arial, sans-serif"><span style="font-size: 14px;">- 수집항목 : 휴대폰번호, 주문정보, 배송정보</span></font></p><p style="margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);"><font color="#333333" face="Arial, sans-serif"><span style="font-size: 14px;"><br></span></font></p><p style="margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);"><font color="#333333" face="Arial, sans-serif"><span style="font-size: 14px;">- 보유기간 : 회원 탈퇴 시 혹은 법정 보유기간</span></font></p></div></div></div><div class="agreeInner agreement"><br></div></div>			        </div>
        <p class="check"><span>이용약관에 동의하십니까?</span> <input id="chk1" name="agree_service_check[]"
         value="1" type="checkbox"><label for="agree_service_check0">동의함</label></p>
	</div>
<div class="agreeArea">		

        <h3>[필수] 개인정보 수집 및 이용 동의</h3>
        <div class="content">
            <p>■ 수집하는 개인정보 항목</p><p>회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.</p><p><br>ο 수집항목 : 이름 , 생년월일 , 성별 , 비밀번호 , 비밀번호 질문과 답변 , 자택 전화번호 , 자택 주소 , 휴대전화번호 , 이메일기념일 , 법정대리인정보 ,&nbsp; 신용카드 정보 , 은행계좌 정보 , 서비스 이용기록 , 접속 로그 , 쿠키 , 접속 IP 정보 , 결제기록<br>ο 개인정보 수집방법 : 서면양식 , 전화/팩스를 통한 회원가입 , 경품 행사 응모 , 배송 요청 , 제휴사로부터의 제공 , 생성정보 수집 툴을 통한 수집</p><p>&nbsp;</p><p>■ 개인정보의 수집 및 이용목적</p><p>회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.</p><p>&nbsp;ο 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산<br>콘텐츠 제공 , 물품배송 또는 청구지 등 발송<br>&nbsp;ο 회원 관리<br>회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인 , 불만처리 등 민원처리 , 고지사항 전달<br>&nbsp;ο 마케팅 및 광고에 활용<br>이벤트 등 광고성 정보 전달</p><p>&nbsp;</p><p>■ 개인정보의 보유 및 이용기간</p><p>원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.</p><p>&nbsp;보존 항목 : 이름 , 생년월일 , 성별 , 자택 전화번호 , 자택 주소 , 휴대전화번호 , 이메일<br>&nbsp;보존 근거 : 전자상거래등에서의 소비자보호에 관한 법률 , 신용정보의 이용 및 보호에 관한 법률<br>&nbsp;보존 기간 : 1개월</p><p>표시/광고에 관한 기록 : 6개월 (전자상거래등에서의 소비자보호에 관한 법률)<br>계약 또는 청약철회 등에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률)<br>대금결제 및 재화 등의 공급에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률)<br>소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 (전자상거래등에서의 소비자보호에 관한 법률)<br>신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년 (신용정보의 이용 및 보호에 관한 법률)</p><p><br></p><p><br></p><p><br></p><div>#개인정보의 위탁처리</div><div>바이흰티(에이피프틴) 쇼핑몰은 서비스 향상을 위해 관계법령에 따라 회원님들의 동의를 얻거나 관련 사항을 공개 또는 고지후 회원의 개인정보를 외부에 위탁하여 처리하고 있습니다.</div><div>바이흰티(에이피프틴) 쇼핑몰의 개인정보처리 수탁자의 그업무의 내용은 다음과 같습니다</div><div><br></div><div>-수탁자:(주)루나소프트</div><div>-위탁업무 내용: 카카오 알림톡 발송 업무</div><div><br></div><div>&nbsp;-보존기간:5년<div>*소비자 불만 또는 분쟁처리에 관한기록</div><div>-보존기간: 3년</div><div>*로그 기록</div><div>-보존이유: 통신비밀보호범</div><div>-보존기간: 3개월</div></div><div><br></div>						        </div>
        <p class="check"><span>개인정보 수집 및 이용에 동의하십니까?</span> <input id="chk2" name="agree_privacy_check[]" value="1" type="checkbox"><label for="agree_privacy_check0">동의함</label></p>
    </div>


		<br><br><br>
	<div class="btn_joins">
  <button type="button" id="writeBtn" class="btn_join">회원 가입</button>		
	</div>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<script type="text/javascript" src="/resources/custom/js/member/member.join.js"></script>
<script type="text/javascript" src="/resources/bootstrap4/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="/resources/bootstrap4/js/bootstrap.js"></script>
<script type="text/javascript" src="/resources/bootstrap4/js/bootstrap.bundle.js"></script>


    
