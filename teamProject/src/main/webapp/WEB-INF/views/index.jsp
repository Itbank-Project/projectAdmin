<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
	.dateForm{
		margin-top: 40px;
		margin-bottom: 40px;
	}

	table, th, td {
		border: 1px solid #e7eaec;
		border-spacing: 0px 0px;
	}
	th {
		background-color: #F2F2F2;
	}
	td{
		text-align: center;
	}
	.hidden{
		display: none;
	}

</style>

<main>
	<div class="main-inner">
		<div class="main-container">
			<div class="main-content-head">
				<h3>■ 예약 목록</h3>
			</div>
			<div class="main-content">
			<div class="main-reservation">
				<div>
					<div class="dateForm">
						<form method="POST">
							<span><input type="date" name="startDate"></span>
							<span>to</span>
							<span><input type="date" name="endDate"></span>
							<input type="submit" value="조회" >
						</form>
					</div>
					
					<div>
						<table class="table-content">
							<tr>
								<th colspan="3">숙박</th>
							</tr>
							<tr>
								<td>판매가<div id="sell" style="height:25px; margin-top: 10px;"></div></td>
								<td>예약<div id="reservation" style="height:25px; margin-top: 10px;">
									<c:if test="${not empty reservationCount }">
										${reservationCount }건
									</c:if>
								</div></td>
								<td style="color: red;">취소<div id="cancle" style="height:25px; margin-top: 10px; color: red;">
									<c:if test="${not empty cancelCount }">
										${cancelCount }건
									</c:if>
								</div></td>
							</tr>
						</table>
					</div>
				
				</div>
				
				
				
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
						<th>확인상태</th>
						<th>확인</th>
						<th>취소</th>
					</tr>
					<c:forEach var="dto" items="${list }">
						<tr>
							<td>
							<fmt:formatDate value="${dto.re_paydate }" pattern="yyyy-MM-dd hh:mm"/> </td>
							<td>${dto.cu_name }</td>
							<td><fmt:formatDate value="${dto.re_indate }" pattern="yyyy-MM-dd"/></td>
							<td>${dto.re_daycount }</td>
							<td>${dto.ro_roomType }</td>
							<td class="re_payment" id="re_payment">${dto.re_payment }</td>
							<td>
								<c:if test="${not empty dto.re_canceldate }">
									<fmt:formatDate value="${dto.re_canceldate }" pattern="yyyy-MM-dd"/>
								</c:if>
							</td>
							<td>
								<c:if test="${dto.re_state == 'YES' }" ><div>${dto.re_state == 'YES' ? "예약확인" : "" }</div></c:if>
								<c:if test="${dto.re_cancelYesOrNo == 'Y' }" ><div>${dto.re_cancelYesOrNo == 'Y' ? "취소완료" : "" }</div></c:if>
							
							</td>
							<td><button class="checkBtn" ${dto.re_state == 'YES' || dto.re_cancelYesOrNo == 'Y' ? "disabled" : "" } onclick="chageBtn('${dto.re_idx}','${dto.re_calendar_pk }',event)">확인</button></td>
							<td><button class="cancelBtn" ${dto.re_state == 'YES' || dto.re_cancelYesOrNo == 'Y' ? "disabled" : "" } onclick="cancelBtn('${dto.re_idx}')">취소</button></td>
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
	
	// dto.re_payment의 값들을 더해서 innerText로 넣기
	re_payment.forEach(num => {
		const val =  Number(num.innerText);
		result = result + val;	
		
		// 천단위로 콤마찍는 정규식
		const r1 = result.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		sell.innerText = r1 + '원';
	})
	
	// re_payment가 0 이면 한 줄을 빨간줄표시
	re_payment.forEach(num => {
		if(num.innerText == 0){
			num.parentNode.style.color = 'red';
		}
	})
	
	// 예약확인 버튼을 눌렀을 때,
	function chageBtn(re_idx,re_calendar_pk,event){
		const ho_name = re_calendar_pk.split('-')[1];
		const room = re_calendar_pk.split('-')[2];

		const cal_pk = ho_name +'-'+ room;
		
		const url = cpath + '/status/'+re_idx +'/'+cal_pk +'/';
		const opt = {
				method : 'PUT',
				headers : {
					'Content-Type' : 'application/json;charset-utf8'
				}
		};
		fetch(url,opt)
		.then(resp => resp.text())
		.then(text => {
			if(text != 0){
				alert('확인이 완료되었습니다.');
				location.reload();
			}
		})
		
	}
	
	
	// 취소버튼 눌렀을 때
	function cancelBtn(re_idx){
		
		let check = confirm('정말 취소하시겠습니까?');
		if(check == true){
			const url = cpath + '/status/' + re_idx+'/';
			const opt = {
					method : 'PUT',
					headers : {
						'Content-Type' : 'application/json;charset-utf8'
					}
			};
			fetch(url,opt)
			.then(resp => resp.text())
			.then(text => {
				if(text == 1 ){
					alert('취소가 완료되었습니다');
					location.reload();
				}
			})
		}
		
	}
	
	
	
	
	
	
	</script>
</main>
</body>
</html>
