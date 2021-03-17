<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hotel | 회원가입</title>
<style>
.hidden {
		display: none;
	}
</style>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>Member Join Form</h3>
			</div>
			<form id="joinForm">
					<p>
						<label>ID</label> 
						<input class="w3-input" type="text" id="ad_id" name="ad_id"  placeholder="ID"    required> 
						<span id="id_check"></span>
					</p>
					<p>
						<label>Password</label> 
						<input class="w3-input" type="password" id="ad_pw" name="ad_pw"   placeholder="Password" required>
						<span id="pw_check" class="w3-text-red"></span>
					</p>
					<p>
						<label>Password</label> 
						<input class="w3-input" id="userpw2" name="userpw2" type="password"  placeholder="Password Confirm" required>
						<span id="pw_check2" class="w3-text-red"></span>
					</p>
					<p>
						<label>이름</label> 
						<input class="w3-input" id="name" name="ad_name" type="text"  required>
					</p>
					<p>
						<label>전화번호</label> 
						<input class="w3-input" id="ad_pnum" name="ad_pnum" type="text" placeholder="전화번호 입력" required>
					</p>
					<p>
						<label>계좌번호</label> 
						<input class="w3-input" id="ad_account" name="ad_account" type="text" placeholder="계좌번호 입력" required>
					</p>
					<p>
						<label>은행</label> 
						<input class="w3-input" id="ad_bank" name="ad_bank" type="text" placeholder="은행 입력" required>
					</p>
					
					
					<div id="sendMailForm">
						<p>이메일 주소 입력</p>
						<p>
							<input type="email" name="ad_email" placeholder="이메일 전송" required>
							<button value="인증번호 전송">인증번호 전송</button>
						</p>
						<div id="sendMailMsg"></div>
					</div>
					<div id="authMailForm" class="hidden">
							<p>인증번호 입력</p>
							<p>
								<input type="text" id="auth" name="auth" placeholder="인증번호를 입력하세요" required>
								<button value="인증">인증</button>
							</p>
							<div id="authMailMsg"></div>
					</div>

					<p class="w3-center">
						<input type="submit" id="joinBtn" value="Join" disabled=false class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">
					</p>
				</form>
			</div>
	
		</div>
	
<script>
const cpath = '${cpath}';
console.log(cpath);
// 아이디 중복 체크
$('#ad_id').blur(function(){
		// ajax를 이용하여 이미 가입된 id인지 판별하고 그 결과를 받아서 적절한 메시지를 idMsg의 innerHTML로 넣는다
		if($('#ad_id').val() == '' ){
			$('#id_check').text('아이디를 입력하세요');
			$('#id_check').css('color', 'red');
			$('#ad_id').focus();
			return;
		}
		else {
			$('#id_check').text('');
			var userid = document.getElementById('ad_id');
			console.log(userid.value);
			const url =  cpath + '/join/' + userid.value;
			console.log(url);
			const opt = {
					method: 'GET'		
			};
			fetch(url, opt)
			.then(resp => resp.text())
			.then(text => {
				console.log(text);
				const id = document.getElementById('id_check');
				
				id.innerHtml = '';
				if(text == '사용 가능한 ID입니다' ) {
					id.innerText = '사용 가능한 ID입니다';
					id.style.color = 'blue';
				}else {
					id.innerText = '이미 사용중인 ID입니다.';
					$('#id_check').css('color', 'red');
					$('#ad_id').select();					
				}
			});
	}
});
	
	
//비밀번호 체크

$('#ad_pw').blur( function () {
	var pw = document.getElementById('ad_pw').value;
	var pw_check = document.getElementById('pw_check');
	console.log(pw);
	var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	var hangulcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;

	if($('#ad_pw').val() == ''){
		$('#pw_check').text('비빌번호를 입력하세요');
		$('#pw_check').css('color', 'red');
		return;
	}else if(true === reg.test(pw))  {
		pw_check.innerText = '';
	}else {
		pw_check.innerText = '비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.';
		$('#pw_check').css('color', 'red');
		$('#ad_pw').select();	
	 }
});

//비밀번호 중복체크
$('#userpw2').blur(function() {
	var pw = document.getElementById('ad_pw').value;
	var pw2 = document.getElementById('userpw2').value;
	var pw_check2 = document.getElementById('pw_check2');
	if($('#userpw2').val() == ''){
		$('#pw_check2').text('비빌번호를 입력하세요');
		$('#pw_check2').css('color', 'red');
		$('#userpw2').focus();
		return;
	}else if(pw === pw2) {
		pw_check2.innerText = '';
	}else {
		pw_check2.innerText = '비밀번호가 일치하지 않습니다.';
		$('#pw_check2').css('color', 'red');
		$('#userpw2').select();	
	}
});
	

// 이메일 인증	
// 인증메일 발송
const sendMailForm = document.getElementById('sendMailForm');
const sendMailMsg = document.getElementById('sendMailMsg');

const sendMailHandler = function(event) {
	
	event.preventDefault();
	
	const email = sendMailForm.querySelector('input[type="email"]');
	console.log(email.value);
	if(email.value != ''){		
	const url = cpath + '/mailto/' + email.value + '/';
	const opt = {
			method: 'GET',
	}
	fetch(url, opt) 
	.then(resp => resp.text())
	.then(text => {
		
		if(text.length == 128) {
			authMailForm.classList.remove('hidden');
			sendMailMsg.innerText = '입력한 이메일로 인증 번호를 전송했습니다';
			sendMailMsg.style.color = 'blue';
			sendMailMsg.style.fontWeight = 'bold';
		} else {
			sendMailMsg.innerText = '이메일을 확인하지 못했습니다';
			sendMailMsg.style.color = 'red';
			sendMailMsg.style.fontWeight = 'bold';
		}
	});
	}
}


sendMailForm.onclick = sendMailHandler;


//인증번호 검증
const authMailForm = document.getElementById('authMailForm');
const authMailMsg = document.getElementById('authMailMsg');
	
const authHandler = function (event) {
	// form이 submit되면 ajax로 서버가 보낸 인증번호와 사용자가 입력한 인증번호가 일치하는지 체크하는 함수를 만들자

	event.preventDefault();

	let authResult;
	const userNumber = authMailForm.querySelector('input[name="auth"]');
	if($('#auth').val() == ''){
		$('#authMailMsg').text('인증번호를 입력하세요');
		$('#authMailMsg').css('color', 'red');
		$('#auth').focus();
	}else if(userNumber.value != ''){		
		const url = cpath + '/getAuthResult/' + userNumber.value + '/';
		const opt = {
		method: 'GET',	
	}
	fetch(url, opt) 
	.then(resp => resp.text())
	.then(text => {
		authMailMsg.innerText = '';
		if(text == 'true') {
			authMailMsg.innerText = '인증 성공!!';
			authMailMsg.style.color = 'blue';
			authMailMsg.style.fontWeight = 'bold';
			document.getElementById("joinBtn").disabled = false;
			authResult = true;
		
		} else {
			authMailMsg.innerText = '인증 실패 !!';
			authMailMsg.style.color = 'red';
			authMailMsg.style.fontWeight = 'bold';
			$('#auth').select();
			$('#auth').val() = '';
			document.getElementById("joinBtn").disabled = true;
			authResult = false;
		}
		
	});
}	

}

authMailForm.onclick = authHandler;
	
	// 회원가입
	const joinForm = document.getElementById('joinForm');

	const joinHandler = function (event) {
		
		event.preventDefault();
		const formData = new FormData(joinForm);
				
		const ob = {};
		for ([key, value] of formData.entries()) {
			ob[key] = value;
		}
		console.log(ob);
		const json = JSON.stringify(ob);	// 객체를 json형식으로
		const url = cpath + '/join';	
		const opt = {
			method: 'POST',
			body: json,
			headers: {
				'Content-Type': 'application/json'
			}
		};
		fetch(url, opt)
		.then(response => response.text())		// 인자로 callback함수를 전달받는다
		.then(text => {
			console.log(text);
			if(text == '1') {
				location.href = "login";
			} else {
				location.href = "join";
			}
		
		});
	}
	
	joinForm.onsubmit = joinHandler;
	
	
</script>
</body>
</html>