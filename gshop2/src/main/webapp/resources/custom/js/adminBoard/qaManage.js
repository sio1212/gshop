$(document).ready(function(){
	$.ajax({
		type : 'get',
		url : '/admin/board/getQaList.do',
		data : 'pg='+$('#pg').val(),
		dataType : 'json',
		success : function(data){
			
			$('#qaTable tr:gt(0)').empty();					
			$.each(data.qalist, function(index, items){
				var state = '<i class="fas fa-lock"></i>';
				var subject = '[비밀글로 작성된 문의글입니다]';
				var isreplied ='<i class="far fa-square"></i>';
				var productid ='[비공개]';
				if (items.qa_state=='0'){//공개글
					subject = items.qa_subject;
					state = '<a><i class="fas fa-lock-open"></i></a>';
					if(items.productid!=null){
						productid ='['+items.productid+']';}	
					else if(items.productid==null){productid = '[문의 상품 없음]';}
				}
				if(items.qa_reply=='1'){
					isreplied ='<a><i class="far fa-check-square"></i></a>';
				}
			
				$('<tr/>').append($('<th/>',{
					scope : 'row',
					style : 'border:1px solid #dfdfdf;font-weight:bold;',
					align : 'center',
					text : items.qa_seq
				})).append($('<td/>',{
						style : 'border:1px solid #dfdfdf;font-weight:bold;',
					}).append($('<a/>',{
						href : 'javascript:void(0)',
						id : 'subjectA',
						style : 'border:1px solid #dfdfdf;font-weight:bold;',
						text : subject,
						class : items.qa_seq+''
						}))).append($('<td/>',{
					align : 'center',
					style : 'border:1px solid #dfdfdf;font-weight:bold;',
					text : items.name,
				})).append($('<td/>',{
					align : 'center',
					style : 'border:1px solid #dfdfdf;font-weight:bold;',
					text : productid				
				})).append($('<td/>',{
					align : 'center',
					style : 'border:1px solid #dfdfdf;font-weight:bold;',
					text : items.qa_logtime					
				})).append($('<td/>',{
					align : 'center',
					style : 'border:1px solid #dfdfdf;font-weight:bold;',
					html : state			
				})).appendTo($('#qaTable tbody'));
			});//each
			
			$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
			
			$('#qaTable').on('click','#subjectA',function(){
				var qa_seq = $(this).parent().prev().text();
				window.location='/admin/board/qaManageView.do?qa_seq='+qa_seq+'&pg='+$('#pg').val();
			});
		}
	});
});

function boardPaging(pg){
	location.href='/admin/board/qaManage.do?pg='+pg;
}

