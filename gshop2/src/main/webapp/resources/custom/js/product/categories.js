$(document).ready(function(){
	var product_category_name = $('#product_category_name').val();
		$.ajax({
			type: 'get',
			url:'/product/getUserProductList.do',
			data:'product_category_name='+$('#product_category_name').val()+'&order='+$('#order').val(),
			dataType: 'json',
			success: function(data){
				$('#mainList').empty();
				$.each(data.productList, function(index, items){
					$('#mainList').append(items.productListHTML);
				});		
			}
		});	
});

