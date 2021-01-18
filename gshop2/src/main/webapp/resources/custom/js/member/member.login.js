//0. 공통 변수
var alertMsg = '<div class="alert alert-danger alert-dismissible fade show" role="alert">'+
'<strong>로그인 실패!</strong> 아이디 또는 비밀번호가 일치하지 않습니다.<br> 다시 한번 확인 후 시도해주세요.'+
'<button type="button" class="close" data-dismiss="alert" aria-label="Close">'+
'<span aria-hidden="true">&times;</span></button></div>'

var invalidateMsg = '<div class="alert alert-danger alert-dismissible fade show" role="alert">'+
'<strong>탈퇴한 멤버</strong> 이미 탈퇴한 멤버 정보입니다.<br> 계정 복원 등의 문의 사항은 담당자에 연락주시기 바랍니다.'+
'<button type="button" class="close" data-dismiss="alert" aria-label="Close">'+
'<span aria-hidden="true">&times;</span></button></div>'

var loginErrorMsg = '<div class="alert alert-danger alert-dismissible fade show" role="alert">'+
'<strong>유효하지 않은 로그인</strong> 로그인이 유효하지 않습니다.<br> 비회원 주문조회는 비회원 주문조회 로그인단에서 접속하시기 바랍니다.'+
'<button type="button" class="close" data-dismiss="alert" aria-label="Close">'+
'<span aria-hidden="true">&times;</span></button></div>'

//1. 미작성 등 경고창 on/off
$('#loginId').focusout(function(){
	 if($('#loginId').val()!=''){ 
		 $('#loginId').tooltip('disable');
	 } 
	 else{
		 $('#loginId').tooltip('enable');
	 }
});

$('#loginPwd').focusout(function(){
	 if($('#loginPwd').val()!=''){ 
		 $('#loginPwd').tooltip('disable');
	 } 
	 else{
		 $('#loginPwd').tooltip('enable');
	 }
});

//2. 로그인 이벤트
 $('#loginBtn').click(function(){ 
	 $('#loginResult').empty();
	 $('#loginId').tooltip('disable');
	 $('#loginPwd').tooltip('disable');
	 if($('#loginId').val()==''){ 
		 $('#loginId').tooltip('enable');
		 $('#loginId').tooltip('show');
		 $('#loginId').focus();
	 }
	 else if($('#loginPwd').val()=='') {
		 $('#loginPwd').tooltip('enable');
		 $('#loginPwd').tooltip('show');
		 $('#loginPwd').focus();
	 }
	 else {
		 if($('#autologin').is(':checked')) var autoLogin = '1';
		 else var autoLogin ='0';
		 $.ajax({
			 type : 'POST',
			 url : '/member/login.do',
			 data : {'id': $('#loginId').val(),'pwd' : $('#loginPwd').val(), 'autoLogin' : autoLogin},
			 dataType: 'text',
			 success : function(data){
					if(data=='userLogin') {
						alert('환영합니다!');	
						window.location='/member/memberView.do';
					}
 					else if(data=='adminLogin'){
 						var result = confirm('관리자 계정으로 접속하셨습니다. 관리자 화면으로 이동 하시겠습니까?');
 							if(result){
 								window.location.href='/member/adminLogin.do';}
 							else {				
 								window.location.href='/member/memberView.do';
 							}
 					}
					else if(data=='invalidate'){
						$('#loginResult').append(invalidateMsg).alert();
					}
					else if(data=='fail'){
						$('#loginResult').append(alertMsg).alert();
					}
					else $('#loginResult').append(loginErrorMsg).alert();
			 }
		 });

	 }
	 
 });


 