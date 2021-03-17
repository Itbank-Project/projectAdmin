<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="${cpath }/resources/css/style.css">
<main>
	<div class="main-inner">
		<div class="main-container">
			<div class="main-content-head">
				<h3>만족도 & 트루리뷰</h3>
			</div>
			<div class="main-content">
				<div class="main-content-inner">
					<div class="div1">
						<h4>만족도</h4>
						<table>
							<tr>
								<th>만족도</th>
							</tr>
							<tr>
								<td>71%가 만족<br>(최근 100건 기준)
								</td>
							</tr>
						</table>
					</div>
					<div class="div2">
						<h4>만족/불만족 건수(전체 기간 누적)</h4>
						<table border="1">
							<tr>
								<th>만족</th>
								<th>불만족</th>
								<th>전체</th>
							</tr>
							<tr>
								<td>96건</td>
								<td>36건</td>
								<td>132건</td>
							</tr>
						</table>
					</div>
					<div class="div3">
						<h4>세분화 점수(총 69건의 세분화 점수 조사)</h4>
						<table border="1">
							<tr>
								<th>청결</th>
								<th>위치</th>
								<th>서비스</th>
								<th>시설</th>
							</tr>
							<tr>
								<td>3.8/5</td>
								<td>4.2/5</td>
								<td>3.7/5</td>
								<td>3.8/5</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="div4">
					<p>* 데일리호텔의 트루리뷰는 익명으로 작성되고 있습니다. 따라서, 리뷰내용을 바탕으로 작성자를 추측하여 직접
						연락하실 수 없습니다.</p>
					<p>* 앱상에 노출되는 만족도는 *최근 100건*의 고객 만족도 평가를 기준으로 표시합니다. (단 만족도는
						의견이 11건 이상 수집된 후에 앱상에 노출됩니다.)</p>
					<p>* 스테이의 세부 항목 평점(청결, 위치, 서비스, 시설)과 만족도는 주기적으로 업데이트 됩니다.</p>
					<p>* 추가 문의사항은 데일리 컨시어지팀(02-1800-5120)으로 문의주시기 바랍니다.</p>
				</div>
				<div class="main-content-checkbox">
					<p>
						<input type="checkbox" value="모두">모두
					</p>
					<p>
						<input type="checkbox" value="만족">만족
					</p>
					<p>
						<input type="checkbox" value="불만족">불만족
					</p>
					<p>
						<input type="checkbox" value="메시지만">메시지만
					<p>
						<input type="button" value="검색">
					</p>
				</div>
				<div class="div5">
					<table border="1">
						<tr>
							<th style="width: 100px;">작성일</th>
							<th style="width: 100px;">만족여부</th>
							<th style="width: 100px;">평가</th>
							<th style="width: 100px;">방문유형</th>
							<th style="width: 700px;">의견/답글</th>
							<th style="width: 100px;">관리</th>
						</tr>
						<tr>
							<td>2021-02-25 20:17:48</td>
							<td>만족</td>
							<td>청결 : 3 <br> 시설 : 3 <br> 서비스 : 1 <br> 위치 :
								3
							</td>
							<td>커플 여행</td>
							<td>너무 좋아요 !</td>
							<td><button>작성</button></td>
						</tr>
					</table>
				</div>
			</div>
			<!-- end main-content -->
		</div>
		<!-- end main-container -->
	</div>
	<!-- end main-inner -->
</main>

</body>
</html>