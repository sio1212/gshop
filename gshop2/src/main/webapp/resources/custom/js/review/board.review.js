/**
 * 리뷰게시판 관련 자바스트립트
 */
 
//0.공통 변수 초기화
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

var noProductMsg = '<div class="alert alert-warning alert-dismissible fade show" role="alert">상품선택은 필수사항입니다'+
'<button type="button" class="close" data-dismiss="alert" aria-label="Close">'+
'<span aria-hidden="true">&times;</span></button></div>';

//1. 다시작성 버튼 이벤트
$('#reviewReset').click(function(){
	window.location.reload();
});

//2. 메뉴 버튼 이벤트

$('#reviewReturn').click(function(){
	window.history.back();
});

//3. 리뷰 작성 버튼 이벤트
$('#goReviewWrite').click(function(){
	window.location='/board/review/reviewWriteForm.do';
});

//4. 답글 작성 이벤트
$('#reviewReplyFormBtn').click(function(){
	window.location='/board/review/reviewReplyForm.do?review_pseq='+$('#review_pseq').val()+'&productid='+$('#productid').val()+'&pg='+$('#pg').val();	
});

//5. 리뷰 대상 변경시 발생 이벤트
$('#productid').change(function(){
	$('#imgDiv').empty();
	if($("#productid option:selected").val()=='')
		 var getImgOn = '<div style="height: 100%; width:100%;" role="alert">선택 필수'
		 +'<span aria-hidden="true">&times;</span></div>';
	else
		var getImgOn='<img style="height:100%;width:90px;" src="/storage/showProduct.do?product_name_image='+$("#productid option:selected").val()+'">';
	$('#imgDiv').html(getImgOn);
});
