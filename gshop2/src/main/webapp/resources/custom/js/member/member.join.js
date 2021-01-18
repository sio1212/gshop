//0. 공통 변수 설정
var checkNum = '';

var noIdMsg = 
'<span class="fas fa-exclamation-triangle" style="color:#FF9100;font-weight:bold;">아이디를 입력해주세요</span>'

var noCheckMsg = 
'아이디 중복체크를 해주세요';

var noConfirmMsg =
'이메일 인증을 해주세요';

var failMsg = 
 '가입 실패하셨습니다.'+
'다시 한번 시도해주세요!';

var existMsg = 
' [사용불가] 이미 존재하는 아이디입니다';
	
var notexistMsg = 
'<span class="fas fa-check-circle">'+
'사용가능한 아이디입니다</span>';

var notAppropriateId = 
'<span class="fas fa-exclamation-triangle" style="color:#FF9100;font-weight:bold;">'+
'아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자로 설정하여 주시기 바랍니다';

var notAppropriatePwd = 
'비밀번호는 영문자,숫자,특수문자을 각각 하나 이상 포함하여 8자리 이상 16자리 이하로 설정하셔야 합니다';

//1. 아이디 유효성(5자리 이상)
var checkID = /^[a-z]+[a-z0-9]{5,19}$/g;;	
//2. 비밀번호 유효성(하나 이상의 영문자, 하나 이상의 숫자, 하나 이상의 특수문자, 최소 8자 최대 16자)
var reg = /^(?=.*[a-zA-Z])(?=.*[\~\․\!\@\#\$\%\^\&\*\(\)\_\-\+\=\[\]\|\\\;\:\\'\"\<\>\,\.\?\/])(?=.*[0-9]).{8,16}$/;

//3.최초 시작시 인증창 안 보이기
$(document).ready(function(){
	$('#confirmDiv').hide();
});


// 이메일 선택 변경
 $(function() {
        $('#select').change(function() {
            if ($('#select').val() == 'directly') {
                $('#textemail').attr("disabled", false);
                $('#textemail').val("");
                $('#textemail').focus();
            } else {
                $('#textemail').val($('#select').val());
            }
        })
    });


// 우편번호 다음 API
// 우편번호 찾기 화면을 넣을 element
        var element_layer = document.getElementById('layer');

        function closeDaumPostcode() {
            // iframe을 넣은 element를 안보이게 한다.
            element_layer.style.display = 'none';
        }

        function sample2_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample2_extraAddress").value = extraAddr;
                    
                    } else {
                        document.getElementById("sample2_extraAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample2_postcode').value = data.zonecode;
                    document.getElementById("sample2_address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample2_detailAddress").focus();

                    // iframe을 넣은 element를 안보이게 한다.
                    // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                    element_layer.style.display = 'none';
                },
                width : '100%',
                height : '100%',
                maxSuggestItems : 5
            }).embed(element_layer);

            // iframe을 넣은 element를 보이게 한다.
            element_layer.style.display = 'block';

            // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
            initLayerPosition();
        }

        // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
        // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
        // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
        function initLayerPosition(){
            var width = 300; //우편번호서비스가 들어갈 element의 width
            var height = 400; //우편번호서비스가 들어갈 element의 height
            var borderWidth = 5; //샘플에서 사용하는 border의 두께

            // 위에서 선언한 값들을 실제 element에 넣는다.
            element_layer.style.width = width + 'px';
            element_layer.style.height = height + 'px';
            element_layer.style.border = borderWidth + 'px solid';
            // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
            element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
            element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
        }

	
//체크박스 전체 선택
	$(function(){
	    $("#chkAll").click(function(){
	        var chk = $(this).is(":checked");
	        if(chk){
	            $(".agreeArea input").prop('checked', true);
	        } else {
	            $(".agreeArea input").prop('checked', false);
	        }
	    });
	});



//5. 미작성 등 tooltip 경고창 on/off
$('#name').focusout(function(){
	 if($('#name').val()!=''){ 
		 $('#name').tooltip('disable');
	 } 
	 else{
		 $('#name').tooltip('enable');
	 }
});

$('#id').focusout(function(){
	 if($('#id').val()!=''){ 
		 $('#id').tooltip('disable');
	 } 
	 else{
		 $('#id').tooltip('enable');
	 }
});

$('#pwd').focusout(function(){
	 if($('#pwd').val()!=''){ 
		 $('#pwd').tooltip('disable');
	 } 
	 else{
		 $('#pwd').tooltip('enable');
	 }
});
$('#repwd').focusout(function(){
	 if($('#pwd').val()!=$('#repwd').val()){ 
		 $('#pwd').tooltip('disable');
	 } 
	 else{
		 $('#pwd').tooltip('enable');
	 }
});
$('#email1').focusout(function(){
	 if($('#email1').val()!=''){ 
		 $('#email1').tooltip('disable');
	 } 
	 else{
		 $('#email1').tooltip('enable');
	 }
});

$('#textemail').change(function() {
	 if($('#textemail').val()!=''){ 
		 $('#textemail').tooltip('hide');	
		 $('#textemail').tooltip('disable');
	 } 
	 else if($('#checkEmail').val()==$('#textemail').val()){
		 $('#textemail').tooltip('hide');			 
		 $('#textemail').tooltip('disable');		 
	 }
	 else{
		 $('#textemail').tooltip('enable');
		 $('#textemail').tooltip('show');		 
	 }
});

//8. 이메일 인증창 열기
$('#goConfirm').click(function(){
	$('#confirmDiv').hide();
	if($('#email1').val()==''|| $('#textemail').val()=='') {
		alert('인증하실 이메일이 입력되지 않았습니다.');
	}
	else{
		$('#confirmDiv').show();
	}
});	

//9. 이메일 인증하기 이벤트(인증 후 창닫침까지)
$('#getConfirm').click(function(){		
		var email = $('#email1').val()+'@'+$('#textemail').val();

		$.ajax({
			type : 'post',
			url : '/member/checkEmail.do',
			data : 'email='+email,
			dataType : 'text',
			success : function(data){
				checkNum = data;
			}
		});
		
		alert('이메일을 통해 확인하신 인증번호를 입력해주세요.');
});

$('#doConfirm').click(function(){
		$('#checkEmail').val();
		$('#email1').attr('readonly',false);
		$('#textemail').attr('readonly',false);
	if(checkNum == $('#confirmNum').val()){
		alert('인증 성공하셨습니다. 다른 메일을 사용하시려면 다시 작성 버튼을 클릭하여 초기화 바랍니다.');
		$('#checkEmail').val($('#email1').val()+'@'+$('#textemail').val());	
		$('#email1').attr('readonly',true);
		$('#textemail').attr('readonly',true);		
		$('#Confirm').removeClass().addClass('far fa-check-circle').html('인증 완료');
	}
	else {alert('인증 실패하였습니다. 새로운 인증 번호를 받으시려면 아이콘을 재클릭 부탁드립니다.');
	}
		$('#confirmDiv').hide();	
});

//6. 회원 가입 최종 승인 이벤트
$('#writeBtn').click(function(){
	$('#confirmDiv').hide();
    $('#writeResult').empty();
	$('#id').tooltip('disable');
	$('#pwd').tooltip('disable');
	$('#repwd').tooltip('disable');
	$('#email1').tooltip('disable');	
	$('#textemail').tooltip('disable');
	var policyCheck = $('#chkAll').is(':checked');
		if($('#id').val()==''){
			 $('#id').tooltip('enable');
			 $('#id').tooltip('show');
			 $('#id').focus();	
		}else if($('#pwd').val()==''){
			 $('#pwd').tooltip('enable');
			 $('#pwd').tooltip('show');
			 $('#pwd').focus();	
		}else if($('#pwd').val()!=$('#repwd').val()){
			 $('#repwd').tooltip('enable');
			 $('#repwd').tooltip('show');
			 $('#repwd').focus();	
		}else if(reg.test($('#pwd').val())==false){
			 $('#pwd').focus();	 
			 	alert(notAppropriatePwd);
		}else if($('#name').val()==''){
			 $('#name').tooltip('enable');
			 $('#name').tooltip('show');
			 $('#name').focus();
		}else if($('#id').val()!=$('#checkId').val()){
			 $('#id').focus();	
				alert(noCheckMsg);	
		}else if($('#email1').val()==''|| $('#textemail').val()==''){
			 $('#email1').tooltip('enable');
			 $('#email1').tooltip('show');
			 $('#email1').focus();	
		}else if($('#checkEmail').val()!= $('#email1').val()+'@'+$('#textemail').val()){
			 $('#goConfirm').focus();	
			    alert(noConfirmMsg);	
		}else if(!policyCheck){
			 alert('저희 샵의 거래 약관에 동의해 주세요');
			$.ajax({
				type: 'post',
				url : '/member/write.do',
				data : $('#writeForm').serialize(),
				dataType : 'text',
				success : function(data){
					$('#writeResult').empty();
					if(data=='success') {
					 alert('축하합니다. 회원가입되셨습니다!!(메인 화면으로 이동합니다.)');	
					 window.location='/main/home.do';}
					else if(data=='fail') {
						$('#writeForm').empty();
						alert(failMsg);				
					}
				}				
			});
		} 
	});
//7. 아이디 중복 체크 이벤트
$('#id').focusout(function(){
		$('#writeResult').empty();
		if($('#id').val()=='') $('#writeResult').append(noIdMsg).alert();
		else if(checkID.test($('#id').val())==false){
			$('#writeResult').append(notAppropriateId).alert();
		}else
			$.ajax({
				type : 'post',
				url : '/member/checkId.do',
				data : 'id='+$('#id').val(),
				dataType : 'text',
				success : function(data){
					if(data=='exist')
						$('#writeResult').append(existMsg).alert();
					else if(data=='not_exist'){
						$('#writeResult').append(notexistMsg).alert();
						$('#checkId').val($('#id').val());
					}
				}
			});
});