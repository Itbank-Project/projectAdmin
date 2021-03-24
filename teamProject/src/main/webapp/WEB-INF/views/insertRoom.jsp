<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<style>
	table, th, td {
	border: 1px solid #e7eaec;
	border-spacing: 0px 0px;
	}
	th, td {
		height: 35px;
		text-align: center;
	}
	th {
		background-color: #F2F2F2;
	}
	#save {
		background-color: #e74c3c;
		border: none;
	    color: white;
	    font-weight: bold;
	    font-size:15px;
		padding: 16px 32px;
		text-decoration: none;
		margin: 4px 2px;
		cursor: pointer;
		width: 450px;
	}
	
	#save:hover {
		box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0
			rgba(0, 0, 0, 0.19);
	}
	.main-content {
		width: 450px;
		margin: 0 auto;
		justify-content: center;
		align-items: center;
	}
</style>

<body>

	<div class="main-content">
		<h3><span style="color:#fd79a8 ">객실입력</span></h3>
		<form method="POST" enctype="multipart/form-data">
		    <table style="border: 1px solid black; width:450px;">
		        <tr>
		            <th>객실타입</th>
		            <td>
		                <select name="ro_roomtype">
		                    <option selected>객실 타입을 선택하세요</option>
		                    <option value="스탠다드">스탠다드</option>
		                    <option value="디럭스">디럭스</option>
		                    <option value="패밀리">패밀리</option>
		                </select>
		            </td>
		        </tr>
		        <tr>
		            <th>침대타입</th>
		            <td>
		                <select name="ro_badtype">
		                    <option selected>침대 타입을 선택하세요</option>
		                    <option value="싱글">싱글</option>
		                    <option value="더블">더블</option>
		                    <option value="퀸">퀸</option>
		                </select>
		            </td>
		        </tr>
		        <tr>
		            <th>인원제한</th>
		            <td>
		                <select name="ro_limitperson">
		                    <option selected>최대인원을 선택하세요</option>
		                    <option value="2">2</option>
		                    <option value="4">4</option>
		                    <option value="6">6</option>
		                </select>
		            </td>
		        </tr>
		        <tr>
		            <th>가격</th>
		            <td><input type="number" name="ro_price" placeholder="가격을 입력하세요"></td>
		        </tr>
		        <tr>
		            <th>갯수</th>
		            <td>
		                <select name="ro_count">
		                    <option selected>수량을 선택하세요</option>
		                    <option value="1">1</option>
		                    <option value="2">2</option>
		                    <option value="3">3</option>
		                    <option value="4">4</option>
		                </select>
		            </td>
		        </tr>
		        <tr>
		            <th>객실설명</th>
		            <td><input type="text" name="ro_description" placeholder="객실 설명을 입력하세요"></td>
		        </tr>
		        <tr>
		            <th>객실사진</th>
		            <td><input type="file" name="ro_uploadfile"></td>
		        </tr>
		    </table>
		    <input id="save" type="submit" value="입력완료" style="width: 319;">
		</form>	
	</div>
</body>
</html>