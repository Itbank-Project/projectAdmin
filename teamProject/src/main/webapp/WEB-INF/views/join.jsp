<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hotel | 회원가입</title>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<style>
.hidden {
	display: none;
}
.join-input, .phoneNumber
{
 	border: none;
 	border-bottom: 1px solid gray;
 	outline: none;	
 	width: 402px;
 	margin-top: 35px;					
}	
.join-input::placeholder, .phoneNumber::placeholder {
	text-align: center;
	font-weight: bold;
}	
.mailBtn {
	border: none;
	border-radius: 10px;
	outline: none;
	background-color: #fd79a8;
	width: 406px;
	font-weight: bold;
	cursor: pointer;
	height: 30px;
	margin-top: 10px;
	color: white;
}	
#joinBtn {
	border: none;
	border-radius: 10px;
	outline: none;
	width: 406px;
	font-weight: bold;
	cursor: pointer;
	background-color: #cd1f48;
	color: white;
	height: 30px;
	margin-top: 10px;
}
.join-admin {
	text-align: center;
	padding-top: 20px;
	color: #fd79a8;
}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div class="join-admin"><h2>회원가입</h2></div>
	<div id="joinBackground"
		style="width: 768px; margin: auto; justify-content: center; align-items: center; text-align: center; margin-top: 100px;">

		<form id="joinForm">

			<div>
				<input class="join-input" type="text" id="ad_id"  name="ad_id"
					placeholder="ID" required>
			</div>
			<p id="id_check"></p>



			<div>
				<input class="join-input" id="ad_pw"  name="ad_pw" type="password"
					placeholder="Password" required>
			</div>
			<p id="pw_check"></p>



			<div>
				<input class="join-input" id="userpw2" name="ad_pw2" type="password"
					placeholder="Password Confirm" required>
			</div>
			<p id="pw_check2"></p>



			<div>
				<input class="join-input" id="name" name="ad_name" type="text"
					placeholder="이름" required>
			</div>
			<p id="name_check"></p>


			<div>
				<input class="phoneNumber" id="ad_pnum" onkeyup="" name="ad_pnum" type="text"
					placeholder="전화번호 입력" required>
			</div>
			<p id="pnum_check"></p>

			<div>
				<input class="join-input" id="ad_account" name="ad_account"
					type="text" placeholder="계좌번호 입력" required>
			</div>

			<div>
				<input class="join-input" id="ad_bank"
					name="ad_bank" type="text" placeholder="은행 입력" required>
			</div>


			<div id="sendMailForm">
				<div>
					<input class="join-input" type="email" name="ad_email"
						placeholder="이메일 전송" required>
				</div>

				<p>
					<button class="mailBtn" value="인증번호 전송">인증번호 전송</button>
				</p>

				<div id="sendMailMsg"></div>
			</div>
			<div id="authMailForm" class="hidden">
				<p>
				<div>
					<input class="join-input" type="text" id="auth" name="auth"
						placeholder="인증번호를 입력하세요" required>
				</div>
				<p>
					<button class="mailBtn" value="인증">인증</button>
				<p></p>
				<div id="authMailMsg"></div>
			</div>

			<p class="join">
				<input type="submit" id="joinBtn" value="Join" disabled=false>
			</p>
		</form>
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
		$('#ad_pw').focus();
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

// 이름 정규식(한글 또는 대 소문자 영문만 가능)
$('#name').blur( function () {
	var name = document.getElementById('name').value;
	var name_check = document.getElementById('name_check');

	var reg = /^[가-힣|a-z|A-Z]+$/;

	if($('#name').val() == ''){
		$('#name_check').text('필수 정보 입니다');
		$('#name_check').css('color', 'red');
		$('#name').focus();
		return;
	}else if(true === reg.test(name))  {
		name_check.innerText = '';
	}else {
		name_check.innerText = '한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)';
		$('#name_check').css('color', 'red');
		$('#name').select();	
	 }
});


	
//휴대폰 정규식
$('#ad_pnum').blur(function() {
	var pnum = document.getElementById('ad_pnum').value;
	var pnum_check = document.getElementById('pnum_check');
	console.log(pnum);
	var reg = /^\d{3}-\d{4}-\d{4}$/;
	
	if($('#ad_pnum').val() == ''){
		$('#pnum_check').text('휴대폰 번호를 입력하세요');
		$('#pnum_check').css('color', 'red');
		$('#ad_pnum').focus();
		return;
	} else if(true === reg.test(pnum))  {
		pnum_check.innerText = '';
	} else {
		pnum_check.innerText = '휴대폰 번호를 제대로 입력해주세요';
		$('#pnum_check').css('color', 'red');
		$('#ad_pnum').select();
	}
	
	
});
$(document).on("keyup", ".phoneNumber", function() {
	$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
	
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
