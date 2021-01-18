function formatDate(date){
	if(date!=null&&date!=''){
		var today =  Date.parse(new Date());
		var targetDate = Date.parse(date);
		if(today>targetDate) return '[기한만료]';
		var year = date.split('-');
		if(year[0]=='9999') return '[무제한]';
		else return date.split('-').join('.');
	}
	else return '[미정]';
}

$(document).ready(function(){
	$.ajax({
		type : 'get',
		url : '/member/getCouponlist.do',
		dataType: 'json',
		success: function(data){
			$('#couponTable tr:gt(0)').empty();
			$.each(data.couponlist,function(index,items){
				var type ='[배송비]'; 
				if(items.coupon_type==1) type ='[정액]';
				else if(items.coupon_type=2) type='[정률]';

				if(items.personal_code==null||items.personal_code=='') {
					var personalCode = '[<font style="color:red">사용완료</font>]로 인하여 [<font style="color:red">말소</font>]되었습니다.';
					var avail = '[완료]';}
				else if(formatDate(items.coupon_duedate)=='[기한만료]'){
					var personalCode = '[<font style="color:red">기한만료</font>]로 인하여 [<font style="color:red">사용불가능</font>]합니다.';
					var avail = '[만료]';}
				else {
					var personalCode = '[<font style="color:green">'+items.personal_code+'</font>]입니다.';
					var avail = '[가능]'; 
				}
				$('<tr/>',{
				}).append($('<td/>',{
					align: 'center',
					style : 'border:1px solid #dfdfdf;font-weight:bold;'
				}).append($('<a/>',{
					href : '#',
					style : 'border:1px solid #dfdfdf;font-weight:bold;',
					id : 'detail'+items.coupon_no,
					text : items.coupon_no				
				}))).append($('<td/>',{
					align: 'center',
					style : 'border:1px solid #dfdfdf;font-weight:bold;',
					text : items.coupon_name				
				})).append($('<td/>',{
					align: 'center',
					style : 'border:1px solid #dfdfdf;font-weight:bold;',
					text : type						
				})).append($('<td/>',{
					align: 'center',
					style : 'border:1px solid #dfdfdf;font-weight:bold;',
					text : items.discount_mount		
				})).append($('<td/>',{
					align: 'center',
					style : 'border:1px solid #dfdfdf;font-weight:bold;',
					text : 	formatDate(items.coupon_duedate)					
				})).append($('<td/>',{
					align: 'center',
					style : 'border:1px solid #dfdfdf;font-weight:bold;',
					text : avail					
				})).appendTo($('#couponTable tbody'));
				
				
				$('#detail'+items.coupon_no).on('click',function(){
					var coupon_no = $(this).text();
					$('#detailInfo').html('<h5 align="center">쿠폰 번호 [<font style="color:blue">'+coupon_no+'</font>]의 발급번호는 '+personalCode+'</h5>');
				});			
				
			});
			

		}
	});
	
});

$('#returnBtn').click(function(){
	window.history.back();
});