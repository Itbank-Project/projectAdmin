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
        #findId_btn{
            background-color: #e74c3c;
	    	color: white;
            font-weight: bold;
            margin-top: 20px;
            width: 300px;
            height: 45px;
            border: none;
            font-size: 20px;
        }
        .modal_findId {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .modal_overlay_findId {
            background-color: rgba(0, 0, 0, 0.6);
            width: 100%;
            height: 100%;
            position: absolute;
        }
        .modal_content_findId {
            background-color: white;
            padding: 50px 50px;
            text-align: center;
            position: relative;
            border-radius: 10px;
            min-width: 400px;
            width: 50%;
            max-width: 500px;
            z-index: 1;
        }
        .hidden {
            display: none;
        }
    </style>
</head>
<body>
	<div id="root">
        <div style="display: block; justify-content: center; align-items: center; text-align: center; font-size: 20px; margin: 30px; line-height: 30px;">
           	 아이디 찾기
        </div>
        <div style="width: 300px; border: 1px solid gray; margin: auto;"></div>
	        <form id="findIdForm" method="POST">
		        <div style="display: block; justify-content: center; align-items: center; text-align: center; outline: none; padding: 35px 20px 0px;">
		            <div>이름</div>
		            <div><input class="input" type="text" name="ad_name" required></div>
		            
		            <div>휴대폰 번호</div>
		            <div><input class="input" type="text" name="ad_pnum" required></div>
		            
		            <div>이메일</div>
		            <div><input class="input" type="text" name="ad_email" required></div>
		
		            <div><input id="findId_btn" type="button" value="아이디 찾기"></div>
		        </div>
	        </form>
    </div>
    
    <script type="text/javascript">
    const cpath = '${pageContext.request.contextPath }';
    
    // 모달창 띄우기
    const findId_btn = document.getElementById('findId_btn');

    // 아이디 찾기 버튼 눌렀을 때
    findId_btn.onclick = function(){
    	const findIdForm = document.getElementById('findIdForm');
    	const formData = new FormData(findIdForm);
		const ob = {};
		
		for(const [key,value] of formData.entries()){
			ob[key] = value;
		}
		
		const url = cpath +'/findID';
		const opt = {
				method : 'POST',
				body : JSON.stringify(ob),
				headers : {
					'Content-Type' : 'application/json;charset-utf8'
				}
		};
		fetch(url,opt)
		.then(resp => resp.text())
		.then(text => {
			if(text === '일치하는 정보가 없습니다.'){
				alert(text);
			}
			else{
				alert('아이디 찾기 : ' + text);
				location.href = cpath +'/login';
			}
		});	
    }
    
    	
    </script>
    
    
</body>
</html>
