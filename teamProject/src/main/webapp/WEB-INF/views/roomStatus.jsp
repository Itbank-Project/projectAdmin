<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="${cpath }/resources/css/calendar.css">
<style>
	.roomStatus_modal {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	.roomStatus_modal_overlay {
		background-color: rgba(0, 0, 0, 0.6);
		width: 100%;
		height: 100%;
		position: absolute;
	}
	
	.roomStatus_modal_content {
		background-color: white;
		text-align: center;
		position: relative;
		z-index: 1;
		border-radius: 10px;
		height: 300px;
		width: 700px;
		padding-top: 5px;
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
	.calendar_day{
		height: 150px;
	}
</style>
<main>
<div class="main-inner">
	<div class="main-container">
		<div class="main-content-head">
				<h3>객실현황</h3>
		</div>
		<div class="main-content">
		      <div id="day" style="justify-content: center;">
			      <div id="left"><label onclick="prevClaendar()">◀️️</label></div>
			      <div id="calendarYM"> yyyy년 mm월 </div>
			      <div id="right"><label onclick="nextCalendar()">▶</label></div>							
		      </div>
		      <nav>
			      <ul id="context">
				      <li><p>※ 세달(1월27일 ~ 4월 27일)뒤까지 앱 상에 노출됩니다. 사전 예약률이 폭발적으로 증가하고 있는 여름! 사전 객실 업로드하셔서 예약 픽업 증가를 경험하세요♥♥</p></li>
				      <li><p>※ 전체 객실 수정 기능 등을 사용하시면 편리하게 이용이 가능합니다.</p></li>
				      <li><p>※ 엑스트라넷 이용시, <span style="color: royalblue;">크롬(Chrome)</span>사용을 권장합니다.</p></li>
				      <li><p>※ <span style="color: brown;">마감임박 당일할인가</span>를 미리 입력할 수 있습니다. 해당 기능을 이용하여 매출에 날개를 달아보세요!</p></li>
			      </ul>
		      </nav>
		      <!-- 숙박/대실 -->
		      <div id="check">
		        <span id="userRoom" style="color: #CD1F48; font-size: 20px; font-weight: bold;">숙박</span>
		      </div>
		      
		    <table id="calendar">
		      <tr id="week">
		        <th style="color: red;">일(Sun)</th>
		        <th>월(Mon)</th>
		        <th>화(Tue)</th>
		        <th>수(Wed)</th>
		        <th>목(Thu)</th>
		        <th>금(Fri)</th>
		        <th style="color: blue;">토(Sat)</th>
		      </tr>
		    </table>
    	</div>
    </div>
</div>

<div class="roomStatus_modal hidden">
	<div class="roomStatus_modal_overlay"></div>	<!-- 모달 이외 나머지부분 어둡게 -->

	<div class="roomStatus_modal_content">	<!-- 표시할 내용 -->
		<c:forEach items="${roomList }" var="room"> <!-- 룸 타입 종류만큼 input 창 출력 -->
		<form class="calendarForm" method="POST">
			<span style="margin-bottom: 5px;"><input type="text" name="calendar_ro_pk" value="${room.ro_pk }"></span>
			<span><input style="width: 30px;" type="number" name="calendar_count" value="${room.ro_default_count }"></span>
			<span><input style="width: 60px;" type="number" name="calendar_price" value="${room.ro_default_price }"></span>
			<span><input type="text" name="calendar_date"></span>
			<span><input style="width: 300px;" type="hidden" name="calendar_pk" value="${room.ro_pk }"></span>
			<span><input class="calendarBtn" type="submit" value="수정"></span>
			<p></p>
		</form>
		</c:forEach>
	</div>	
</div>

</main>
        
        
<script type="text/javascript">
	buildCalendar();
	
 	var today = new Date();		//오늘 날짜
	
	function prevClaendar(){	//이전 달력
		console.log('?');
		today = new Date(today.getFullYear(), today.getMonth()-1,today.getDate());
		buildCalendar();
	}
	//다음 달력을 오늘을 저장하고 달력에 뿌려줌
	function nextCalendar(){
		today = new Date(today.getFullYear(), today.getMonth()+1,today.getDate());
		buildCalendar();
	}
	
	function buildCalendar(){
		var today = new Date();
 	 	var nMonth = new Date(today.getFullYear(),today.getMonth(),1);// 이번달의 첫번째날
  		var lastDate =new Date(today.getFullYear(),today.getMonth()+1,0);//이번달의 마지막날
  		var tblCalendar =document.getElementById("calendar");    //테이블 달력을 만드는 테이블
  		var tblCalendarYM =document.getElementById("calendarYM"); ///XXXX년도XX월 출력
  		
  		// 월이 한자리수면 앞에 0 붙이기
  		var month = today.getMonth()+1;
  		if(month  < 10){
  			month = '0' + month;
  		}
  		
  		tblCalendarYM.innerHTML = today.getFullYear()+"년"+ month+"월";
 
		//기존에 테이블에 잇던 달력 내용 삭제
		while(tblCalendar.rows.length>1){
		    tblCalendar.deleteRow(tblCalendar.rows.length -1);
	 	}
	  
		var row = null;
		row = tblCalendar.insertRow();
		var cnt =0;
	  
		// 1일이 시작되는 칸을 맞추어줌
		for ( i=0; i < nMonth.getDay(); i++) {
		    cell = row.insertCell();
		    cnt = cnt + 1;
		}
 
		//달력 출력
		for(i=1; i <= lastDate.getDate(); i++){
			
			cell = row.insertCell();
			
	  		var div = "<div class='calendar_day'><div id=day" + i +" "+ ">";
	    	div += i + "</div>";

	    	var price = 0;
	    	var count = 0;
	    	var roomType = '';
			var ro_pk = '';
			
			// 날짜 출력
	    	cell.innerHTML = div;
	    	
	    	<c:forEach var='room' items='${roomList}'>
	    		ro_pk = "${room.ro_pk}";
	    		roomType += "${room.ro_roomtype}";
	    		price = parseInt("${room.ro_default_price}");
	    		count = parseInt("${room.ro_default_count}");
	    		
 	    		cell.innerHTML += "<div style='font-size: 12px;'><span id=roomType" + i +" " + ">"
	            + roomType + "</span>"
	            + "<span id=count" + i + ">[" +count + "]</span>"
	            + "<span id=price" + i + "> : " + price + "</span>"
	            + "</div>"
	            
	        </c:forEach>
          
	    	cnt = cnt + 1;
	    	if (cnt% 7 == 0)    //1주 = 7일
			row = calendar.insertRow();
	  	}

		for (let i = 1; i < 7 - lastDate.getDay() ; i++) {
	    	cell = row.insertCell();
	    	cell.innerHTML = i;
	    	cnt = cnt + 0;
	    	if (cnt%7 == 0)    //1주 = 7일
	      		row = calendar.insertRow();
	  		}
		}
	
	
	


	
	// 모달창열기
		const calendar_day = document.querySelectorAll('.calendar_day');	
		calendar_day.forEach(cal_day => {
			cal_day.onclick = () => {
				var year = document.getElementById('calendarYM').innerText.substring(0,4);
				var month = document.getElementById('calendarYM').innerText.substr(5,2);
				var date = cal_day.innerText;

				// 일자가 한자리수면 앞에 0 붙이기
				if(date < 10){
					date = '0' + date;
				}
				
				
				const calendar_pk = document.querySelectorAll('input[name="calendar_pk"]');
		  		const calendar_count = document.querySelector('input[name="calendar_count"]');
		  		const calendar_price = document.querySelector('input[name="calendar_price"]');
		  		const calendar_date = document.querySelectorAll('input[name="calendar_date"]');
		  		const calendar_ro_pk = document.querySelectorAll('input[name="calendar_ro_pk"]');
		 		
				const roomStatus_modal = document.querySelector('.roomStatus_modal');
				const roomStatus_modal_overlay = document.querySelector('.roomStatus_modal_overlay');
				roomStatus_modal.classList.remove('hidden');

				calendar_date.forEach(cal_date => {
					cal_date.value = year +'-' + month +'-'+ date ;
				})
				
				
				calendar_ro_pk.forEach(cal_ro_pk => {
					cal_ro_pk.value = cal_ro_pk.value;
				})
				
				
				roomStatus_modal_overlay.onclick = function(){
					roomStatus_modal.classList.add('hidden'); 
				}
			}
		})	 
  		
  		
		
		/* const calendarForm = document.querySelectorAll('.calendarForm');
		const updateBtn = document.querySelectorAll('.calendarBtn');
	  	
		console.log(calendarForm);
		
		calendarForm.forEach(form => {
			form.onsubmit = function(event){
				event.preventDefault();
				const formData = new FormData(form);
				const ob = {};
				
				for(const [key,value] of formData.entries()){
					ob[key] = value;
				}
				
				const url = '${cpath}/calendar';
				const opt = {
						method : 'POST',
						body : JSON.stringify(ob),
						headers : {
							'Content-Type' : 'application/json;charset=utf8'
						}
				};
				fetch(url,opt)
				.then(resp => resp.text())
				.then(text => {
					if(text == 1 ){
						alert('g');
					}
				})
			}
		}) */
	
</script>
        
