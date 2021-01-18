<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="/resources/custom/css/carousel/carousel.css" rel="stylesheet">
<script src="/resources/custom/js/carousel/carousel.min.js" type="text/javascript"></script>

<div class="carousel" id="carousel-banner"> 
	<div class="carousel-wrapper"> 
		<div class="carousel-item"> 
	      	<img src="../image/1fee055ae4cd0df42f1f91f49d4e4c42.jpg" alt="...">
		</div> 
		<div class="carousel-item"> 
	      	<img src="../image/785afc424150ddb5878f6c4039b7734e.jpg" alt="...">
		</div> 
		<div class="carousel-item"> 
			<img src="../image/8667f33f8d5439bc35aba6d2f9970f81.jpg" alt="..."> 
		</div> 
	</div> 
		<div class="navi-wrapper"></div> 
</div>
<script>
	new Carousel(document.querySelector('#carousel-banner'),{
		
		CarouselMotion: 'slide', 
		// default : 화면변화없이 다음 화면으로 
		// slide : 왼쪽 오른쪽 넘기기
		// prev : 끝쪽에 다음 이미지가 살짝 보인다.
		// fade : 현재 컨텐츠 없어지면서 다음 컨텐츠 나오는 듯한
		naviStyle: 'arrow', // arrow 형식도 있음
		//naviPosition: 'bottom', // --> top / left / right
		autoMove: true, // true = 자동 넘기기 false = 넘기기 x 
		autoMoveTime: 2500
	});
</script>





   
  