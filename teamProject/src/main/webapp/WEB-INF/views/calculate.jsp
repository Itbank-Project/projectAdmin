<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<style>
	table {
		border: 1px solid black;
		border-collapse: collapse;
	}
	th, td {
		border: 1px solid black;
		padding: 10px;
		text-align: center;
	}
	th {
		background-color: #F2F2F2;
	}
	#daySelect {
		width: 400px;
	    margin-top: 20px;
	    margin-bottom: 20px;
	}
	#yearSelect{
	    width: 50px;
	    margin-right: 10px;
	}
	#yearSelect > select{
	    width: 150px;
	    height: 30px;
	}
	#monthSelect{
	    margin-right: 10px;
	}
	#monthSelect > select {
		width: 50px;
		height: 30px;
	}
	#searchBtn {
	  appearance: none;
	  background: #0d6efd;
	  color: #ffffff;
	  height: 30px;
	  border-radius: 10px;
	}
</style>

<main>
	<div class="main-inner">
		<div class="main-container">
			<div class="main-content-head">
				<h3>정산</h3>
			</div>
			<div class="main-content">
				<div>
					<h4>■ 정산 기본 정보</h4>
					<table class="infoTable">
						<tr>
							<th>정산방식</th>
							<th>계좌번호</th>
							<th>입금은행</th>
							<th>예금주</th>
						</tr>
						<tr>
							<td>주별</td>
							<td>${dto.ad_account }</td>
							<td>${dto.ad_bank }</td>
							<td>${dto.ad_name }</td>
						</tr>
					</table>
				</div>
				<br>
				<div id="daySelect">
					<span id="yearSelect"> 
						<select>
							<option>2021년</option>
						</select>
					</span> 
					<span id="monthSelect"> 
					<select>
							<option>1월</option>
							<option>2월</option>
							<option>3월</option>
							<option>4월</option>
							<option>5월</option>
							<option>6월</option>
							<option>7월</option>
							<option>8월</option>
							<option>9월</option>
							<option>10월</option>
							<option>11월</option>
							<option>12월</option>
					</select>
					</span> 
					<span>
						<button id="searchBtn">검색</button>
					</span>
				</div>
				
				<div>
					<div style="width: 1000px; display: flex; justify-content: space-between;">
						<div><h4>■ 정산 내역</h4></div>
						<div style="margin-top: 20px;">
							<span id="yearSelect"> 
							<select>
								<option>2021년</option>
								<option>2022년</option>
								<option>2023년</option>
							</select>
							</span> 
							<span id="monthSelect"> 
							<select>
									<option>1월</option>
									<option>2월</option>
									<option>3월</option>
									<option>4월</option>
									<option>5월</option>
									<option>6월</option>
									<option>7월</option>
									<option>8월</option>
									<option>9월</option>
									<option>10월</option>
									<option>11월</option>
									<option>12월</option>
							</select>
							</span> 
							<span>
								<button id="searchBtn">검색</button>
							</span>
						</div>
					</div>
					
					<table class="calTable" style="width: 1000px">
						<tr>
							<th>정산방식</th>
							<th>정산기간</th>
							<th>입금가</th>
							<th>총입금액</th>
							<th>정산금액</th>
							<th>입금일자</th>
							<th>메모</th>
						</tr>
						<tr>
							<td>주별</td>
							<td style="color: #0d6efd;"><b>2020.12.26~2021.01.03</b></td>
							<td>106,000원</td>
							<td>108,000원</td>
							<td>108,000원</td>
							<td>2021-01-07</td>
							<td>2020. 12. 28~20 21. 1. 3 체크인, 주정산</td>
						</tr>
					</table>

				
			</div>
			<!-- end main-content -->
		</div>
		<!-- end main-container -->
	</div>
	<!-- end main-inner -->
</main>
</body>
</html>
