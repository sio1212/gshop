$(document).ready(function(){
	$.ajax({
		type: 'get',
		url : '/admin/user/getMemberList.do',
		dataType: 'json',
		success: function(data){
			$('#memberListTable tr:gt(0)').empty();
			$.each(data.memberList,function(index,items){
				var rank ='<font style="color:green;">일반</font>';
				var state ='<font>정상</font>';
				var button = '<input type="button" name="memberDetailBtn" class="info_btn" value="조회"/>'
				if(items.state=='0'){rank='<font>관리자</font>';}
				else if(items.state=='2'){rank='<font style="color:blue;">특별</font>';}
				else if(items.state=='3'){state='<font style="color:red;">삭제요청</font>';}
				
				$('<tr/>',{
				}).append($('<td/>',{
					style : 'border:1px solid #dfdfdf;font-weight:bold;',
					align : 'center',
					text : items.seq
				})).append($('<td/>',{
					style : 'border:1px solid #dfdfdf;font-weight:bold;',
					align : 'center',
					text : items.name
				})).append($('<td/>',{
					style : 'border:1px solid #dfdfdf;font-weight:bold;',
					align : 'center',
					text : items.id
				})).append($('<td/>',{
					style : 'border:1px solid #dfdfdf;font-weight:bold;',
					align : 'center',
					html : rank
				})).append($('<td/>',{
					style : 'border:1px solid #dfdfdf;font-weight:bold;',
					align : 'center',
					text: items.registerdate
				})).append($('<td/>',{
					style : 'border:1px solid #dfdfdf;font-weight:bold;',
					align : 'center',
					html: state
				})).append($('<td/>',{
					style : 'border:1px solid #dfdfdf;font-weight:bold;',
					align : 'center',
					html: button
				})).appendTo($('#memberListTable tbody'));			
			});
			$('input[name=memberDetailBtn]').on('click',function(){
				var targetId = $(this).parent().prev().prev().prev().prev().text();
				var viewPop = window.open('/admin/user/memberDetailView.do?id='+targetId,'회원조회','width=820,height=530,resizable=no');
			});
		}
	});
});


$('#giveBenefitAll').click(function(){
	var benefitGivePop = window.open('/admin/user/benefitGivingForm.do?target=all','회원 혜택 관리','width=565,height=530,resizable=no');
});

$('#giveNoticeAll').click(function(){
	var infoWritePop = window.open('/admin/user/infoWriteForm.do?target=all','회원 공지 발신','width=565,height=530,resizable=no');
});