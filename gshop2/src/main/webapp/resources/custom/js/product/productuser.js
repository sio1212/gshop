function getProductList(data){
	$('#productTable tr:gt(0)').empty();
	
	$.each(data.productList, function(index, items){
		$('<tr/>').append($('<a/>',{
			align: 'center',
			id : 'checkA',
			}).prepend($('<i/>',{
		}))).append($('<td/>',{
			align: 'center'
		}).append($('<img/>',{
			src: '/storage/showProduct.do?product_name_image='+items.product_name_image,
			width: '70%',
			height: '80%',
			id : 'imageA'
		}))).append($('<td/>',{
			align : 'center',
			html : items.productName							
		})).appendTo($('#productTable tbody'));
	});
	
	$('#productPagingDiv').html(data.productPaging.pagingHTML);
	
}

$(document).ready(function(){
	$.ajax({
		type : 'post',
		url : '/product/userproductList.do',
		dataType : 'json',
		success : function(data){
			getProductList(data);
		}
	});
	
});
