<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    	
    <c:if test="${location==''}">
	</c:if>	
    <!-- 모든것의 시작 -->
    <c:if test="${location!=''}">
		<div>
    		<c:if test="${location=='joinForm' }"></c:if>	
			<c:if test="${location=='loginForm' }">
				<script>
					function changeView(value){
						if(value=="0"){
							location.href="findForm.do";
						}						
					}	
				</script>
			</c:if>
			<c:if test="${location=='member' }">
		         <script>
			     </script>
			</c:if>
			<c:if test="${location=='homeAdmin' }">
			    <h2>빠른 조회</h2>
			     <div class="list-group list-group-lg">
			          <a href="/admin/shop/salesInfo.do" class="list-group-item">매출현황</a>
			          <a href="/admin/order/orderManage.do" class="list-group-item">고객주문 조회</a>			          
			          <a href="/admin/user/personalQAManager.do" class="list-group-item">1:1문의 조회</a>
			          <a href="/admin/board/qaManage.do" class="list-group-item">일반문의 조회</a>
			     </div>		
			</c:if>
			
			<!-- 관리자 페이지 -->
			
			<c:if test="${location=='productAdmin' }">
				 <div class="listpro">
				   <h2 class="productcustom">Product  Management</h2>	
					 <div class="list">
				     	<a href="/admin/product/inventoryManage.do" class="list_item">입점재고관리 |</a>	     
				        <a href="/admin/product/productManage.do" class="list_item">등록상품관리 |</a>
				        <a href="/admin/product/productUpload.do" class="list_item">상품등록 |</a>				          				     
 l				        <a href="javascript:history.back()" class="list_item">돌아가기</a>
				     </div>	
				 </div>
			</c:if>
			<c:if test="${location=='orderAdmin'}">
				<div class="listpro">
				   <h2 class="productcustom">Order Management</h2>	
				 </div>
			</c:if>		
			<c:if test="${location=='category' }">
			</c:if>
			
			<c:if test="${location=='userAdmin'}">
				 <div class="listpro">
		        	<h2 class="productcustom">User  Management</h2>			
			     		<div class="list">
					     	<a href="/admin/user/userManage.do" class="list_item">고객정보관리 |</a>	     
					        <a href="/admin/user/personalQAManager.do" class="list_item">1:1문의관리 |</a>			          				     
					        <a href="javascript:history.back()" class="list_item">돌아가기</a>
			     		</div>
			     </div>					
			</c:if>	
			<c:if test="${location=='board'}">
			</c:if>		
			<c:if test="${location=='adminQAList'}">
			 <div class="listpro">
		        	<h2 class="productcustom">User  Management</h2>			
			     </div>			
			</c:if>		
			<c:if test="${location=='adminQA'}">
				 <div class="listpro">
		        	<h2 class="productcustom">User  Management</h2>			
			     </div>			
			</c:if>			
			<c:if test="${location=='orderUser'}">
			</c:if>			
		</div> 
	</c:if>
    	