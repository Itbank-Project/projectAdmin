<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
	table, th, td {
		border: 1px solid #e7eaec;
		border-spacing: 0px 0px;
	}
	th {
		background-color: #F2F2F2;
	}
</style>

<main>
	<div class="main-inner">
		<div class="main-container">
			<div class="main-content-head">
				<h3>조회 조건</h3>
			</div>
			<div class="main-content">
				<div>
					<h3>■ 정산/입금 확인법</h3>
					<ul>
						<li><p>• 주별입금 : 월요일부터 일요일까지 체크아웃건</p></li>
						<li><p>• 입금 방식에 따라 날짜 및 구분방식 선택 후 조회하시면 해당 입금내역을 확인/다운로드 하실 수 있습니다.</p></li>
					</ul>
					<form method="POST">
						<span><input type="date" name="startDate"></span>
						<span>to</span>
						<span><input type="date" name="endDate"></span>
						<input type="submit" value="조회" >
					</form>
					<br><br>
					<table class="table-content">
						<tr>
							<th colspan="4">숙박</th>
						</tr>
						<tr>
							<td>판매가<div id="sell" style="height:25px; margin-top: 10px;"></div></td>
							<td>예약<div id="reservation" style="height:25px; margin-top: 10px;">
								<c:if test="${not empty reservationCount }">
									${reservationCount }건
								</c:if>
							</div></td>
							<td>취소<div id="cancle" style="height:25px; margin-top: 10px;">
								<c:if test="${not empty cancleCount }">
									${cancleCount }건
								</c:if>
							</div></td>
						</tr>
					</table>
				</div>
			</div>
			<!-- end main-content -->
			<br> <br>
			<div class="main-content">
			<div class="main-reservation">
				<h3>■ 예약 목록</h3>
				<hr>
				<br>
				<table class="table-reservation">
					<tr>
						<th>결제일시</th>
						<th>투숙자명</th>
						<th>체크인</th>
						<th>박수</th>
						<th>객실명</th>
						<th>판매가</th>
						<th>취소일시</th>
						<th>예약확인상태</th>
						<th>예약확인</th>
						<th>상세</th>
					</tr>
					<c:forEach var="dto" items="${list }">
						<tr>
							<td><fmt:formatDate value="${dto.re_payDate }" pattern="yyyy-MM-dd hh:mm"/> 
							<td>${dto.cu_name }</td>
							<td><fmt:formatDate value="${dto.re_inDate }" pattern="yyyy-MM-dd"/></td>
							<td>${dto.re_dayCount }</td>
							<td>${dto.ro_roomType }</td>
							<td class="re_payment" id="re_payment">${dto.re_payment }</td>
							<td>
								<c:if test="${not empty dto.re_cancelDate }">
									<fmt:formatDate value="${dto.re_cancelDate }" pattern="yyyy-MM-dd"/>
								</c:if>
							</td>
							<td></td>
							<td></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			</div>
		</div>
		<!-- end main-container -->
	</div>
	<!-- end main-inner -->
	
	
	<script>
	const re_payment = document.querySelectorAll('.re_payment');
	
	const length = re_payment.length;
	let result = 0;
	const sell = document.getElementById('sell');
	const deposit = document.getElementById('deposit');
	
	// dto.re_payment의 값들을 더해서 innerText로 넣기
	re_payment.forEach(num => {
		const val =  Number(num.innerText);
		result = result + val;	
		
		// 천단위로 콤마찍는 정규식
		const r1 = result.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		
		sell.innerText = r1 + '원';
		deposit.innerText = r1 + '원';
	})
	
	
	// re_payment가 0 이면 한 줄을 빨간줄표시
	re_payment.forEach(num => {
		if(num.innerText == 0){
			console.log('g');
			num.parentNode.style.backgoundcolor ='red';
			num.style.color = 'red';
		}
	})
	
	
	
	</script>
</main>
</body>
</html>
