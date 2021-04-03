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
		z-index: 1;
		height: 300px;
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
	
	.GP1 {
 		width: 0; 
		text-align: right;
		padding-top: 10px; 
		padding-bottom: 10px;
		color: black;
		background-color: #fd79a8;
	}
	
	.GP2 {
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
						<h4>■ 만족/불만족 건수(전체 기간 누적)</h4>
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
						<h4>■ 만족도</h4>
						<c:if test="${empty goodPer}">
							<div class="GoodP" style="width: 393px; background-color: #ddd;">
								<div class="GP1"><fmt:parseNumber value="${goodPer }" integerOnly="true"></fmt:parseNumber> 0%</div>
							</div>
						</c:if>
						<c:if test="${not empty goodPer}">
							<div class="GoodP" style="width: 393px; background-color: #ddd;">
								<div class="GP2"><fmt:parseNumber value="${goodPer }" integerOnly="true"></fmt:parseNumber> %</div>
							</div>
						</c:if>
					</div>
				</div>
				
				<div class="div4">
					<h4>■ 설명</h4>
					<p>* 자바호텔의 트루리뷰는 익명으로 작성되고 있습니다. 따라서, 리뷰내용을 바탕으로 작성자를 추측하여 직접
						연락하실 수 없습니다.</p>
					<p>* 스테이의 세부 항목 평점(청결, 위치, 서비스, 시설)과 만족도는 주기적으로 업데이트 됩니다.</p>
					<p>* 추가 문의사항은 자바 컨시어지팀(02-1800-5120)으로 문의주시기 바랍니다.</p>
				</div>
				<div class="div5">
					<h4>■ 리뷰 목록</h4>
					<table border="1">
						<tr>
							<th style="width: 100px; height: 30px;">작성일</th>
							<th style="width: 100px;">작성자</th>
							<th style="width: 100px;">만족여부</th>
							<th style="width: 100px;">평가</th>
							<th style="width: 700px;">리뷰 내용</th>
							<th style="width: 100px;">관리</th>
						</tr>
						<c:forEach var="review" items="${list }">
						<input id="review_idx" type="hidden" value="${review.review_idx }">
							<tr>
								<td id="review_credate${review.review_idx }" style="width: 180px; height: 30px;"><fmt:formatDate value="${review.review_credate }" pattern="yyyy년 MM월 dd일"/></td>
								<td id="id${review.review_idx }">${review.review_cu_id }</td>
								<td id="YorN${review.review_idx }">${review.review_goodORbad }</td>
								<td style="width: 180px;">
									<c:forEach var="i" begin="1" end="${review.review_score }" step="1">
										<img style="width: 20px; height: 20px;" src="${cpath }/resources/img/i_star_on.png">
									</c:forEach>
								</td>
								<td id="opinion${review.review_idx }">
									${review.review_opinion }
									<c:if test="${not empty review.reply_opinion }">
										<div style="color: #f368e0">️🖊${review.reply_opinion }</div>
									</c:if>
								</td>
								<c:if test="${empty review.reply_opinion }">
									<td><button id="replyOK" class="replyBtn">답글 작성</button></td>
								</c:if>
								<c:if test="${not empty review.reply_opinion }">
								<td><button id="replyOK" style="background-color: #8395a7" class="replyBtn" disabled>답글 작성</button></td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</div>
				
			</div>
			<!-- end main-content -->
		</div>
<!-- 		end main-container -->
	</div>
	<!-- end main-inner -->
	
	<!-- 답글 버튼 눌렸을 때 답글 작성 창 뜨기 -->
<div class="reply_modal hidden">
	<div class="reply_modal_overlay"></div>	<!-- 모달 이외 나머지부분 어둡게 -->
	<div class="reply_modal_content">	<!-- 표시할 내용 -->
	
		<div style="margin: 10px;">
			<table border="1">
				<tr>
					<th style="width: 100px; max-height: 53px;">작성일</th>
					<th style="width: 100px; max-height: 53px;">작성자</th>
					<th style="width: 100px; max-height: 53px;">만족여부</th>
					<th style="width: 400px; max-height: 53px; max-width: 500px">리뷰 내용</th>
				</tr>
				<tr>
					<td class="modal_credate" style="width: 150px; max-height: 53px; "></td>
					<td class="modal_writer"></td>
					<td class="modal_YorN"></td>
					<td class="modal_context" style="width: 400px; max-height: 53px; max-width: 500px"></td>
				</tr>
			</table>
			
		</div>
			<div style="display: flex; justify-content: space-between; margin: 10px;">				
				<div style="margin-top: 10px; width: 100%; height: 133px;">
					<form id="replyForm" style="height: 160px;">
						<input type="hidden" name="reply_review_idx" class="review_idx">
						<input type="hidden" name="reply_ho_name" value="${dto.ho_name }">
						<textarea id="reply_opinion" name="reply_opinion" placeholder="답글작성" rows="5" cols="55" style="resize:none; font-size: 20px;"></textarea>
						<p style="margin-top: 5px;"><input style="background-color: #ff9ff3; border: none; width: 682px; height: 40px;" type="submit" value="답글 등록"></p>
					</form>
				</div>
			</div>
	</div>	
</div>
</main>

<script type="text/javascript">
	var now = new Date();
	var year = now.getFullYear();
	var mon = (now.getMonth()+1)>9 ? '' + (now.getMonth() + 1) : '0' + (now.getMonth() + 1); 
	var day = now.getDate()>9 ? '' + now.getDate() : '0' + now.getDate();
	
	const replyBtn = document.querySelectorAll('.replyBtn');
	const reply_modal = document.querySelector('.reply_modal');
	const reply_modal_overlay = document.querySelector('.reply_modal_overlay');
	const replyForm = document.getElementById('replyForm');
	const review_idx = document.querySelector('.review_idx');
	
	const modal_credate = document.querySelector('.modal_credate');
	const modal_writer = document.querySelector('.modal_writer');
	const modal_YorN = document.querySelector('.modal_YorN');
	const modal_context = document.querySelector('.modal_context');
	
	const modal_result = document.querySelector('.modal_result');
	
	replyBtn.forEach(ele => {
		ele.onclick = (event) => {
			reply_modal.classList.remove('hidden');
			const idx = event.target.parentNode.parentNode.previousElementSibling.value;
			const credate = document.getElementById('review_credate' + idx).innerText;
			const writer = document.getElementById('id' + idx).innerText;
			const YorN = document.getElementById('YorN' + idx).innerText;
			const context = document.getElementById('opinion' + idx).innerText;
			console.log(idx);
			review_idx.value = idx;
			modal_credate.innerText = credate;
			modal_writer.innerText = writer;
			modal_YorN.innerText = YorN;
			modal_context.innerText = context;
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
				location.href = 'trueReview';
			}
		})
	}
	
	reply_modal_overlay.onclick = function(){
		reply_modal.classList.add('hidden');
	}
	
</script>

</body>
</html>
