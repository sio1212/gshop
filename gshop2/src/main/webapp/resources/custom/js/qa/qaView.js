//1. 시작시에 관리자 답변 현황을 호출하는 이벤트
$(document).ready(function(){
	$('#pwdConfirm').hide();
	if($('#qa_reply').val()=='1'){
		$.ajax({
			type : 'post',
			url : '/board/qa/getQaAns.do',
			data : {'seq' : $('#qa_seq').val()},
			dataType : 'json',
			success : function(data){
				data.adminboardDTO.admin_content.replace(/(?:\r\n|\r|\n)/g, '<br>');
				$('#answer').html(data.adminboardDTO.admin_content);
			}
		});	
	}//if
});

//2. 수정버튼 클릭시 비밀번호 입력란을 보여주는 이벤트
$('#qaModifyFormBtn').click(function(){
	$('#alertText').val('해당글의 비밀번호를 입력하세요').css('color','red').css('font-size','8px').css('width','200px');	
	$('#pwdConfirm').show();
	$('#purpose').val('modify');

});

//3. 삭제버튼 클릭시 비밀번호 입력란을 보여주는 이벤트
$('#qaDeleteBtn').click(function(){
	$('#alertText').val('해당글의 비밀번호를 입력하세요').css('color','red').css('font-size','8px').css('width','200px');
	$('#pwdConfirm').show();
	$('#purpose').val('delete');
});

//4. 호출된 비밀번호 입력의 유효성을 검사하고 실행 여부를 판단하는 이벤트
$('#checkQaPwd').click(function(){
	if($('#rePwd').val()==''){
		$('#alertText').val('비밀번호는 필수입력사항입니다').css('color','red').css('font-size','8px').css('width','200px');
	}
	else if($('#rePwd').val()==$('#qa_pwd').val()){
		if($('#purpose').val()=='modify'){
			window.location='/board/qa/qaModifyForm.do?qa_seq='+$('#qa_seq').val()+'&pg='+$('#pg').val();	
		}
		else if($('#purpose').val()=='delete'){
			var realDelete = confirm('정말 삭제하시겠습니까?');
			if(realDelete){
				window.location='/board/qa/qaDelete.do?qa_seq='+$('#qa_seq').val();}
		}
	}
	else{
		$('#alertText').val('비밀번호를 다시 입력하세요').css('color','red').css('font-size','8px').css('width','200px');		
	}
});