/**
 * 문의 게시판 관련 자바 스크립트 : 공통
 */
//0. 공통 변수 초기화
var qa_state ='0';

 var notitleMsg = '<div class="alert alert-warning alert-dismissible fade show" role="alert">제목을 입력해주세요'+
'<button type="button" class="close" data-dismiss="alert" aria-label="Close">'+
'<span aria-hidden="true">&times;</span></button></div>';

var noContentMsg = '<div class="alert alert-warning alert-dismissible fade show" role="alert">내용을 입력해주세요'+
'<button type="button" class="close" data-dismiss="alert" aria-label="Close">'+
'<span aria-hidden="true">&times;</span></button></div>';

var noPwdMsg = '<div class="alert alert-warning alert-dismissible fade show" role="alert">비밀번호를 설정해주세요'+
'<button type="button" class="close" data-dismiss="alert" aria-label="Close">'+
'<span aria-hidden="true">&times;</span></button></div>';

var emptyPwdMsg = '<div class="alert alert-warning alert-dismissible fade show" role="alert">비밀번호를 입력해주세요'+
'<button type="button" class="close" data-dismiss="alert" aria-label="Close">'+
'<span aria-hidden="true">&times;</span></button></div>';

var missMatchingPwdMsg = '<div class="alert alert-warning alert-dismissible fade show" role="alert">비밀번호를 다시 확인해 주세요'+
'<button type="button" class="close" data-dismiss="alert" aria-label="Close">'+
'<span aria-hidden="true">&times;</span></button></div>';

//1. 리셋 버튼 이벤트
$('#qaReset').click(function(){
	window.location.reload();
});

//2.돌아가기 버튼 이벤트
$('#qaReturn').click(function(){
	window.history.back();
});

//3. 문의 작성 버튼 이벤트
$('#goQaWrite').click(function(){
	window.location='/board/qa/qaWriteForm.do';
});

//4. 문의대상 상품 선택 변경 이벤트
$('#productid').change(function(){
	$('#imgDiv').empty();
	if($("#productid option:selected").val()!=''){
		var getImgOn='<img style="height:100%;width:90px;" src="/storage/showProduct.do?product_name_image='+$("#productid option:selected").val()+'">';
		$('#imgDiv').html(getImgOn);
	}
});