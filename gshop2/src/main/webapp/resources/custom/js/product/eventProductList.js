$(document).ready(function(){
		$.ajax({
			type: 'get',
			url:'/product/getSpecialProductList.do',
			data:'condition='+$('#condition').val(),
			dataType: 'json',
			success: function(data){
				$('#mainList2').empty();
				$.each(data.productList, function(index, items){
					$('#mainList2').append(items.productListHTML);
				});		
			}
		});	
});
