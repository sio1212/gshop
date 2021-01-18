<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<!-- 좌측 메뉴바 -->
<c:if test="${adminDTO == null}">

<h1>
	<a href="http://localhost:8080/main/home.do">By.GeunT</a>
</h1>
<div class="topLog">
	<c:if test="${memberDTO.id != null }">
	<strong style="color: #DBA901">${memberDTO.name}</strong> 님 Welcome<br><br>
	</c:if>
	<c:if test="${memberDTO.id == null }">
	<a href="/member/loginForm.do" class="">LOGIN</a> |
	</c:if>
	<c:if test="${memberDTO.id != null }">
	<a href="/member/logout.do" class="">LOGOUT</a> |
	</c:if>
	<c:if test="${memberDTO.id == null }">
	 <a href="/member/writeForm.do" class="">JOIN</a>
	|
	</c:if>
	 <br>
	<br> <a href="" class="">ORDER</a> | <a href="/member/memberView.do" class="">MYPAGE</a>
	| <br>
	<br>
	<br>
	<br>
</div>
<div class="topMenu">
	<ul>
		<li class="record"><a href="/product/eventProductList.do?condition=onSale">SPECIAL</a></li>
		<br>
		<li class="record"><a href="/product/categories.do?product_category_name=COAT&order=new">COAT</a></li>
		<br>
		<li class="record"><a href="/product/categories.do?product_category_name=SUIT&order=new">SUIT</a></li>
		<br>
		<li class="record"><a href="/product/categories.do?product_category_name=OUTER&order=new">OUTER</a></li>
		<br>
		<li class="record"><a href="/product/categories.do?product_category_name=TEE&order=new">TEE</a></li>
		<br>
		<li class="record"><a href="/product/categories.do?product_category_name=SHIRT&order=new">SHIRT</a></li>
		<br>
		<li class="record"><a href="/product/categories.do?product_category_name=BOTTOM&order=new">BOTTOM</a></li>
		<br>
		<li class="record"><a href="/product/categories.do?product_category_name=SHOES&order=new">SHOES</a></li>
		<br>
		<li class="record"><a href="/product/categories.do?product_category_name=ACC&order=new">ACC</a></li>
		<br>
		<li class="record"><a href="#">AWESOME 80%</a><br></li>
		<br>
		<li class="record"><a href="#">1+1 50%</a></li>
		<br>
		<br>
		<br>
		<br>
	</ul>
</div>
<div class="boardinfo">
	<ul>
		<li class="record"><a href="#">NOTICE</a></li>
		<br>
		<li class="record"><a href="/board/qa/qaList.do" >Q & A</a>
		</li>
		<br>
		<li class="record"><a href="#">NOTICE</a></li>
		<br>
		<li class="record"><a href="/board/review/reviewList.do">REVIEW</a></li>
		<br>
		<li class="record"><a href="#">MEMBERSHIP</a></li>
		<br>
	</ul>
</div>
</c:if>
<c:if test="${adminDTO != null}">
	<jsp:include page="/main/adminHeader.jsp" />
</c:if>	

<script type="text/javascript" src="/resources/custom/js/product/categories.js"></script>

