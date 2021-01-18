<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style>
	.logintle {
		border: 1px solid;
		text-align: center;
		width: 50%;
		padding-top: 2%;
		margin: auto;
	}
	.join_main {
		text-align: center;
	}
	.logintle1 {
		text-align: center;
		margin: auto;
	}
	.loginBtn {
		color: white;
		background-color: #1C1C1C;
		border: none;
		padding: 23px;
		cursor: pointer;
	}
	.loginbtn:hover{
		background-color: gray;
		
	
	}
	a.joinbtn {
		display: block;
		width:80px;
    	line-height:30px;
    	text-align:center;
	    background-color:#1C1C1C;
	    color:white;
	    margin: auto;
	    margin-bottom: 20px;
	    font-size: 13px;
	}
	.id,.pw{
		width: 180px;
		padding: 5px;
	}
	.au{
		text-align: left;
		padding-left: 28%;
	}
	input[id="autologin"] {
        position: relative;
        top: 1.5px;
	}
	.find_id, .find_pw{
		margin-top: 25px;
		border: 1px solid;
		background-color: white;
		width: 150px;
		font-size: 10px;
		cursor: pointer;
	}
	
</style>
<div class="join_main">
		<br><br><br><br><br><br>
		<h2>
    		<span>By.GeunT Welcome</span>
    	</h2>
        	<div id="underline"></div>	
		<h3>로 그 인</h3><br>
</div>

<div class="logintle">	
	<div class="col">
		<h3>L.O.G.I.N</h3>	
		<div id="underline"></div>	
		<table class="logintle1">
			<tr>
				<th>ID</th>
				<td><input type="text" class="id" name="loginId" id="loginId" data-toggle="tooltip" data-placement="bottom" placeholder="&nbsp;&nbsp;아이디"></td>
				<td rowspan="2" style="padding-left: 10px;"><button type="button" id="loginBtn" name="loginBtn" class="loginBtn">L.O.G.I.N</button></td>
			</tr>
				<div id="loginResult"></div>
			<tr>
				<th>PW</th>
				<td><input type="password" class="pw" name="loginPwd" id="loginPwd" data-toggle="tooltip"data-placement="bottom"  placeholder="&nbsp;&nbsp;비밀번호"></td>
			</tr>
		</table>
			<div class="au">
				<input type="checkbox" name="autologin" id="autologin">자동 저장
			</div>
			<div class="find">
				<button id="find_id" class="find_id" onclick="changeView(0)">아이디 찾기</button>
				<button id="find_pw" class="find_pw" onclick="changeView(0)">비밀번호 찾기</button>
			</div>
		<h3>J.O.I.N</h3>
        	<div id="underline"></div>			
			<h4>회원이 아니신 경우 하단으로 이동하여 회원 가입 해주세요.</h4>

			<a href="/member/writeForm.do"	 class="joinbtn">J.O.I.N</a>	
			
		
	</div>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../resources/custom/js/member/member.login.js"></script>
<script type="text/javascript" src="../resources/bootstrap4/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="../resources/bootstrap4/js/bootstrap.js"></script>
<script type="text/javascript" src="../resources/bootstrap4/js/bootstrap.bundle.js"></script>

