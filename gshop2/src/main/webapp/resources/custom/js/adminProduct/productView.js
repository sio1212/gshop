//0. 공통 변수
var unitcost= parseInt($('#unitcost').val(),10);	
var product_name_price = parseInt($('#product_name_price').val(),10);	

//1. 최초 시작시의 셋팅
$(document).ready(function(){
	if(product_name_price > unitcost) {
		$('#pridceDiff').attr('color','red');
	}
	else if(product_name_price < unitcost) {
		$('#pridceDiff').attr('color','blue');
	}else $('#pridceDiff').attr('color','black');

});

//2. 수정 버튼 클릭시 이동
$('#productModifyBtn').click(function(){
	window.location='/admin/product/productModifyForm.do?product_name_no='+$('#product_name_no').val();
});

//3. 삭제 버튼 클릭시의 삭제처리
$('#productDelete').click(function(){
		var result =confirm('해당 상품을 정말로 삭제하시겠습니까? 삭제시에는 재고관리 목록에서도 제거됩니다.');
		if(result){
			window.location='/admin/product/productDelete.do?product_name_no='+$('#product_name_no').val();}
});