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
		        	<th>룸 정보</th>
		        	<td><input style="border: none;" type="text" name="ro_pk" readonly></td>
		        </tr>
		        
		        <tr>
		            <th>객실타입</th>
		            <td>
		                <input type="text" name="ro_roomtype">
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
	
	<script>
	const roomtype = document.querySelector('input[name="ro_roomtype"]');
	const ro_pk = document.querySelector('input[name="ro_pk"]');
	const ho_name = '${ho_name}';
	
	roomtype.onchange = printType;
	
	
	function printType()  {
		 const name = roomtype.value;
		 console.log(ho_name);
		 console.log(name);
		 ro_pk.value = ho_name +'-'+name;
		}
	
	
	
	
	</script>
	
	
</body>
</html>
