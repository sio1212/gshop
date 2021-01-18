<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="">
	<div class="" id="titleDiv">
		<div class="">
			<h3>관리자 및 상점 정보 관리</h3>		
		</div>
	</div>  
	
	<div class="form-row justify-content-center">	
		<div class="form-group col" align="center" style="border-bottom:1px solid darkgrey;">
			<strong>MAIN INFO</strong>
		</div>
	</div>		 	

	<div class="form-row justify-content-center">	
		<div class="form-group col-4">
			<figure class="figure">
  				<img src="../image/42310777-admin.jpg" class="figure-img img-fluid rounded" alt="">
			</figure>	
		</div>
		<div class="form-group col-8">
			<div class="form-row justify-content-center" style="border-bottom:1px solid darkgrey;">
				<div class="" align="center"><strong>[ADMIN INFO]</strong></div>
			</div>
			<br>
			<div class="">
				<div class="">[접속 관리자 명]</div>
				<div class="">${memberDTO.name}</div>
			</div>
			<div class="">
				<div class="">[대표 이메일]</div>
				<div class="">${adminDTO.admin_email_addr}</div>
			</div>	
			<div class="">
				<div class="">[대표 번호]</div>
				<div class="">${adminDTO.admin_shop_tel}</div>
			</div>	
			<div class="">
				<div class="">[개설계좌]</div>
				<div class="">${adminDTO.admin_account}</div>
			</div>				
			<div class="">
				<div class="">[개설일자]</div>
				<div class="">
					<fmt:formatDate value="${adminDTO.admin_opendate}" pattern="yyyy년 MM월 dd일"/> 
				</div>
			</div>															
		</div>				
	</div>	
</div>			

	<!--JavaScript Local LINK:START-->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<!--JavaScript Local LINK:END-->