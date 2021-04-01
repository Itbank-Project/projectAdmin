<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${cpath }/resources/css/style.css">
    <link rel="stylesheet" href="${cpath }/resources/css/guide.css">
    <title>INDEX PAGE</title>
	
<style>
    	.nav { list-style:none; cursor:pointer }
		.nav li { 
		  float:left; 
		  margin-right:50px;
		  transition:all .5s ease 
		}
		.nav li:hover { color:#CD1F48; transition:all .3s ease }
		.nav li a { position:relative }
		
		/*밑줄넣기 부분*/
		.nav li a::after {
		  content: '';
		  width: 0%;
		  left: 50%;
		  height: 1px;
		  display: block;
		  position: absolute;
		  margin-top: 3px;
		  border-bottom: 2px solid #fd79a8;
		  transition:all .5s ease;
		}
		.nav li:hover > a::after {
		  content: '';
		  width: 100%;
		  left: 0px;
		  height: 1px;
		  display: block;
		  position: absolute;
		  margin-top: 3px;
		  border-bottom: 2px solid #fd79a8;
		  transition:all .3s ease;
		}
    </style>
	
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<header>

	<div id="update" class="modal hidden">
		<div class="modal_overlay"></div>
	
		<div class="modal_content">
			<h3 style="margin-left: 15px; text-align: center;">비밀번호 변경</h3>
			<hr>
			<form id="updateForm" method="POST">
				<input type="hidden" name="ad_id" value="${login.ad_id }">
				<div class="update_content">
					<div>
						<input style="border: none; border-bottom: 1px solid black; outline: none;" class="inputPW" id="userpw" type="password" name="ad_pw"
							placeholder="기존 비밀번호를 입력하세요" required>
					</div>
					<div id="result" style="font-size: 13px;"></div>
				</div>
	
				<div class="update_content">
					<div>
						<input style="border: none; border-bottom: 1px solid black; outline: none;" class="inputPW" id="newPw1" type="password" name="ad_newPw1"
							placeholder="새 비밀번호를 입력하세요" required>
						<br><span style="font-size: 13px; color:#e17055;">비밀번호는 8글자 이상 문자, 숫자, 특수문자 각 1개씩 포함하여야 합니다.</span>
					</div>
				</div>
	
				<div class="update_content">
					<div>
						<input style="border: none; border-bottom: 1px solid black; outline: none;" class="inputPW" id="newPw2" type="password" name="ad_newPw2"
							placeholder="새 비밀번호를 확인하세요" required>
						<br><span style="font-size: 13px; color:#e17055;">비밀번호는 8글자 이상 문자, 숫자, 특수문자 각 1개씩 포함하여야 합니다.</span>
					</div>
				</div>
				<div>
					<input id="updateSubmit" type="submit" value="변경"
						style="margin-left: 10px;border: none; color: white; font-size:15px;width: 508px;height: 30px; line-height: 0px; text-align: center;">
				</div>
			</form>
			<div>
				<input id="cancelUpdate" type="button" value="닫기" 
					style="background-color: #e74c3c; margin-left: 10px;border: none; color: white; font-size:15px;width: 508px;height: 30px;">
			</div>
		</div>
	</div>

    <div class="navbar">
        <div class="navbar-inner">
            <div class="container">
                <h1><a class="brand" href="${cpath }/">HOTELJAVA</a></h1>
                <div class="nav-collapse-outer">
	                <div class="nav-collapse">
	                    <ul class="nav">
	                        <li><a href="${cpath }/">판매기록</a></li>
	                        <li><a href="${cpath }/roomStatus">객실현황</a></li>
	                        <li><a href="${cpath }/trueReview">자바리뷰</a></li>
	                        <li><a href="${cpath }/hotelInformation">호텔정보</a></li>
	                        <li><a href="${cpath }/calculate">정산</a></li>
	                    </ul>
	                </div>
	                <!-- end collapse -->
	                
	                <div class="right">
	                    <div class="dropdown-btn">
	                    	${login.ad_name}</div>
	                    <c:if test="${not empty login}">
				<div id="content-menu" class="dropdown-content"> 
				    <a href="" >비밀번호 변경</a>
	                            <a href="${cpath }/modify" >회원정보 변경</a>
				    <a href="${cpath }/enterHotelinformation/${login.ad_id}">호텔정보 입력</a>
	                            <a href="${cpath }/logout">로그아웃</a>
	                        </div>
			    </c:if>    
	                </div><!-- end right -->
                    
                </div> <!-- end nav-collapse-outer -->
            </div> <!-- end container -->
        </div> <!-- end inner -->
    </div> <!-- end navbar -->
</header>
<body>


<script type="text/javascript">
const content_menu = document.getElementById('content-menu');
const passwordChange = content_menu.querySelectorAll('a')[0];

// 비밀번호 변경 누르면 비번 수정 폼 띄우기
passwordChange.onclick = function(event){
	event.preventDefault();
	console.log(passwordChange);
	document.getElementById('update').classList.remove('hidden');
}

// 업데이트 폼에서 취소버튼 누르면 hidden
const cancelUpdate = document.getElementById('cancelUpdate');
cancelUpdate.onclick = function() {
	document.getElementById('update').classList.add('hidden');
}

// 현재 비밀번호가 일치하는지 확인
$('#userpw').blur(function(){
	$.ajax({
		url : cpath + '/checkPw',
		method : 'POST',
		data : {userpw : $('#userpw').val()},
		dataType : 'text',
		success: function(returnValue){
			if(returnValue =='비밀번호를 잘못입력하였습니다.'){
				document.querySelector('#result').innerText = '비밀번호를 잘못 입력하였습니다.';
				document.querySelector('#result').style.color = 'red';
			}
			else {
				document.querySelector('#result').innerText = '잘하셨습니다.';
				document.querySelector('#result').style.color = 'blue';

			}
		}
	})
})

// 업데이트 폼에서 변경  버튼 눌렀을 때, 유효성 검사
const updateForm = document.getElementById('updateForm');
const cpath = '${pageContext.request.contextPath }';

const checkPW =	function(event){
	event.preventDefault();
	const userpw = document.getElementById('userpw').value;
	const newPw1 = document.getElementById('newPw1').value;
	const newPw2 = document.getElementById('newPw2').value;
	
	const pattern1 = /[0-9]/;
	const pattern2 = /[a-zA-Z]/;
	const pattern3 = /[~!@\#$%<>^&*]/; 

	// ↓ alert 부분을 innerText로 바꾸고싶은데.. 몇번해봤는데 왜안되지 ? 내일다시해봅시다..
	// 새 비밀번호 일치여부 확인
	if(newPw1 != newPw2){
		alert('비밀번호가 일치하지 않습니다.');
		return false;
	}

	//  비밀번호는 8글자 이상 문자, 숫자, 특수문자 각1개씩 포함한지 확인
	if (!pattern1.test(newPw1) || !pattern2.test(newPw1) || !pattern3.test(newPw1)
				|| newPw1.length<8||newPw1.length>50) {
			alert("비밀번호는 8글자 이상 문자, 숫자, 특수문자 각1개씩 포함하여야 합니다.");
			return false;
	}

	// 기존 비밀번호와 겹치지 않게
	if(newPw1.indexOf(userpw) > -1){
		alert('기존 비밀번호와 동일한 비밀번호입니다.');
		return false;
	}
	// ↑
	
	if(true){
		const np = newPw1;
		const formData = new FormData(updateForm);
		const ob = {};
		
		
		for(const [key,value] of formData.entries()){
			ob[key] = value;
			ob['ad_pw'] = np;
		}
		const url = cpath + '/changePW';
		const opt = {
				method : 'PUT',
				body : JSON.stringify(ob),
				headers : {
					'Content-Type' : 'application/json;charset=utf8'
				}
		};
		fetch(url,opt)
		.then(resp => resp.text())
		.then(text => {
			if(text == 1 ){
				alert('수정이 완료되었습니다');
				location.href='${cpath}/logout';  
			}
		})
		return true;
	}
}
updateForm.onsubmit = checkPW;

</script>
