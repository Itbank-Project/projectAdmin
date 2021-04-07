<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
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
	    background-color: #e74c3c;
	    color: white;
            font-weight: bold;
            margin-top: 20px;
            width: 300px;
            height: 45px;
            border: none;
            font-size: 20px;
        }
    </style>
</head>
<body>

	<div id="root">
        <div style="display: block; justify-content: center; align-items: center; text-align: center; font-size: 20px; margin: 30px; line-height: 30px;">
            	사용자 정보
        </div>
        <div style="width: 300px; border: 1px solid gray; margin: auto;"></div>
        <form id="modifyForm"method="POST">
        <input type="hidden" name="ad_idx" value="${login.ad_idx }"> 
        <div style="display: block; justify-content: center; align-items: center; text-align: center; outline: none; padding: 35px 20px 0px;">
            <div>이름</div>
            <div><input class="input" type="text" name="ad_name" value="${login.ad_name }"></div>
            
            <div>휴대폰 번호</div>
            <div><input class="input" type="text" name="ad_pnum" value="${login.ad_pnum }"></div>
            
            <div>이메일</div>
            <div><input class="input" type="text" name="ad_email" value="${login.ad_email }"></div>

            <div>계좌번호</div>
            <div><input class="input" type="text" name="ad_account" value="${login.ad_account }"></div>

            <div>은행</div>
            <div><input class="input" type="text" name="ad_bank" value="${login.ad_bank }"></div>

            <div><input class="submit" type="submit" value="내 정보 수정 완료"></div>
        </div>
        </form>
    </div>

<script type="text/javascript">
	
	const modifyForm = document.getElementById('modifyForm');
	
	const modifySubmit = function(event){
		event.preventDefault();
		
		const formData = new FormData(modifyForm);
		const ob = {};
		
		for(const [key,value] of formData.entries()){
			ob[key] = value;
		}
		
		const url = cpath + '/modify';
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
			if(text == 1){
				location.replace(cpath);
			}
			else{
				alert('입력하신 정보가 잘못되었습니다');
			}
		});
	}
	modifyForm.onsubmit = modifySubmit;
	console.log(modifyForm);

</script>




</body>
</html>
