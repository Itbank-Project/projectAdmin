<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<style>
#hotel {
	width: 60px;
	height: 30px;
	color: white;
	background-color: brown;
	border-radius: 10px;
	border: 0;
	outline: 0;
}

table, th, td {
	border: 1px solid #e7eaec;
	border-spacing: 0px 0px;
}

th {
	background-color: #F2F2F2;
}

#save {
	width: 110px;
	color: white;
	background-color: #00BFFF;
	outline: 0;
	border-radius: 5px;
}

#save:hover {
	box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0
		rgba(0, 0, 0, 0.19);
}

label {
	text-align: center;
	margin: 5px;
}

#img-bundle {
	display: flex;
}

#img-bundle > div {
	margin: 10px;
	text-align: center;
	font-size: 12px;
}
</style>

<main>
<div class="main-inner">	
	<div class="main-container">
		<div class="main-content-head">
			<h3>
				<button id="hotel">
					<b>부띠끄</b>
				</button>
				여기에는 호텔명 들어갈 자리 ~
			</h3>
		</div>
		<div class="main-content">
			<div style="text-align: center;">
			<table>
				<tr>
					<th>등급</th>
					<td>부띠끄</td>
					<th>지역</th>
					<td>부산 - 해운대 - 해운대</td>
				</tr>
				<tr>
					<th>담당자</th>
					<td>홍길동 사장님</td>
					<th></th>
					<td></td>
				</tr>
				<tr>
					<th>주소</th>
					<td>부산 해운대구 센텀2로 25 센텀드림월드 11층</td>
					<th>연박</th>
					<td>가능</td>
				</tr>
				<tr>
					<th>위치</th>
					<td>해운대구 | 센텀시티 2호선 9번 출구 도보 5분</td>
					<th>객실수</th>
					<td><input type="text" placeholder="보유 객실 수 입력">개</td>
				</tr>
				<tr>
					<th>체크인</th>
					<td>16:00</td>
					<th>체크아웃</th>
					<td>12:00</td>
				</tr>
				<tr>
					<th>대실 오픈</th>
					<td>10:00</td>
					<th>대실 마감</th>
					<td>23:00</td>
				</tr>
				<tr>
					<th>대실 사용시간</th>
					<td>3시간</td>
					<th></th>
					<td></td>
				</tr>
				<tr>
					<th rowspan="3">전화</th>
					<td>예약실 : 미입력</td>
					<th rowspan="7">예약문자수신</th>
					<td><label><input type="checkbox">예약 문자 수신</label><br>*
						객실판매 시 문자알림 기능 / 최대 5개까지 설정 가능</td>
				</tr>
				<tr>
					<td>프론트 : 051-123-4567</td>
					<td><input type="text" placeholder="수신 휴대폰 번호 1"></td>
				</tr>
				<tr>
					<td>관리자 : 010-1234-5678</td>
					<td><input type="text" placeholder="수신 휴대폰 번호 2"></td>
				</tr>
				<tr>
					<th rowspan="2">팩스</th>
					<td>예약실 : 051-123-4567</td>
					<td><input type="text" placeholder="수신 휴대폰 번호 3"></td>
				</tr>
				<tr>
					<td>프론트 : 미입력</td>
					<td><input type="text" placeholder="수신 휴대폰 번호 4"></td>
				</tr>
				<tr>
					<th rowspan="2">이메일</th>
					<td>itbank@itbank.com</td>
					<td><input type="text" placeholder="수신 휴대폰 번호 5"></td>
				</tr>
				<tr>
					<td>미입력</td>
					<td></td>
				</tr>
				<tr>
					<th rowspan="9">업장 내 편의시설</th>
					<td id="img-scroll" colspan="3" >
						<div id="img-bundle">
							<div>
								<img src="${cpath }/resources/img/1.png" width="70px"
									height="50px"><br> 주차가능<br> <input
									type="checkbox">
							</div>
							<div>
								<img src="${cpath }/resources/img/2.png" width="70px"
									height="50px"><br> 주차불가<br> <input
									type="checkbox">
							</div>
							<div>
								<img src="${cpath }/resources/img/3.png" width="70px"
									height="50px"><br> 픽업가능<br> <input
									type="checkbox">
							</div>
							<div>
								<img src="${cpath }/resources/img/4.png" width="70px"
									height="50px"><br> 공항셔틀<br> <input
									type="checkbox">
							</div>
							<div>
								<img src="${cpath }/resources/img/5.png" width="70px"
									height="50px"><br> 레스토랑<br> <input
									type="checkbox">
							</div>
							<div>
								<img src="${cpath }/resources/img/6.png" width="70px"
									height="50px"><br> 카페테리아<br> <input
									type="checkbox">
							</div>
							<div>
								<img src="${cpath }/resources/img/7.png" width="70px"
									height="50px"><br> 부페<br> <input
									type="checkbox">
							</div>
							<div>
								<img src="${cpath }/resources/img/8.png" width="70px"
									height="50px"><br> 다이닝룸<br>
									 <input type="checkbox">
							</div>
							<div>
								<img src="${cpath }/resources/img/9.png" width="70px"
									height="50px"><br> 식사가능<br> <input
									type="checkbox">
							</div>
						</div> <!-- 						</td> -->
							<tr>
								<td id="img-scroll" colspan="3">
								<div id="img-bundle">
									<div>
										<img src="${cpath }/resources/img/10.png" width="70px"
											height="50px"><br> 조식당<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/11.png" width="70px"
											height="50px"><br> 조식운영<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/12.png" width="70px"
											height="50px"><br> 바<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/13.png" width="70px"
											height="50px"><br> 스낵바<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/14.png" width="70px"
											height="50px"><br> 셀러드바<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/15.png" width="70px"
											height="50px"><br> 개별바베큐<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/16.png" width="70px"
											height="50px"><br> 바베큐<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/17.png" width="70px"
											height="50px"><br> 공용바베큐<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/18.png" width="70px"
											height="50px"><br> 수영장<br> <input
											type="checkbox">
									</div>
								</div>
								</td>
							</tr>
							<tr>
								<td id="img-scroll" colspan="3">
								<div id="img-bundle">
									<div>
										<img src="${cpath }/resources/img/19.png" width="70px"
											height="50px"><br> 야외수영장<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/20.png" width="70px"
											height="50px"><br> 스파/월풀<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/21.png" width="70px"
											height="50px"><br> 스파마사지<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/22.png" width="70px"
											height="50px"><br> 사우나<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/23.png" width="70px"
											height="50px"><br> 찜질방<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/24.png" width="70px"
											height="50px"><br> 노천탕<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/25.png" width="70px"
											height="50px"><br> 히노끼탕<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/26.png" width="70px"
											height="50px"><br> 수화물보관<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/27.png" width="70px"
											height="50px"><br> 24시간데스크<br> <input
											type="checkbox">
									</div>
								</div>
								</td>
							</tr>
							<tr>
								<td id="img-scroll" colspan="3">
								<div id="img-bundle">
									<div>
										<img src="${cpath }/resources/img/28.png" width="70px"
											height="50px"><br> 노트북대여<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/29.png" width="70px"
											height="50px"><br> 자전거대여<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/30.png" width="70px"
											height="50px"><br> 아기침대대여<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/31.png" width="70px"
											height="50px"><br> 무료영화<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/32.png" width="70px"
											height="50px"><br> 상비약<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/33.png" width="70px"
											height="50px"><br> 기본양념<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/34.png" width="70px"
											height="50px"><br> 비즈니스센터<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/35.png" width="70px"
											height="50px"><br> 세미나실<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/36.png" width="70px"
											height="50px"><br> 연회장<br> <input
											type="checkbox">
									</div>
								</div>
								</td>
							</tr>
							<tr>
								<td id="img-scroll" colspan="3">
								<div id="img-bundle">
									<div>
										<img src="${cpath }/resources/img/37.png" width="70px"
											height="50px"><br> 무료Wifi<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/38.png" width="70px"
											height="50px"><br> 피트니스<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/39.png" width="70px"
											height="50px"><br> 클럽라운지<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/40.png" width="70px"
											height="50px"><br> PC라운지<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/41.png" width="70px"
											height="50px"><br> 키즈플레이룸<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/42.png" width="70px"
											height="50px"><br> 편의점(예정)<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/43.png" width="70px"
											height="50px"><br> 무료세탁<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/44.png" width="70px"
											height="50px"><br> 유료세탁<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/45.png" width="70px"
											height="50px"><br> 노래방<br> <input
											type="checkbox">
									</div>
								</div>
								</td>
							</tr>
							<tr>
								<td id="img-scroll" colspan="3">
								<div id="img-bundle">
									<div>
										<img src="${cpath }/resources/img/46.png" width="70px"
											height="50px"><br> 운동장<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/47.png" width="70px"
											height="50px"><br> 족구장<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/48.png" width="70px"
											height="50px"><br> 공용주방<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/49.png" width="70px"
											height="50px"><br> 공용거실<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/50.png" width="70px"
											height="50px"><br> 흡연구역<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/51.png" width="70px"
											height="50px"><br> 독채펜션<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/52.png" width="70px"
											height="50px"><br> 무인텔<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/53.png" width="70px"
											height="50px"><br> 프렌차이즈<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/54.png" width="70px"
											height="50px"><br> 여성전용<br> <input
											type="checkbox">
									</div>
								</div>
								</td>
							</tr>
							<tr>
								<td id="img-scroll" colspan="3">
								<div id="img-bundle">
									<div>
										<img src="${cpath }/resources/img/55.png" width="70px"
											height="50px"><br> 한옥<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/56.png" width="70px"
											height="50px"><br> 계곡인접<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/57.png" width="70px"
											height="50px"><br> 해수욕장인근<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/58.png" width="70px"
											height="50px"><br> 바다전망<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/59.png" width="70px"
											height="50px"><br> 어에니티<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/60.png" width="70px"
											height="50px"><br> 객실내PC<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/61.png" width="70px"
											height="50px"><br> 커플PC<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/62.png" width="70px"
											height="50px"><br> 3DTV<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/63.png" width="70px"
											height="50px"><br> VOD<br> <input
											type="checkbox">
									</div>
								</div>
								</td>
							</tr>
							<tr>
								<td id="img-scroll" colspan="3">
								<div id="img-bundle">
									<div>
										<img src="${cpath }/resources/img/64.png" width="70px"
											height="50px"><br> 프로젝트<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/65.png" width="70px"
											height="50px"><br> 반려동물<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/66.png" width="70px"
											height="50px"><br> 미니바<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/67.png" width="70px"
											height="50px"><br> 주방<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/68.png" width="70px"
											height="50px"><br> 벽난로<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/69.png" width="70px"
											height="50px"><br> 파티룸<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/70.png" width="70px"
											height="50px"><br> 루프탑<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/71.png" width="70px"
											height="50px"><br> 도미토리<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/72.png" width="70px"
											height="50px"><br> 야외테라스<br> <input
											type="checkbox">
									</div>
								</div>
								</td>
							</tr>
							<tr>
								<td id="img-scroll" colspan="3">
								<div id="img-bundle">
									<div>
										<img src="${cpath }/resources/img/73.png" width="70px"
											height="50px"><br> 복층구조<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/74.png" width="70px"
											height="50px"><br> 독체객실<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/75.png" width="70px"
											height="50px"><br> 글램핑<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/76.png" width="70px"
											height="50px"><br> 프로포즈<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/77.png" width="70px"
											height="50px"><br> 이벤트 기능<br> <input
											type="checkbox">
									</div>
									<div>
										<img src="${cpath }/resources/img/78.png" width="70px"
											height="50px"><br> 파티가능<br> <input
											type="checkbox">
									</div>
								</div>
								</td>
							</tr>
							
			</table>
			<button id="save">저장</button>
			</div>
		</div>
		<!-- end main-content -->
	</div>
	<!-- end main-container -->
</div>
<!-- end main-inner -->
</main>
<footer> ITBANK 2조 팀프로젝트 </footer>
</body>
</html>