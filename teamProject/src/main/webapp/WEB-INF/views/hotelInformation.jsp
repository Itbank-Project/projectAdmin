<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<link rel="stylesheet" href="${cpath }/resources/css/hotelInformation.css">

<main>
<div class="main-inner">
	<div class="main-container">
		<div class="main-content-head">
			<h3><span style="color:#fd79a8 ">${dto.ho_name }</span> Hotel</h3>
			<input type="hidden" id="userid" name="ho_ad_id" value="${login.ad_id }">
		</div>
		<div class="main-content">
			<table style="width: 659px;">
				<tr>
					<th>호텔 이름</th>
					<td>${dto.ho_name }</td>
				</tr>
				<tr>
					<th>담당자</th>
					<td>${login.ad_name }</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${dto.ho_address }</td>
				</tr>
				<tr>
					<th>체크인</th>
					<td>${dto.ho_check_in }</td>
				</tr>
				<tr>
					<th>체크아웃</th>
					<td>${dto.ho_check_out }</td>
				</tr>
				<tr>
					<th>프론트</th>
					<td>${dto.ho_pnum }</td>
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
					<td>${dto.ho_description }</td>
				</tr>
				<tr>
					<th rowspan="1">업장 내 편의시설</th>
					<td id="img-scroll" colspan="3">
						<div id="img-bundle">
							<div>
								<img src="${cpath }/resources/img/1.png" width="70px"
									height="70px"> <br>주차가능<br>
								<input type="checkbox" name="ho_parking"  ${not empty dto.ho_parking ? 'checked' : ''} onclick="return false">
							</div>
							<div>
								<img src="${cpath }/resources/img/37.png" width="70px"
									height="70px"> <br>Wifi<br>
								<input type="checkbox" name="ho_wifi"  ${not empty dto.ho_wifi ? 'checked' : ''}>
							</div>
							<div>
								<img src="${cpath }/resources/img/28.png" width="70px"
									height="70px"> <br>PC<br>
								<input type="checkbox" name="ho_pc" ${not empty dto.ho_pc ? 'checked' : ''}>
							</div>
							<div>
								<img src="${cpath }/resources/img/10.png" width="70px"
									height="70px"> <br>조식<br>
								<input type="checkbox" name="ho_breakfast" ${not empty dto.ho_breakfast ? 'checked' : ''}>
							</div>
							<div>
								<img src="${cpath }/resources/img/50.png" width="70px"
									height="70px"> <br>흡연<br>
								<input type="checkbox" name="ho_smoke"  ${not empty dto.ho_smoke ? 'checked' : ''}>
							</div>
							<div>
								<img src="${cpath }/resources/img/18.png" width="70px"
									height="70px"> <br>수영장<br>
								<input type="checkbox" name="ho_pool" ${not empty dto.ho_pool ? 'checked' : ''}>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th>호텔사진</th>
					<td>${dto.ho_uploadfile }</td>
				</tr>
			</table>
			<!-- 호텔 정보가 있을 경우에 객실정보 입력 가능 -->
			<div class="info-btn">
				<c:if test="${not empty dto }">
					<a href="${cpath }/insertRoom/${dto.ho_name}"><button id="saveRoom">객실정보입력</button></a>
				</c:if>
				<a href="${cpath }/hotelInformationModification"><button id="save">수정</button></a>
			</div>
		</div>
	</div>
</div>
</main>

<script>
	const checkBox = document.querySelectorAll('input[type="checkbox"]');
	
	checkBox.forEach(check => {
		check.onclick = (event) => {
			return false;
		}
	})
	
	
	
</script>


</body>
</html>
