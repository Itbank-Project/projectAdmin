<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<link rel="stylesheet" href="${cpath }/resources/css/hotelInformationModification.css">

<body>
<div class="main-inner">
	<div class="main-container">
		<div class="main-content">
		<form id="hotelModifiForm" method="POST" enctype="multipart/form-data">
			<h3><span style="color:#fd79a8 ">${dto.ho_name }</span> Hotel</h3>
				<input type="hidden" id="userid" name="ho_ad_id" value="${login.ad_id }">
			<table>
				<tr>
					<th>호텔 이름</th>
					<td><input style="border: none;" type="text" name="ho_name" class="ho_check" value="${dto.ho_name }" readonly ></td>
				</tr>
				<tr>
					<th>담당자</th>
					<td>${login.ad_name }</td>
				</tr>
				
				<tr>
					<th>주소</th>
					<td><input type="text" name="ho_address" class="ho_check" value="${dto.ho_address }"></td>
				</tr>
				<tr>
					<th>체크인</th>
					<td><input type="text" name="ho_check_in" class="ho_check" value="${dto.ho_check_in }"></td>
				</tr>
				<tr>
					<th>체크아웃</th>
					<td><input type="text" name="ho_check_out" class="ho_check" value="${dto.ho_check_out }"></td>
				</tr>
				<tr>
					<th>프론트</th>
					<td><input type="text" name="ho_pnum" class="ho_check" value="${dto.ho_pnum }"></td>
				</tr>
				<tr>
					<th>휴대폰</th>
					<td>${login.ad_pnum }</td>
				</tr>
				<tr>
					<th rowspan="1">이메일</th>
					<td>${login.ad_email }</td>
				</tr>
				<tr>
					<th>호텔 설명</th>
					<td><input type="text" name="ho_description" class="ho_check" value="${dto.ho_description }"></td>
				</tr>
				<tr>
					<th rowspan="1">업장 내 편의시설</th>
					<td id="img-scroll" colspan="3">
						<div id="img-bundle">
							<div>
								<img src="${cpath }/resources/img/1.png" width="70px"
									height="70px"> <br>주차가능<br>
								<input type="checkbox" name="ho_parking" value="주차" ${not empty dto.ho_parking ? 'checked' : ''}>
							</div>
							<div>
								<img src="${cpath }/resources/img/37.png" width="70px"
									height="70px"> <br>Wifi<br>
								<input type="checkbox" name="ho_wifi" value="Wifi" ${not empty dto.ho_wifi ? 'checked' : ''}>
							</div>
							<div>
								<img src="${cpath }/resources/img/28.png" width="70px"
									height="70px"> <br>PC<br>
								<input type="checkbox" name="ho_pc" ${not empty dto.ho_pc ? 'checked' : ''}>
							</div>
							<div>
								<img src="${cpath }/resources/img/10.png" width="70px"
									height="70px"> <br>조식<br>
								<input type="checkbox" name="ho_breakfast" value="PC" ${not empty dto.ho_breakfast ? 'checked' : ''}>
							</div>
							<div>
								<img src="${cpath }/resources/img/50.png" width="70px"
									height="70px"> <br>흡연<br>
								<input type="checkbox" name="ho_smoke"  value="조식" ${not empty dto.ho_smoke ? 'checked' : ''}>
							</div>
							<div>
								<img src="${cpath }/resources/img/18.png" width="70px"
									height="70px"> <br>수영장<br>
								<input type="checkbox" name="ho_pool" value="흡연" ${not empty dto.ho_pool ? 'checked' : ''}>
							</div>
						</div> 
					</td>
				</tr>
				<tr>
					<th>호텔 사진</th>
					<td><input type="file" name="ho_uploadfile" ></td>
				</tr>
			</table>
			<input type="submit"  value="수정 완료">
		</form>
	</div>
	</div>
</div>

</body>


</html>
