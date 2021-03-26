<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="${cpath }/resources/css/calendar.css">

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
</main>
        
        
<script type="text/javascript">
	buildCalendar();
	
	var today = new Date();		//오늘 날짜
	
	function prevClaendar(){	//이전 달력
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
  		tblCalendarYM.innerHTML = today.getFullYear()+"년"+(today.getMonth()+1)+"월";
 
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
	    	var test = "";
	    	
	    	<c:forEach var='item' items='${dto }'>
	    		if(i == '${item.dd}'){
	    			test += "${item.calendar_price}";
	    		}
	    	</c:forEach>
	    	
	    	test += i;
	    	cell.innerHTML = test;
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

		function test(){
			alert('test');
		}
</script>
        