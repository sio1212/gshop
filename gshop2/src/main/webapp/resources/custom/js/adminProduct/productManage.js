function getProductList(data){
	$('#productTable tr:gt(0)').empty();
	
	$.each(data.productList, function(index, items){
		var discountable = '[할인불가상품]';
		var isOnMall = '[미등재]';
		if(items.promotioncode==1){
			discountable = '[할인가능상품]';}
		if(items.product_onstore=='YES'){
			isOnMall = '[등재]';}	
		$('<tr/>').append($('<a/>',{
			align: 'center',
			id : 'checkA',
			}).prepend($('<i/>',{
				text : items.product_name_no,
				id : 'deleteA',
				class: 'fas fa-trash-alt'
		}))).append($('<td/>',{
			align: 'center'
		}).append($('<img/>',{
			src: '/storage/showProduct.do?product_name_image='+items.product_name_image,
			width: '100',
			height: '100',
			id : 'imageA'
		}))).append($('<td/>',{
			align : 'center',
			html : items.productID				
		})).append($('<td/>',{
			align : 'center',
			html : items.product_category_name				
		})).append($('<td/>',{
			align : 'center',
			html : items.productName				
		})).append($('<td/>',{
			align : 'center',
			html : discountable				
		})).append($('<td/>',{
			align : 'center',
			html : isOnMall,
			id : 'onMall'					
		})).appendTo($('#productTable tbody'));
	});
	
	$('#productPagingDiv').html(data.productPaging.pagingHTML);
	
	$('#productTable').on('click','#imageA',function(){
			var product_name_no = $(this).parent().prev().text();
			window.location='/admin/product/productView.do?product_name_no='+product_name_no+'&pg='+$('#pg').val();
	});
	

	$('#productTable').on('click','#checkA',function(){
			var result =confirm('해당 상품을 정말로 삭제하시겠습니까? 삭제시에는 재고관리 목록에서도 제거됩니다.');
			if(result){
				window.location='/admin/product/productDelete.do?product_name_no='+$(this).text();					
			}


	});
}

$(document).ready(function(){
	$.ajax({
		type : 'post',
		url : '/admin/product/productList.do',
		data : 'pg='+$('#pg').val(),
		dataType : 'json',
		success : function(data){
			getProductList(data);			
		}
	});
});

function productPaging(pg){
	location.href='/admin/product/productManage.do?pg='+pg;
}