<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="${cpath }/resources/css/style.css">
<c:if test="${countAll !=  0}" >
	<c:set var="allPer" value="${100/countAll }"></c:set>
	<c:set var="goodPer" value="${allPer * goodCount }"></c:set>
</c:if>

<style>
	.reply_modal {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	.reply_modal_overlay {
		background-color: rgba(0, 0, 0, 0.6);
		width: 100%;
		height: 100%;
		position: absolute;
	}
	
	.reply_modal_content {
		background-color: white;
		text-align: center;
		position: relative;
		min-width: 300px;
		width: 50%;
		max-width: 400px;
		z-index: 1;
		border-radius: 40px;
	}
	.hidden {
		display: none;
	}
	#replyOK{
		background-color: #fab1a0;
		border: none;
	    color: #2d3436;
	    font-weight: bold;
	    font-size:15px;
		text-decoration: none;
		cursor: pointer;
		width: 100px;
		height: 40px;
	}
	#replyOK:hover {
		box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0
			rgba(0, 0, 0, 0.19);
	}
	.GP {
 		width: <fmt:parseNumber value="${goodPer }" integerOnly="true"></fmt:parseNumber>%; 
		text-align: right;
		padding-top: 10px; 
		padding-bottom: 10px;
		color: white;
		background-color: #fd79a8;
	}
</style>

<main>
	<div class="main-inner">
		<div class="main-container">
			<div class="main-content-head">
				<h3>만족도 & 자바리뷰</h3>
			</div>
			<div class="main-content">
				<div class="main-content-inner">
					
					<div class="div2">
						<h4>만족/불만족 건수(전체 기간 누적)</h4>
						<table border="1">
							<tr>
								<th>만족</th>
								<th>불만족</th>
								<th>전체</th>
							</tr>
							<tr>
								<td>${goodCount }건</td>
								<td>${countAll - goodCount }건</td>
								<td>${countAll }건</td>
							</tr>
						</table>
					</div>
					
					<div class="div1">
						<h4>만족도</h4>
						<div class="GoodP" style="width: 393px; background-color: #ddd;">
							<div class="GP"><fmt:parseNumber value="${goodPer }" integerOnly="true"></fmt:parseNumber> %</div>
						</div>
					</div>
				</div>
				
				<div class="div4">
					<p>* 자바호텔의 트루리뷰는 익명으로 작성되고 있습니다. 따라서, 리뷰내용을 바탕으로 작성자를 추측하여 직접
						연락하실 수 없습니다.</p>
					<p>* 스테이의 세부 항목 평점(청결, 위치, 서비스, 시설)과 만족도는 주기적으로 업데이트 됩니다.</p>
					<p>* 추가 문의사항은 자바 컨시어지팀(02-1800-5120)으로 문의주시기 바랍니다.</p>
				</div>
				<div class="div5">
					<h4>리뷰 목록</h4>
					<table border="1">
						<tr>
							<th style="width: 100px;">작성일</th>
							<th style="width: 100px;">작성자</th>
							<th style="width: 100px;">만족여부</th>
							<th style="width: 100px;">평가</th>
							<th style="width: 700px;">의견/답글</th>
							<th style="width: 100px;">관리</th>
						</tr>
						<c:forEach var="review" items="${list }">
						<input type="hidden" value="${review.review_idx }">
							<tr>
								<td style="width: 180px; "><fmt:formatDate value="${review.review_credate }" pattern="yyyy년 MM월 dd일"/></td>
								<td id="id${review.review_idx }">${review.review_cu_id }</td>
								<td>${review.review_goodORbad }</td>
								<td style="width: 180px;">
									<c:forEach var="i" begin="1" end="${review.review_score }" step="1">
										<img style="width: 20px; height: 20px;" src="${cpath }/resources/img/i_star_on.png">
									</c:forEach>
								</td>
								<td id="opinion${review.review_idx }">${review.review_opinion }</td>
								<td><button id="replyOK" class="replyBtn">답글 달기</button></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<!-- end main-content -->
		</div>
		<!-- end main-container -->
	</div>
	<!-- end main-inner -->
	
	<!-- 답글 버튼 눌렸을 때 답글 작성 창 뜨기 -->
<div class="reply_modal hidden">
	<div class="reply_modal_overlay"></div>	<!-- 모달 이외 나머지부분 어둡게 -->
	<div class="reply_modal_content">	<!-- 표시할 내용 -->
	
		<form id="replyForm" method="POST">
			<p style="font-weight: bold;">답글달기</p>
			<input type="hidden" name="reply_review_idx" class="review_idx">
			<input type="hidden" name="reply_ho_name" value="${dto.ho_name }">
			<p><textarea class="review_opinion" rows="4" cols="35" style="resize: none; font-weight: bold;" readonly></textarea></p>
			<p><textarea name="reply_opinion" rows="4" cols="35" style="resize: none;"></textarea></p>
			<p><input type="submit" value="작성완료"></p>
		</form>
		
	</div>	
</div>
</main>

<script type="text/javascript">
	
	const replyBtn = document.querySelectorAll('.replyBtn');
	const reply_modal = document.querySelector('.reply_modal');
	const reply_modal_overlay = document.querySelector('.reply_modal_overlay');
	const replyForm = document.getElementById('replyForm');
	const review_opinion = document.querySelector('.review_opinion');
	const review_idx = document.querySelector('.review_idx');
	
	replyBtn.forEach(ele => {
		ele.onclick = (event) => {
			reply_modal.classList.remove('hidden');
			const idx = event.target.parentNode.parentNode.previousElementSibling.value;
			const opinion = document.getElementById('opinion' + idx).innerText;
			review_idx.value = idx;
			review_opinion.innerText = opinion;
		}
	})
	
	replyForm.onsubmit = function(event){
		event.preventDefault();
		const formData = new FormData(replyForm);
		const ob = {};
		
		for(const [key, value] of formData.entries()){
			ob[key] = value;
		}
		
		const url = '${cpath}/trueReview';
		const opt = {
				method: 'POST',
				body: JSON.stringify(ob),
				headers: {
					'Content-Type' : 'application/json;charset-utf8'
				}
		};
		
		fetch(url, opt)
		.then(resp => resp.text())
		.then(text => {
			if(text == 1){
				alert('답글이 등록되었습니다');
				location.href = '${cpath}/trueReview';
			}
		})
		
	}
	
	reply_modal_overlay.onclick = function(){
		reply_modal.classList.add('hidden');
	}
	
</script>

</body>
</html>
