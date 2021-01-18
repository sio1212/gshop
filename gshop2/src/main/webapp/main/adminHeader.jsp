<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!-- 좌측 고정 -->
<style>
.admin_form {
	margin-left: 35px;
}
.nav-item {
	font-size: 15px;
	font-weight: bold;
}
</style>

<div class="scroll-view">

<h1>
	<a href="/member/adminLogin.do" >By.GeunT A.D.M.I.N</a>
</h1>
	<ul class="account_selection">
		<li><a id="goAdminLogout" href="../admin/adminLogout.do"><i class="fa fa-sign-out-alt" aria-hidden="true"></i>Sign Out</a></li>
		<li><a id="goAdminManage" href=""><i class="" aria-hidden="true"></i>Admin Info</a></li>																					
	</ul>
	<!-- 좌측 유동 -->
	<br><br><br><br><br>
						<nav class="admin_form">
							<ul class="admin_nav">
								<li class="nav-item">
									<a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;메 인</a><br><br>
								</li>
								<li class="nav-item">
									<a href="">&nbsp;&nbsp;상점관리</a><br><br>	
								</li>								
								<li class="nav-item">
							        <a href="/admin/product/inventoryManage.do">&nbsp;&nbsp;상품관리</a><br><br>														
								</li>
								<li class="nav-item">
									<a href="/admin/user/userManage.do">&nbsp;&nbsp;고객관리</a><br><br>
								</li>
								<li class="nav-item">
									<a href="/admin/order/orderManage.do">&nbsp;&nbsp;주문관리</a><br><br>
								</li>								
								<li class="nav-item">
									<a href="/admin/board/qaManage.do">문의글 관리</a><br><br>
								</li>
							</ul>
						</nav>
</div>
