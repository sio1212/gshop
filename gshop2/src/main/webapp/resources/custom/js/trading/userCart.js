//0.초기화
var cartTotal = 0;
var totalCost = '';
function formatNumber(num){
	return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g,'$1,');}

//1. 시작시에 session에서 장바구니 불러오기
$(document).ready(function(){
	$.ajax({
		type: 'get',
		url : '/trading/getCartList.do',
		dataType : 'json',
		success : function(data){
			
			// Object.keys 키가 담긴 배열을 반환
			var size = Object.keys(data.cartList).length;

			if(size>0){
			$('#product_cart tr:gt(0)').empty();					
			$.each(data.cartList, function(index, items){			
				var unitcost_format=formatNumber(items.unitcost);
				var totalCost=items.unitcost*items.cart_qty;
				cartTotal=cartTotal+totalCost;//합계 정산
				var totalCost_format=formatNumber(totalCost);
				$('<tr/>',{
					style : 'border:1px solid #dfdfdf'
				}).append($('<input/>',{
					class : 'form-check-input check',
					type : 'checkbox',
					style : 'border:1px solid #dfdfdf;margin-top : 35px;',
					name : 'check',
					value : items.product_name_no
				})).append($('<p/>',{	
					class: 'form-check-label',
					html : items.product_name_no	
				})).append($('<td/>',{
					align : 'center',
					style : 'border:1px solid #dfdfdf'
				}).append($('<a/>',{
					href : '/product/productView.do?product_name_no='+items.product_name_no
				}).append($('<img/>',{
					src : '/storage/showProduct.do?product_name_image='+items.product_name_image,
					style : 'width:80px;height:80px;'
				})))).append($('<td/>',{
					align : 'center',
					style : 'border:1px solid #dfdfdf',
					html : items.productName
				})).append($('<input/>',{
					type : 'hidden',
					value : items.unitcost
				})).append($('<td/>',{
					style : 'border:1px solid #dfdfdf',
					align : 'center',
					html : unitcost_format+'원'
				})).append($('<td/>',{
					style : 'border:1px solid #dfdfdf',
					align : 'right',
					//style : 'display:inline-block;padding:0;float:right;'
				}).append($('<input/>',{
					type : 'hidden',
					value : items.stock
				})).append($('<input/>',{
					type : 'hidden',
					value : items.cart_qty
				})).append($('<input/>',{
					type : 'number',
					value : items.cart_qty,
					id : 'changeQty',
					style : 'width:40px;height:30px;padding:0;border:1px solid #dfdfdf;vertical-align: middle;'
				})).append('<span>ea</span>&nbsp&nbsp').append($('<input/>',{
					type : 'button',
					class : 'btn btn-sm btn-info',
					style : 'background-color:#1C1C1C;color:white;cursor: pointer;vertical-align: middle;',
					value : '반영',
					id : 'modifyBtn'
				}))).append($('<td/>',{
					style : 'border:1px solid #dfdfdf',
					align : 'center',
					html : totalCost_format+'원'
				})).appendTo($('#product_cart tbody'));
			});

			$('#cartListForm').on('change','#changeQty',function(){
				var originalQty = $(this).prev().val();
				var newQty = $(this).val();
				var stock = $(this).prev().prev().val();
				var leftStock = stock-newQty;

				if(newQty<1){
					alert('최소 1개 이상으로 수량을 선택해주세요');
					$(this).val(1);
					return;
				}else if(newQty>99){
					alert('100개 이상은 주문하실 수 없습니다');
					$(this).val(originalQty);
					return;
				}else if(leftStock<0){
					alert('재고 이상은 주문하실 수 없습니다[현재 재고: '+stock+'(개)]');
					$(this).val(originalQty);
					return;					
				}
				var unicost = $(this).parent().prev().prev().val();
				var diff = (newQty-originalQty)*unicost;
				var newTotalcost = newQty*unicost;
				var newTotalcost_format = formatNumber(newTotalcost);
				
				$(this).parent().next().text(newTotalcost_format+'원');
				cartTotal=cartTotal+diff;
				totalCost = formatNumber(cartTotal);
				$('#totalDivs').text('총'+totalCost+' won');
				$('#totalDiv').text('총 '+totalCost+' won');
				$(this).prev().val(newQty); 
				
			});
			$('#cartListForm').on('click','#modifyBtn',function(){
				var cart_qty = $(this).prev().prev().val();
				var unicost = $(this).parent().prev().prev().val();
				var product_name_no = $(this).parent().prev().prev().prev().prev().prev().prev().val();
				var doModify = confirm('해당 재고의 수량을 확정적으로 반영하시겠습니까?');
				if(doModify){
					window.location='/trading/modifyCart.do?product_name_no='+product_name_no+'&changeNum='+cart_qty;
				}
			});
		}
			else{
				$('#cartListForm').append('<div class="form-row align-items-center"><div class="col" align="center"><strong style="color:red;font-size:20px;">장바구니에 담긴 상품이 없습니다.</strong></div></div>');		
			}
			totalCost = formatNumber(cartTotal);
			$('#totalDiv').text(''+totalCost+' won');
			$('#totalDivs').text(''+totalCost+' won');
		}
	});

	
});

//2. 장바구니 전체 선택, 해제
$('#checkAll').click(function(){
	
	if($('#checkAll').prop('checked')){
		$('.check').prop('checked', true);
	}else{
		$('.check').prop('checked', false);
	}
});

//3. 장바구니 선택 삭제
$('#choiceDelete').click(function(){
	if($('.check:checked').length==0) alert("항목을 선택해주세요");
	else{
		$('#cartListForm').submit();
	}//else
});
$('#goCategory').click(function(){
	window.location='/product/categories.do'
});

//4. 장바구니 선택 주문
$('#choiceOrder').click(function(){
	if($('.check:checked').length==0) alert("항목을 선택해주세요");
	else{
		if($('#memberID').val()=='') {
			var signUp = confirm('회원가입 시에는 더욱 풍부한 혜택을 얻으실 수 있습니다. 회원 가입하시겠습니까');
			if(signUp) {
				alert('회원 가입 화면으로 이동합니다');
				window.location='/member/writeForm.do';
			}
			else goOrderForm();
		} 
		else goOrderForm();
	}
});

function goOrderForm(){
	
	alert('주문 화면으로 이동합니다');
	
	var product_name_no = new Array();
	
	$(".check:checked").each(function(index, items) { 
		product_name_no[index] = $(this).val();  
	});

	$('input[name=product_name_no]').val(product_name_no);	
	$('#cartOrderForm').submit();
}