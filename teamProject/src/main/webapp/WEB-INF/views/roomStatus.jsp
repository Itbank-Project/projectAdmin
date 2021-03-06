<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("MM월 dd일");
%>
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
				      <li><p>※ 세달(<%=sf.format(nowTime) %> ~ <span id="threeMonth">4월 27일</span>)뒤까지 앱 상에 노출됩니다. 사전 예약률이 폭발적으로 증가하고 있는 여름! 사전 객실 업로드하셔서 예약 픽업 증가를 경험하세요♥♥</p></li>
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


<div class="roomStatus_modal hidden"> -->
	<div class="roomStatus_modal_overlay"></div> <!-- 모달 이외 나머지부분 어둡게 -->

	<div class="roomStatus_modal_content">	<!-- 표시할 내용  --> 
	<c:forEach var="i" begin="1" end="${roomCount }"> <!-- 룸 타입 종류만큼 input 창 출력 -->
	<form name="calForm" class="calendarForm${i }" method="POST"> 

		<input style="margin-top: 10px; border: none; border-bottom: 1px solid grey; outline: none;" type="text" name="calendar_ro_pk" readonly>
		<input style="width: 40px; border: none; border-bottom: 1px solid grey; outline: none;" type="number" name="calendar_count" min="0">
		<input style="width: 60px; border: none; border-bottom: 1px solid grey; outline: none;" type="number" name="calendar_price">
		<input style="border: none; border-bottom: 1px solid grey; outline: none;" type="text" name="calendar_date" readonly>
		<input style="width: 300px;" type="hidden" name="calendar_pk">
		<input class="calendarBtn" type="submit" value="수정"> 	
		<p></p>
	</form>
	</c:forEach>
 	</div>
</div>
</main>

        
        
<script type="text/javascript">
		const threeMonth = document.getElementById('threeMonth');
		
		
		var now = new Date();//오늘 날짜
		now.setMonth(now.getMonth()+3);
		now = getFormatMonth(now);
		
		function getFormatMonth(now){
		    var month = (1 + now.getMonth());          	//M
		    month = month >= 10 ? month : '0' + month;  		//month 두자리로 저장
		    var day = now.getDate();                   	//d
		    day = day >= 10 ? day : '0' + day;          		//day 두자리로 저장
		    return month + '월 ' + day +'일';       		//'-' 추가하여 yyyy-mm-dd 형태 생성 가능
		}
		
		threeMonth.innerText = now;
		
		
		
		
		var today = new Date();
		function prevClaendar(){//이전 달력
		  today = new Date(today.getFullYear(), today.getMonth()-1,today.getDate());
		  buildCalendar();
		  
		}
		//다음 달력을 오늘을 저장하고 달력에 뿌려줌
		function nextCalendar(){
		  today = new Date(today.getFullYear(), today.getMonth()+1,today.getDate());
		  buildCalendar();
		 
		}
		
		function buildCalendar(){
		  var nMonth = new Date(today.getFullYear(),today.getMonth(),1);// 이번달의 첫번째날
		  var lastDate =new Date(today.getFullYear(),today.getMonth()+1,0);//이번달의 마지막날
		  var tblCalendar =document.getElementById("calendar");    //테이블 달력을 만드는 테이블
		  var tblCalendarYM =document.getElementById("calendarYM"); ///XXXX년도XX월 출력
		 
		// 월이 한자리수면 앞에 0 붙이기
	  		var month = today.getMonth()+1;
	  		if(month  < 10){
	  			month = '0' + month;
	  		}
	  		
	  	// 년도
	  		var year = today.getFullYear();
	  		tblCalendarYM.innerHTML = year+"년"+ month+"월";
		  
		  
		  //기존에 테이블에 잇던 달력 내용 삭제
		  while(tblCalendar.rows.length>1){
		    tblCalendar.deleteRow(tblCalendar.rows.length -1);
		  }
		  var row = null;
		  row =tblCalendar.insertRow();
		  var cnt =0;
		  // 1일이 시작되는 칸을 맞추어줌
		 
		  for ( i=0; i <nMonth.getDay(); i++) {
		    cell =row.insertCell();
		    cnt = cnt + 1;
		}
		  //달력 출력
		  for(i=1; i<= lastDate.getDate(); i++){
			
		    cell =row.insertCell();
		    var div = "<div class='calendar_day'><div id=day" + i +" "+ ">";
		    div += i + "</div>";
		    
			var price = 0;
			var count = 0;
			var roomType = '';
			var cal_ro_pk = '';
			
			cell.innerHTML = div;
			
			<c:forEach var='list' items='${calendarList}'>
			// 년월일이 calendar 날짜와 같으면 
				if(i == '${list.dd}' && month == '${list.mm}' && year == '${list.yy}'){
					cal_ro_pk = "${list.calendar_ro_pk}";
					roomType = "${list.calendar_ro_pk.split('-')[1]}";
					price = parseInt("${list.calendar_price}");
					count = parseInt("${list.calendar_count}");
					
			 		cell.innerHTML += "<div class=room" +  i  + " style='font-size: 12px;'><span id=roomType" + i +" " + ">"
			        + roomType + "</span>"
			        + "<span id=count" + i + ">[" +count + "]</span>"
			        + "<span id=price" + i + "> : " + price + "</span>"
			        + "<div class=hidden>" + cal_ro_pk + "</div>"
			        + "</div></div>"
				}
	    	</c:forEach> 
	    	

	    	// td의 index값 주기
	    	document.getElementById('calendar').querySelectorAll('td').forEach((Element,index) => Element.id = index);
	    	
		    cnt = cnt + 1;
		    if (cnt% 7 == 0)    //1주=7일
		      row = calendar.insertRow();
		  }// for밖
		  
		  
		  for(i=1; i<= lastDate.getDate(); i++){
			  var day1 = document.getElementById('day' + i);
			  
			  // 시작한다
			    day1.onclick = function showCoords(e) {
				  
				 // 모달창열기
				const roomStatus_modal = document.querySelector('.roomStatus_modal');
				const roomStatus_modal_overlay = document.querySelector('.roomStatus_modal_overlay');
				roomStatus_modal.classList.remove('hidden');
				  
				// 모달창닫기
				roomStatus_modal_overlay.onclick = function(){
					roomStatus_modal.classList.add('hidden'); 
				}
	
				// 모달창안에 값 넣기
				const count = '${roomCount }';
			  	for(var i = 0 ; i<count ; i++){

			  		var calendarForm = document.forms[i+1];
					
					var year = document.getElementById('calendarYM').innerText.substring(0,4);
					var month = document.getElementById('calendarYM').innerText.substr(5,2);
					
				    var targ;
	
				    if (e.target) {
				        targ=e.target.id;
				        var parent = document.getElementById(targ).parentNode.parentNode;

				        var pk = parent.children[i+1].children[3].innerText;
				        calendarForm.children[4].value = pk;
				        
				        // 날짜 넣기
				        var date = parent.children[0].children[0].innerText;
				        
	 					// 일자가 한자리수면 앞에 0 붙이기
	 					if(date < 10){
	 						date = '0' + date;
	 					}
						
				    	calendarForm.children[3].value = year +'-'+month +'-' + date;
				        
				        // 방정보 넣기
				        var ro_pk = parent.children[i+1].innerText.split('[')[0];
			    		calendarForm.children[0].value = ro_pk;
			    		
			    		// 방 갯수 넣기
			    		var ro_count = parent.children[i+1].innerText.split('[')[1].split(']')[0];
			    		calendarForm.children[1].value = ro_count;
			    		
			    		// 가격넣기
			    		var ro_price = parseInt(parent.children[i+1].innerText.split(':')[1]);
			    		calendarForm.children[2].value = ro_price;
			    		
				    } // if문
						
				}// for 끝난다
			  }
		  }// for끝
		  

		  for (let i = 1; i < 7 - lastDate.getDay() ; i++) {
			    cell =row.insertCell();
			    cell.innerHTML = i;
			    cnt = cnt + 0;
			    if (cnt%7 == 0)    //1주=7일
			      row = calendar.insertRow();
		  } // for문 끝
		
		}

		buildCalendar();

		// ajax
		const calendarForm = document.querySelectorAll('form[name="calForm"]');

		calendarForm.forEach(form => {
			form.onsubmit = function(event){
				event.preventDefault();
				const formData = new FormData(form);
				const ob = {};
				
				for(const [key,value] of formData.entries()){
					ob[key] = value;
				}
				
				const url = '${cpath}/roomStatus';
				const opt = {
						method : 'PUT',
						body : JSON.stringify(ob),
						contentType: 'application/json',
						headers : {
							'Content-Type' : 'application/json'
						}
				};
				
				fetch(url,opt)
				.then(resp => resp.text())
				.then(text => {
					if(text == 1 ){
						alert('객실정보가 변경되었습니다.');
						location.href = '${cpath}/roomStatus'
					}
				})
			}
		})
</script>
        
