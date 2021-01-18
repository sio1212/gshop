<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="/resources/fontawesome5/css/all.css">

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
	.find_id, .find_pw{
		margin-top: 25px;
		border: 1px solid;
		background-color: white;
		width: 150px;
		font-size: 10px;
		cursor: pointer;
	}
	.shopMain_wishlist{
		color: #353535;
		margin: 0;
		height: 90px;
		padding: 27px 0 0 30px;
		border-bottom: 1px solid #e9e9e9;
		background: url("//img.echosting.cafe24.com/skin/base/myshop/bg_myshop1.gif") no-repeat 100% 0;
		background-image: url("//img.echosting.cafe24.com/skin/base/myshop/bg_myshop3.gif");
	}
	.shopMain_coupon{
		color: #353535;
		margin: 0;
		height: 90px;
		padding: 27px 0 0 30px;
		border-bottom: 1px solid #e9e9e9;
		background: url("//img.echosting.cafe24.com/skin/base/myshop/bg_myshop1.gif") no-repeat 100% 0;
		background-image: url("//img.echosting.cafe24.com/skin/base/myshop/bg_myshop6.gif");
	}
	.shopMain_profile{
		color: #353535;
		margin: 0;
		height: 90px;
		padding: 27px 0 0 30px;
		border-bottom: 1px solid #e9e9e9;
		background: url("//img.echosting.cafe24.com/skin/base/myshop/bg_myshop1.gif") no-repeat 100% 0;
		background-image: url("//img.echosting.cafe24.com/skin/base/myshop/bg_myshop2.gif");
	}
	.shopMain_order{
		color: #353535;
		margin: 0;
		height: 90px;
		padding: 27px 0 0 30px;
		border-bottom: 1px solid #e9e9e9;
		background: url("//img.echosting.cafe24.com/skin/base/myshop/bg_myshop1.gif") no-repeat 100% 0;
		background-image: url("//img.echosting.cafe24.com/skin/base/myshop/bg_myshop1.gif");
	}
	.fontb{
		font-size: 12px;
    	line-height: 18px;
    	color: #8f8f8f;
	}
	.fonta{
	    font-size: 18px;
    	padding: 0 8px 0 0;
	}
	.myinfo{
		margin: 0;
		margin-left: auto;
		margin-right: auto;
		border: 5px solid #e8e8e8;
		color: #404040;
		padding: 0;
		border-width: 1px;
		border-color: #d7d5d5;
	}
	.information{
		color: #404040;
		margin: 0;
		display: table;
		table-layout: fixed;
		padding: 10px 0;
		width: 100%;
		box-sizing: border-box;
	}
	.thumbnail{
		color: #404040;
		margin: 0;
		display: table-cell;
		padding: 0 15px;
		width: 70px;
		text-align: center;
		vertical-align: middle;
	}
	.descriptions{
		color: #404040;
		margin-left: 1px;
		min-height: 70px;
		display: table-cell;
		padding-left: 2px;
		width: auto;
		line-height: 1.5em;
		border-left: 1px solid #e8e8e8;
		vertical-align: middle;
		text-align: left;
	}
	.descriptions_1{
		color: #404040;
		line-height: 1.5em;
		margin: 0;
		padding: 0;
	}
</style>
<div class="join_main">
		<br><br><br><br><br><br>
		<h2>
    		<span>By.GeunT Welcome</span>
    	</h2>
        	<div id="underline"></div>	
		<h3 style="letter-spacing: 2pt;">MY PAGE</h3><br>
		
		<div class="myinfo">
        <div class="information">
            <p class="thumbnail"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/member/img_member_default.gif" alt="" onerror="this.src='//img.echosting.cafe24.com/skin/base/member/img_member_default.gif';"></p>
          	  <div class="descriptions">
                <span>저희 쇼핑몰을 이용해 주셔서 감사합니다. <strong><span><span style="color: #DBA901;">${memberDTO.name}</span></span></strong> 님 <strong> 회원이십니다.</strong></span>
            	<p class="descriptions_1">
            	<span><strong style="color:#008bcc">100,000</strong> won 이상 구입시 <strong>배송비 무료</strong>로 이용 하실 수 있습니다.</span>
            	</p>
              </div>
        </div>
        </div>
		
	
		
</div>
	<hr class="sub-hr" noshade/>

	<div class="shopMain_order">
        <h3><a href="/member/memberOrderlist.do" ><strong class="fonta">order</strong>주문내역 조회</a></h3>
        <p><a href="/member/memberOrderlist.do" class="fontb">고객님께서 주문하신 상품의 주문내역을 확인하실 수 있습니다.<br>비회원의 경우, 주문서의 주문번호와 비밀번호로 주문조회가 가능합니다.</a></p>
    </div>		
    <div class="shopMain_wishlist">
        <h3><a href="/myshop/wish_list.html" ><strong class="fonta">wishlist</strong>관심 상품</a></h3>
        <p><a href="/myshop/wish_list.html" class="fontb">관심상품으로 등록하신 상품의 목록을 보여드립니다.</a></p>
    </div>	
	<div class="shopMain_profile">
        <h3><a href="/member/modifyForm.do" ><strong class="fonta">profile</strong>회원 정보</a></h3>
        <p><a href="/member/modifyForm.do" class="fontb">회원이신 고객님의 개인정보를 관리하는 공간입니다.<br>개인정보를 최신 정보로 유지하시면 보다 간편히 쇼핑을 즐기실 수 있습니다.</a></p>
    </div>
    <div class="shopMain_coupon" >
        <h3><a href="/member/memberCouponlist.do" ><strong class="fonta">coupon</strong>쿠폰</a></h3>
        <p><a href="/member/memberCouponlist.do" class="fontb">고객님이 보유하고 계신 쿠폰내역을 보여드립니다.</a></p>
    </div>
    <div class="shopMain_profile" >
        <h3><a href="/member/memberDelete.do" onclick="window.open(this.href,'','width=510, height=620, scrollbars=yes'); return false;"><strong class="fonta">withdrawal</strong>회원탈퇴</a></h3>
        <p><a href="/member/memberDelete.do" class="fontb">고객님께서 이용에 불편함을 느끼실 경우 회원 탈퇴.</a></p>
    </div>
		
	<!--JavaScript Local LINK:START-->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<!--JavaScript Local LINK:END-->