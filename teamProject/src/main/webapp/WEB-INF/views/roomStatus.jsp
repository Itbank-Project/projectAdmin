<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="${cpath }/resources/css/calendar.css">
<link rel="stylesheet" href="${cpath }/resources/css/calculate.css">
<script type="text/javascript" src="${cpath }/resources/js/calendar.js"></script>

<main>
<div class="main-inner">
	<div class="main-container">
		<div class="main-content-head">
				<h3>객실현황</h3>
		</div>
		<div class="main-content">
      <div id="day">
        <div id="left"><label onclick="prevClaendar()">◀️️</label></div>
        <div id="calendarYM">yyyy년 m월</div>
        <div id="right"><label onclick="nextCalendar()">▶</label></div>
      </div>
      <nav>
        <ul id="context">
          <li><p>※ 세달(1월27일 ~ 4월 27일)뒤까지 앱 상에 노출됩니다. 사전 예약률이 폭발적으로 증가하고 있는 여름! 사전 객실 업로드하셔서 예약 픽업 증가를 경험하세요♥♥</p></li>
          <li><p>※ 전체 선택 기능 또는 등록/수정 기능 등을 사용하시면 편리하게 이용이 가능합니다.</p></li>
          <li><p>※ 엑스트라넷 이용시, <span style="color: royalblue;">크롬(Chrome)</span>사용을 권장합니다.</p></li>
          <li><p>※ <span style="color: brown;">마감임박 당일할인가</span>를 미리 입력할 수 있습니다. 해당 기능을 이용하여 매출에 날개를 달아보세요!</p></li>
        </ul>
      </nav>
      <!-- 숙박/대실 -->
      <div id="check">
        <span id="userRoom">
        <span>숙박</span>
        <span style="color: skyblue; font-weight: bold;">대실</span>
        </span>
      <span id="checkbtn">  
        <span id="checkbox">
          <input type="checkbox" >가격(상시,당일)
          <input type="checkbox" >객실 수
          <input type="checkbox" >체크 인
          <input type="checkbox" >체크 아웃
          <button id="room">객실수정</button>
        </span>
        <span id="roomRegistration"><button id="roomCheckBtn">객실 등록</button></span>
        <span id="roomEnd"><button id="roomEndBtn">객실 마감</button></span>
      </span>
      </div>
      <!-- 객실 종류 선택 -->
      <div id="roomCheck">
        <div id="roomOption">객실 종류선택
          <select><option>전체</option></select>
        </div>
        <div id="roomMoney" ><b>금액표시</b>
          <input  id="deposit" type="checkbox" name="deposit" value="입금가">입금가
          <input  id="sell" type="checkbox" name="sell" value="판매가">판매가
      </div>
      <div id="roomDay">
        <input type="checkbox" >객실 상세정보 보기
        <input type="checkbox">지난 날짜 접어두기
      </div>
      </div>
    <table id="calendar">
      <tr id="week">
        <th><input type="checkbox">일(Sun)</th>
        <th><input type="checkbox">월(Mon)</th>
        <th><input type="checkbox">화(Tue)</th>
        <th><input type="checkbox">수(Wed)</th>
        <th><input type="checkbox">목(Thu)</th>
        <th><input type="checkbox">금(Fri)</th>
        <th><input type="checkbox">토(Sat)</th>
      </tr>
    </table>
    </div>
    </div>
</div>
</main>
        <script type="text/javascript" >
          buildCalendar();
        </script>
      
        