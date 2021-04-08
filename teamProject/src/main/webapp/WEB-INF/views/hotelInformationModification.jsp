<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<link rel="stylesheet" href="${cpath }/resources/css/hotelInformation.css">

<main>
<div class="main-inner">
	<div class="main-container">
		
		<c:if test="${not empty dto }">
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
								<input type="checkbox" name="ho_parking"  ${not empty dto.ho_parking ? 'checked' : ''}>
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
			<p><a class="info-btn" href="${cpath }/hotelInformationModification"><button id="save">수정</button></a></p>
		</div>
	</c:if>


<c:if test="${empty dto }">
		<script type="text/javascript">
			alert('호텔정보를 입력하지않았습니다.');
			location.href = '${cpath}/enterHotelinformation/' + '${login.ad_id}';
		</script>
</c:if>
		
	<!-- 객실 타입 -->
		<div class="main-content" style="border-top: 4px solid #f3f3f4;">
			
			<c:if test="${empty roomList }">
				<div>
					<p style="text-align: center;"> 객실입력이 완료되지 않았습니다. </p>
				</div>
			</c:if>
			
			<c:if test="${not empty roomList }">
			<c:forEach var="room" items="${roomList }">
			<div id="testDiv" class="selectRoom_type_item" style="border: 1px solid #f3f3f4; margin-bottom: 10px;">
				<input class="ro_pk" type="hidden" value="${room.ro_pk }">
				<div class="room_img" style="background-image: url(http://182.212.181.172:9000/${room.ro_uploadfile });"></div>
				<div class="room_info">
					<div class="room_type" id="room_type${room.ro_pk }">${room.ro_roomtype }</div>
					<div class="room_badType">
						<img src="https://cdn.dailyhotel.com/ux/icon-detail-bed.svg">
						<span id="room_badType${room.ro_pk }">${room.ro_badtype }</span>
					</div>
					<div class="room_limitPerson">
						<img src="https://cdn.dailyhotel.com/ux/icon-detail-people.svg">
						<span id="room_limitPerson${room.ro_pk }">${room.ro_limitperson }인 기준</span>
					</div>
				</div>
				<button id="deleteBtn" class="deleteBtn">삭제</button>
			</div>
			</c:forEach>
			</c:if>
			
			<div class="info-btn">
				<!-- 호텔 정보가 있을 경우에 객실정보 입력 가능 -->
				<c:if test="${not empty dto }">
					<a href="${cpath }/insertRoom/${dto.ho_name}"><button id="saveRoom">객실정보 입력</button></a>
				</c:if>
			</div>
		</div>
	</div>
</div>


<script>
	const checkBox = document.querySelectorAll('input[type="checkbox"]');
	
	checkBox.forEach(check => {
		check.onclick = (event) => {
			return false;
		}
	})
	
	
	
</script>

<script>
	const deleteBtn = document.querySelectorAll('.deleteBtn');
	
	deleteBtn.forEach(ele => {
		ele.onclick = (event)=> {
			alert('🔥관리자(010-3909-3952)에게 문의바랍니다.🔥');
		}
	})
</script>
</main>
</body>
</html>
