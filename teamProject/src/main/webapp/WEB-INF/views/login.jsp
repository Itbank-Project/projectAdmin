<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	body {
		text-align: center;
	}
	
	.login {
		width: 350px;
		height: 30px;
	}
	
	.find_info {
		font-size: 14px;
		line-height: 14px;
		padding-top: 18px;
		text-align: center;
		color: #8e8e8e;
	}
	
	a {
		text-decoration: none;
		color: inherit;
	}
	input {
		text-align: center;
	}
	
	input::placeholder {
		text-align: center;
		font-weight: blod;
	}
	#login_submit {
		background-color: #cd1f48;
		border: none;
	    color: white;
	    font-weight: bold;
	    font-size:15px;
		text-decoration: none;
		margin: 4px 2px;
		cursor: pointer;
		width: 350px;
		height: 30px;
	}
	#login_submit:hover{
		box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0
		rgba(0, 0, 0, 0.19);
	}
</style>

</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<div class="loginForm">
		<img src="${cpath }/resources/img/hotelLogo_draw.png" style="width: 458px; height: 100px;">
		<form id="loginForm" method="POST">
		    <p><input class="login" id="ad_id" type="text" name="ad_id" value="${cookie.userid.value }" placeholder="ID를 입력하세요" autocomplete="off"></p>
		    <p><input class="login" type="password" name="ad_pw" placeholder="PW를 입력하세요"></p>
		    <div id="result"></div>
		    <p><input id="login_submit" class="login" type="submit" value="로그인"></p>
		    <p><input type="checkbox" id="idSaveCheck" name="storeid" ${not empty cookie.userid ? 'checked' : '' }> 아이디 저장 </p>
	    </form>
	</div>
		
	<div class="find_info">
        <a href="${cpath }/findID">아이디 찾기</a>
        <span>|</span>
        <a href="${cpath }/findPW">비밀번호 찾기</a>
        <span>|</span>
        <a href="${cpath }/join">회원가입</a>
    </div>
    	
    <div class="java_info">
    	<p>E_MAIL <span style="font-weight: bold;"> help@hotelJava.com</span></p>
    	<p>TEL <span style="font-weight: bold;"> 1600 - 0061</span></p>
    	<p>FAX <span style="font-weight: bold;"> 02 - 6455 - 9331</span></p>
    </div>
    

</body>
</html>
