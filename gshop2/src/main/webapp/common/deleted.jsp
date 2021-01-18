<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript"  src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var deletedItem = ${item};
	alert('정상적으로 삭제되었습니다.');
	
	if(deletedItem=='qa') window.location='/board/qa/qaList.do';
	else if(deletedItem=='review') window.location='/board/review/reviewList.do';
	else if(deletedItem=='member') window.location='/board/main/home.do';
	else if(deletedItem=='userAdmin') window.location='/admin/user/userManage.do';
	else if(deletedItem=='productAdmin') window.location='/admin/product/productManage.do';
	else if(deletedItem=='userCart') window.location='/trading/userCart.do';
	else window.location='/board/main/home.do';
});	
</script>