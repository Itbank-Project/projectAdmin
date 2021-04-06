<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />

<link rel="stylesheet" href="${cpath }/resources/css/enterHotelInformation.css">

<body>
<main>
		<div class="main-container">
			<div class="main-content" style="margin: 0 auto; width: 680px;">
				<form id="hotelForm" method="POST" enctype="multipart/form-data">
				<div hidden="hidden">
					<input type="text" name="ho_ad_id" value="${login.ad_id }" class="ho_check">
				</div>
				<h3 style="text-align: center;">호텔정보 입력</h3>
				<table class="inputHotelInfo">
					<tr>
						<th>호텔 이름</th>
						<td><input style="all:unset; width: 500px;" type="text" name="ho_name" class="ho_check" autocomplete='off' autofocus="autofocus"></td>
					</tr>
					<tr>
						<th>담당자</th>
						<td>${login.ad_name } 사장님</td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input style="all:unset;  width: 500px;" type="text" name="ho_address" class="ho_check" autocomplete='off'></td>
					</tr>
					<tr>
						<th>체크인</th>
						<td><input style="all:unset;  width: 500px;" type="text" name="ho_check_in" class="ho_check" autocomplete='off'></td>

					</tr>
					<tr>
						<th>체크아웃</th>
						<td><input style="all:unset;  width: 500px;" type="text" name="ho_check_out" class="ho_check" autocomplete='off'></td>
					</tr>
					<tr>
						<th>프론트</th>
						<td><input style="all:unset;  width: 500px;" type="text" name="ho_pnum" class="ho_check" autocomplete='off'></td>
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
						<td><input style="all:unset;  width: 500px;" type="text" name="ho_description" class="ho_check" autocomplete='off'></td>
					</tr>
					<tr>
						<th rowspan="1">업장 내 편의시설</th>
						<td id="img-scroll" colspan="3">
							<div id="img-bundle">
								<div>
									<img src="${cpath }/resources/img/1.png" width="70px" height="70px">
									<br>주차가능<br><input type="checkbox" name="ho_parking" value="주차">
								</div>
								<div>
									<img src="${cpath }/resources/img/37.png" width="70px" height="70px">
									<br>Wifi<br><input type="checkbox" name="ho_wifi" value="Wifi">
								</div>
								<div>
									<img src="${cpath }/resources/img/28.png" width="70px" height="70px">
									<br>PC<br><input type="checkbox" name="ho_pc" value="PC"> 
								</div>
								<div>
									<img src="${cpath }/resources/img/10.png" width="70px" height="70px">
									<br>조식<br><input type="checkbox" name="ho_breakfast" value="조식"> 
								</div>
								<div>
									<img src="${cpath }/resources/img/50.png" width="70px" height="70px">
									<br>흡연<br><input type="checkbox" name="ho_smoke" value="흡연">
								</div>
								<div>
									<img src="${cpath }/resources/img/18.png" width="70px" height="70px">
									<br>수영장<br><input type="checkbox" name="ho_pool" value="수영장">
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>호텔 사진</th>
						<td><input type="file" name="ho_uploadfile" ></td>
					</tr>
				</table>
					<input type="submit"  value="등록">
				</form>
			</div>
		</div>
				<c:if test="${not empty dto }">
				<script type="text/javascript">
					alert('호텔정보를 이미 입력하였습니다.');
					location.href = '${cpath}/hotelInformation';
				</script>
			</c:if>
	
	
</main>
</body>
</html>
