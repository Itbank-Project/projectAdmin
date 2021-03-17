<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<main>
	<div class="main-inner">
		<div class="main-container">
			<div class="main-content-head">
				<h3>조회 조건</h3>
			</div>
			<div class="main-content">
				<div>
					<h3>데일리 정산/입금 확인법</h3>
					<ul>
						<li><p>• 주별입금 : 월요일부터 일요일까지 체크아웃건</p></li>
						<li><p>• 월별입금 : 1일부터 말일까지 체크아웃건</p></li>
						<li><p>• 반달입금 : 매월 상반기(1~15일), 하반기(16~말일)까지 체크아웃건</p></li>
						<li><p>• 입금 방식에 따라 날짜 및 구분방식 선택 후 조회하시면 해당 입금내역을 확인/다운로드
								하실 수 있습니다.</p></li>
					</ul>
					<form>
						<span><input type="date"></span>
						<span>to</span>
						<span><input type="date"></span>
						<span><select name="" id="">
								<option value="결제일">결제일</option>
						</select></span>
						<br><br>
						<input type="checkbox" value="예약 미확인건">예약미확인건
						<input type="checkbox" value="취소건">취소건
						<input type="text" placeholder="투숙자명">
						<input type="text" placeholder="전화번호">
						<input type="submit" value="조회">
					</form>
					<br><br>
					<table class="table-content">
						<tr>
							<th colspan="4">대실</th>
							<th colspan="4">숙박</th>
						</tr>
						<tr>
							<td>입금가</td>
							<td>판매가</td>
							<td>예약</td>
							<td>취소</td>
							<td>입금가</td>
							<td>판매가</td>
							<td>예약</td>
							<td>취소</td>
						</tr>
					</table>
				</div>
			</div>
			<!-- end main-content -->
			<br> <br>
			<div class="main-reservation">
				<h3>
					예약 목록
					<button class="resultDownload">조회결과 다운로드</button>
				</h3>
				<hr>
				<br>
				<table class="table-reservation">
					<tr>
						<th>↓ 결제일시</th>
						<th>투숙자명</th>
						<th>유형</th>
						<th>체크인</th>
						<th>박수/이용시간</th>
						<th>하드블럭</th>
						<th>판매타입</th>
						<th>객실명</th>
						<th>판매가(최종매출가)</th>
						<th>조정된 입금가</th>
						<th>취소일시</th>
						<th>예약확인상태</th>
						<th>예약확인</th>
						<th>방문방법</th>
						<th>상세</th>
					</tr>
					<tr>

					</tr>
				</table>
			</div>
		</div>
		<!-- end main-container -->
	</div>
	<!-- end main-inner -->
</main>
</body>
</html>