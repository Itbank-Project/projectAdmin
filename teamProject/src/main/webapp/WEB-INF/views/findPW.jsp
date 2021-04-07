<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        #root{
            max-width: 768px; 
            margin: 0 auto; 
            width: 100%;
        }
        .input{
            border:none;
            border-bottom:1px solid gray;
            margin-bottom: 20px;
            width: 300px;
            height: 45px;
        }
        .submit{
            margin-top: 20px;
            width: 300px;
            height: 45px;
            border: none;
            font-size: 20px;
        }
        fieldset{
/* 			width: 500px; */
/* 			display: flex; */
/* 			flex-flow: column; */
/* 			justify-content: center; */
/* 			align-items: center; */
			width: 300px;
			display: flex;
			flex-flow: column;
			justify-content: center;
			align-items: center;
			margin-top: 10px;
			margin-left: 220px;
		}
		legend{
			font-size: 16pt;
			font-weight: bold;
		}

		.modal {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .modal_overlay {
            background-color: rgba(0, 0, 0, 0.6);
            width: 100%;
            height: 100%;
            position: absolute;
        }
        .modal_content {
            background-color: white;
            padding: 20px 50px;
            text-align: center;
            position: relative;
            border-radius: 10px;
            width: 300px;
            z-index: 1;
        }
		.hidden{
			display: none;
		}
    </style>
</head>
<body>
	

	<div id="root">
        <div style="display: block; justify-content: center; align-items: center; text-align: center; font-size: 20px; margin: 30px; line-height: 30px;">
           	 비밀번호 찾기
        </div>
        <div style="width: 300px; border: 1px solid gray; margin: auto;"></div>
	        <form id="findPwForm">
		        <div style="display: block; justify-content: center; align-items: center; text-align: center; outline: none; padding: 35px 20px 0px;">
		            <div>아이디</div>
		            <div><input class="input" type="text" name="ad_id" required></div>
		            
		            <div>이메일</div>
		            <div><input class="input" type="email" name="ad_email" required></div>
		
		            <div><input class="submit" type="submit" value="인증번호 받기"></div>
		        </div>
	        </form>
	        
		    <form id="authForm" class="inputAuthForm hidden" method="POST">
		    	<fieldset>
		    		<legend>인증번호 입력</legend>
		    		<p>
		    			<input type="text" id="authNumber" name="authNumber" placeholder="인증 번호를 입력하세요">
		    			<input type="submit" value="인증">
		    		</p>
		    	</fieldset>
		    </form>
    </div> 


<!-- 비밀번호 재 설정 폼 -->
    <div class="modal hidden">
        <div class="modal_overlay"></div>   <!--나머지 배경 어둡게 만드는 영역-->
        <div class="modal_content">         <!--표시하고 싶은 내용-->
            <h2>비밀번호 재설정</h2>
            <div>
                <form id="modifyPwForm">
                    <p><input id="resultID" type="text" name="ad_id" ></p>
                    <p><input type="password" name="ad_pw" placeholder="새 비밀번호"></p>
                    <p><input type="password" name="ad_pw2" placeholder="새 비밀번호 확인"></p>
                	<p>비밀번호는 8자 이상이어야 하며, <br> 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.</p>
                    <p>
                    	<input type="submit" value="변경">
                    	<input type="button" value="닫기" id="close">
                    </p>
                </form>
            </div>
        </div>
    </div>
    

	<script type="text/javascript">
		const cpath = '${pageContext.request.contextPath }';
		
		// 인증 번호 메일로 전송(본인 확인)
		const findPwForm = document.getElementById('findPwForm');
		const inputAuthForm = document.querySelector('.inputAuthForm');
		
		const findPwHandler = function(event){
			event.preventDefault();
			const formData = new FormData(findPwForm);
			const ob = {};
			
			for(const [key,value] of formData.entries()){
				ob[key] = value;
			}
			
			const url = cpath + '/sendMail';
			const opt = {
					method :'POST',
					body : JSON.stringify(ob),
					headers : {
						'Content-Type' : 'application/json;charset-utf8'
					}
			};
			fetch(url,opt)
			.then(resp => resp.text())
			.then(text =>{
				if(text === '일치하는 계정이 없습니다'){
					alert(text);
				}
				else{
					inputAuthForm.classList.remove('hidden');
					alert("입력한 이메일로 인증 번호를 전송하였습니다");
					document.getElementById('resultID').value = text;
				}
			})
		}
		findPwForm.onsubmit = findPwHandler;
		
		
		// 인증 번호 일치하는지 확인
		const authForm = document.getElementById('authForm');
		
		const modal = document.querySelector('.modal');
		const closeBtn = document.getElementById('close');
		
		const authCheckHandler = function(event){
			event.preventDefault();
			const number = document.getElementById('authNumber').value;
			const url = cpath + '/getAuthResult/' + number +'/';
			const opt = {
					method : 'GET',
			}
			fetch(url, opt)
			.then(resp => resp.text())
			.then(text => {
				if(text === 'true'){	// 인증번호가 일치할 경우 비밀번호 재 설정 폼 띄우기
        			modal.classList.remove('hidden');
				}
				else{	// 인증번호가 틀렸을 경우 번호입력칸 비우기
					alert('인증번호가 일치하지 않습니다.');
					document.getElementById('authNumber').value = '';
				} 
			})
		}
		authForm.onsubmit = authCheckHandler;
		
		// 비밀번호 재설정 폼
		const modifyPwForm = document.getElementById('modifyPwForm');
		
        closeBtn.onclick = function() {
            modal.classList.add('hidden');
        }

        // 비밀번호 유효성 검사
        modifyPwForm.onsubmit = function(event){
        	event.preventDefault();
        	const userpw = document.querySelector('input[name="ad_pw"]').value;
    		const userpw2 = document.querySelector('input[name="ad_pw2"]').value;
    		
    		const pattern1 = /[0-9]/;
    		const pattern2 = /[a-z]/;
    		const pattern3 = /[A-Z]/;
    		const pattern4 = /[~!@\#$%<>^&*]/; 

    		const formData = new FormData(modifyPwForm);
			const ob = {};
			
			for(const [key,value] of formData.entries()){
				ob[key] = value;
			}
			
    		// 새 비밀번호 일치여부 확인
    		if(userpw != userpw2){
    			alert('비밀번호가 일치하지 않습니다.');
    			return false;
    		}

    		//  비밀번호는 8글자 이상 문자, 숫자, 특수문자 각1개씩 포함한지 확인
    		if (!pattern1.test(userpw) || !pattern2.test(userpw) || !pattern3.test(userpw)
    					|| !pattern4.test(userpw) || userpw.length<8||userpw.length>50) {
    				alert("비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.");
    				return false;
    		}
    		
    		if(true){
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
    					location.href= cpath + '/login'; 
    				}
    			})
    			return true;
    		}
        }
    	    
	        
	</script>
	

</body>
</html>
