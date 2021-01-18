<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
<head>
<meta charset="UTF-8">
<title>GeunT_Shop</title>
<style>
	#wrap {
	    position: relative;
	    margin: 0px auto 0;
	    background: #fff;
	}
	html {
	    scroll-behavior: smooth;
	}
	h1 {
	    display: block;
	    font-size: 3em;
	    margin-block-start: 0.67em;
	    margin-block-end: 0.67em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
	    font-weight: bold;
	    text-align: left;
	    font-family: 'Lobster',Dotum,AppleGothic,sans-serif;
	}
	body {
		font: 0.65em 'Open Sans','Nanum Gothic',arial,Verdana,Dotum,AppleGothic,sans-serif;
	
	}
	
	ul {
		list-style-type: none;
		padding-left: 0;
	}
	h2 {
	    font-family: 'Lobster',Dotum,AppleGothic,sans-serif;
	}
	a {
		color: black;
	}
	a:link {
		text-decoration: none;
	}
	a:hover {
	  	color: gray;
	}
	nav {
		display: block;
	}
	#main_title {
   		margin: 80px 0 50px;
	}
	#main_title h2 {
	    width: 100%;
	    text-align: Center;
	    font-weight: normal;
	    font-size: 15px;
	    font-family: "Lobster",Dotum,AppleGothic,sans-serif;
	    font-weight: normal;
	}
	#main_title h3 {
	    width: 100%;
	    text-align: Center;
	    font-weight: normal;
	    font-size: 10px;
	    letter-spacing: 1pt;
	    color: #666;
	    margin: 8px 0;
	}
	#base_product h2 {
	    font-weight: normal;
	    font-size: 15px;
	    color: #000;
	    text-align: center;
	    letter-spacing: 1pt;
	}
	#underline {
	    width: 70px;
	    height: 1px;
	    background: #aaa;
	    margin: 20px auto;
	}
	#underlin1 {
		width: 170px;
	    height: 1px;
	    background: #aaa;
	    margin: 20px auto;
	}
	#container {
	    max-width: 72%;
	    margin: 0 auto;
	    position: relative;
		
	}
	#headline {
		top: 0;
		position: absolute;
		overflow: hidden;	
		clear: both;	
		width: 100%;
	}
	#header {
	    width: 10%;
	    float: left;
	    position: fixed;
	    z-index: 99999;
	    margin-left: 30px;
		margin-top: 0;
	}
	#gt_ri {
		width: 10%;
		position: fixed;
		margin-top: 15px;
		z-index: 99999;
		right: 0px;
    	padding: 40px 40px;
    	padding-right: 0;
		
	}
	img {
	  max-width: 100%;
		position: relative;
	}
	#gg {
		text-align: center;
		display: block;
		font: 0.75em 'Open Sans','Nanum Gothic',arial,Verdana,Dotum,AppleGothic,sans-serif;
		letter-spacing: 1pt;
		margin: 8px 0;
	}	
	.boardinfo{
		letter-spacing: 1pt;
	}
	.topMenu{
		letter-spacing: 1pt;
	}
	.topLog{
		letter-spacing: 1pt;
	}
	.list_item{
		color: #848484;
	}
	.listpro{
		padding-top: 20px;
		letter-spacing: 1pt;
		font-size: 15px;
		font-weight: bold;
	}
	.productSearch_form {
		text-align: center;
		padding-bottom: 5px;
	}
	
	.searchBtn {
		color: white;
		background-color: #1C1C1C;
		border: none;
		padding: 3px;
		cursor: pointer;
		vertical-align: middle;
	}
	
	.productcustom{
		border-bottom:1px solid darkgrey;
		letter-spacing: 5pt;
		background-color: #151515;
		color: white;
		text-align: center;
		padding: 10px;
		font-size: 20px;
	}
	.create_product{
		text-align: center;
		padding-bottom: 5px;
	}
	#header_two{
		color: #353535;
		margin: 0;
		position: fixed;
		right: 0;
		top: 0;
		width: 10%;
		padding: 40px 40px;
		z-index: 99999;
		text-align: right;
	}	
</style>
</head>
<body>

	<div id="wrap">
		<div id="headline">
			<jsp:include page="${headline }" />
 		<div id="container">
			<jsp:include page="/main/content.jsp" />					
			<jsp:include page="${display }" />
			<jsp:include page="${productmain }" />
			<jsp:include page="/main/footer.jsp" />
    	</div>
		</div>
 		<div id="header">
			<jsp:include page="/main/left.jsp" />					
 		</div>
 		<div id="header_two">
 			<jsp:include page="/main/left_two.jsp" />
 		</div>
    </div>
</body>
</html>
