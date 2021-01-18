<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>
	.join_main {
		text-align: center;
	}

	.logintle2 {
		border: 1px solid;
		text-align: center;
		width: 70%;
		padding-top: 2%;
		margin: auto;
	}
	.gt {
		border: none;
		border-bottom: 1px solid black;
		
	}
	.info {
		margin: auto;
	}
	td {
		padding-left: 10px;
		text-align: left;
		
	}
	.findidbtn {
		text-align: right;
		padding-right: 70px;
	}
	.id_find {
	    text-align: center;
		width: 100px;
		padding: 5px;
		background-color: #1C1C1C;
		color: white;
		top:50%; 
    	left:50%;
    	border: none;
	}
</style>

<div class="join_main">
		<br><br><br><br><br><br>
		<h2>
    		<span>By.GeunT Welcome</span>
    	</h2>
        	<div id="underline"></div>	
		<h3>아아디 / 비밀번호 찾기</h3><br>
</div>

<div class="logintle2">	
	<div class="col">
		<h3>아이디 찾기</h3>
        	<div id="underline"></div>	
			<form id="findIdForm">
				<div class="info">
				<table class="info">
					<tr>
						<td><strong>이름</strong></td>
						<td><strong>이메일 주소</strong></td>
					</tr>
					<tr>
						<td>
					<input type="text" class="gt" id="findName" name="findName" size="15" data-toggle="tooltip" data-placement="bottom" title="조회하실 회원명을 입력해 주세요." placeholder="조회대상 회원명 입력"/>
						</td>
				   		<td>
				    <input type="text" class="gt" id="findIdemail1" name="findIdemail1" placeholder="이메일 " data-toggle="tooltip" data-placement="bottom" title="이메일을 전부 입력하세요."/>
						<span>@</span>
				   		</td>
						<td>
				   	<input type="text" class="gt" id="findIdemail2" name="findIdemail2" size="8" data-toggle="tooltip" data-placement="bottom" title="이메일을 전부 입력하세요."/>
						</td>
						<td>
					     	<select id="findIdInputEmail">
				        		<option value="" disabled selected>E-Mail 선택</option>
				        		<option value="naver.com" id="naver.com">naver.com</option>
				        		<option value="gmail.com" id="gmail.com">gmail.com</option>
				        		<option value="daum.net" id="daum.net">daum.net</option>
				        		<option value="directly" id="findIdemail2">직접 입력하기</option>
		    				</select>		
						</td>
					</tr>
				</table><br><br>
				<div class="findidbtn">
					<button type="button" id="findIdBtn" name="findIdBtn" class="id_find">아이디 찾기</button>
				</div>
				</div>
			</form>
			
			<h3>비밀번호 찾기</h3>
        	<div id="underline"></div>	
			<form id="findPwdForm">
				<div class="info">
				<table class="info">
					<tr>
						<td><strong>아이디</strong></td>
						<td><strong>이메일 주소</strong></td>
					</tr>
					<tr>
						<td>
					<input type="text" class="gt"  id="findID" size="15" data-toggle="tooltip" data-placement="bottom" title="조회하실 회원명을 입력해 주세요." placeholder="조회대상 회원명 입력"/>
						</td>
				   		<td>
				    <input type="text" class="gt" id="findPwdemail1" name="findPwdemail1" placeholder="이메일 " data-toggle="tooltip" data-placement="bottom" title="이메일을 전부 입력하세요."/>
						<span>@</span>
				   		</td>
						<td>
				   	<input type="text" class="gt" name="findPwdemail2" id="findPwdemail2" size="8" data-toggle="tooltip" data-placement="bottom" title="이메일을 전부 입력하세요."/>
						</td>
						<td>
					     	<select id="findIdInputEmail2">
				        		<option value="" disabled selected>E-Mail 선택</option>
				        		<option value="naver.com" id="naver.com">naver.com</option>
				        		<option value="gmail.com" id="gmail.com">gmail.com</option>
				        		<option value="daum.net" id="daum.net">daum.net</option>
				        		<option value="directly" id="findIdemail2">직접 입력하기</option>
		    				</select>		
						</td>
					</tr>
				</table><br><br>
				<div class="findidbtn">
					<button type="button" id="findPwdBtn" name="findPwdBtn" class="id_find">비밀번호 찾기</button>
				</div><br><br><br>
				</div>
			</form>
	</div>
</div>


<script>

	<!-- 이메일 선택 변경 -->
    $(function() {
        $('#findIdInputEmail').change(function() {
            if ($('#findIdInputEmail').val() == 'directly') {
                $('#findIdemail2').attr("disabled", false);
                $('#findIdemail2').val("");
                $('#findIdemail2').focus();
            } else {
                $('#findIdemail2').val($('#findIdInputEmail').val());
            }
        })
    });
    $(function() {
        $('#findIdInputEmail2').change(function() {
            if ($('#findIdInputEmail2').val() == 'directly') {
                $('#findPwdemail2').attr("disabled", false);
                $('#findPwdemail2').val("");
                $('#findPwdemail2').focus();
            } else {
                $('#findPwdemail2').val($('#findIdInputEmail2').val());
            }
        })
    });
    
    
</script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<script type="text/javascript" src="../resources/custom/js/member/member.find.js"></script>
<script type="text/javascript" src="../resources/bootstrap4/js/bootstrap.bundle.min.js"></script>

