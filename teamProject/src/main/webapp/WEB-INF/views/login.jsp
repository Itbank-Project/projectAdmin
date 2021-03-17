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
		width: auto;
		height: 20px;
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
</style>

</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<form id="loginForm" method="POST">
	    <p>ID:</p>
	    <p><input class="login" id="ad_id" type="text" name="ad_id" value="${cookie.userid.value }"></p>
	    <p>Password:</p>
	    <p><input class="login" type="password" name="ad_pw"></p>
	     <div id="result"></div>
	    <p><input type="checkbox" id="idSaveCheck" name="storeid" ${not empty cookie.userid ? 'checked' : '' }> Remember me </p>
	    <p><input id="login_submit" class="login" type="submit" value="Login"></p>
	
		<div class="find_info">
        <a href="${cpath }/findID">아이디 찾기</a>
        <span>|</span>
        <a href="${cpath }/findPW">비밀번호 찾기</a>
        <span>|</span>
        <a href="${cpath }/join">회원가입</a>
    	</div>
		
	    <p>E-mail</p>
	    <p>help@dailyhotel.com</p>
	
	    <p>Tel.</p>
	    <p>1800-5120</p>
	
	    <p>Fax</p>
	    <p>02-6455-9331</p>
    </form>
    

</body>
</html>