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
				
				<div>
					<div style="width: 1000px; display: flex; justify-content: space-between;">
					<form method="POST" id="calculateForm">
						<div><h4>■ 정산 내역</h4></div>
						<div style="margin-top: 20px;">
							<span id="yearSelect"> 
							<select id="year" name="yyyy">
								<option value="2021">2021년</option>
								<option value="2022">2022년</option>
								<option value="2023">2023년</option>
							</select>
							</span> 
							<span id="monthSelect"> 
							<select id="month" name="mm">
									<option value="01">1월</option>
									<option value="02">2월</option>
									<option value="03">3월</option>
									<option value="04">4월</option>
									<option value="05">5월</option>
									<option value="06">6월</option>
									<option value="07">7월</option>
									<option value="08">8월</option>
									<option value="09">9월</option>
									<option value="10">10월</option>
									<option value="11">11월</option>
									<option value="12">12월</option>
							</select>
							</span> 
							<span>
								<button type="submit" id="searchBtn">검색</button>
							</span>
						</div>
						</form>
					</div>
					
<!-- 					<table class="calTable" style="width: 1000px"> -->
<!-- 						<tr> -->
<!-- 							<th>정산방식</th> -->
<!-- 							<th>정산기간</th> -->
<!-- 							<th>예약</th> -->
<!-- 							<th>취소</th> -->
<!-- 							<th>정산금액</th> -->
<!-- 							<th>입금일자</th> -->
<!-- 						</tr> -->
					
<!-- 					</table> -->
					
					
					<div id="calculate-list"></div>
					
					
				</div>
			
				
			</div>
			<!-- end main-content -->
		</div>
		<!-- end main-container -->
	</div>
	<!-- end main-inner -->
</main>
</body>
<script>
const convertJsonToTable = function(json, cpath) {
	const table = document.createElement('table');
	const thead = document.createElement('thead');
	const tbody = document.createElement('tbody');
	const theadTr = document.createElement('tr');
	const theadTh1 = document.createElement('th');
	const theadTh2 = document.createElement('th');
	const theadTh3 = document.createElement('th');
	const theadTh4 = document.createElement('th');
	const theadTh5 = document.createElement('th');
	const theadTh6 = document.createElement('th');
	
	theadTh1.innerText = '정산방식';
	theadTh2.innerText = '정산내역';
	theadTh3.innerText = '예약';
	theadTh4.innerText = '취소';
	theadTh5.innerText = '정산금액';
	theadTh6.innerText = '입금일자';
	
	theadTr.appendChild(theadTh1);
	theadTr.appendChild(theadTh2);
	theadTr.appendChild(theadTh3);
	theadTr.appendChild(theadTh4);
	theadTr.appendChild(theadTh5);
	theadTr.appendChild(theadTh6);
	
	thead.appendChild(theadTr);
	
	table.appendChild(thead);


// 날짜 long 형식을 yyyy-MM-dd 로 변경하는 코드(강사님 팁)
   /* const d = new Date(ob.writeDate);
   
   let month = '' + (d.getMonth() + 1); 
   let day = '' + d.getDate();
   let year = d.getFullYear(); 
   
   if (month.length < 2) 
      month = '0' + month; 
   if (day.length < 2) 
      day = '0' + day; 
   const date2 = [year, month, day].join('-'); */
   // 여기까지



for(let i = 0; i < json.length; i++) {
		const td1 = document.createElement('td');
		td1.innerText = json[i]['CA_WEEK'];
		const td2 = document.createElement('td');
		   let firstday = new Date(json[i]['CA_FIRSTDAY']);
		   let month = '' + (firstday.getMonth() + 1); 
		   let day = '' + firstday.getDate();
		   let year = firstday.getFullYear(); 
		   if (month.length < 2) 
			      month = '0' + month; 
		   if (day.length < 2) 
			   day = '0' + day; 
		   firstday = [year, month, day].join('-');
		   
		   let lastday = new Date(json[i]['CA_LASTDAY']);
		   let month1 = '' + (lastday.getMonth() + 1); 
		   let day1 = '' + lastday.getDate();
		   let year1 = lastday.getFullYear(); 
		   if (month1.length < 2) 
			      month1 = '0' + month1; 
		   if (day1.length < 2) 
			   day1 = '0' + day1; 
		   lastday = [year1, month1, day1].join('-'); 
		td2.innerText = firstday+' ~ '+lastday;
		
		const td3 = document.createElement('td');
		td3.innerText = json[i]['CA_RE_COUNT'];
		
		const td4 = document.createElement('td');
		td4.innerText = json[i]['CA_CANCEL_COUNT'];
		
		const td5 = document.createElement('td');
		td5.innerText = json[i]['CA_RE_TOTALPAYMENT'];
		
		if(td5.innerText == "undefined"){
			td5.innerText = "0";
		}
		
		const td6 = document.createElement('td');
		   let depositdate = new Date(json[i]['CA_DEPOSITDATE']);
		   let month3 = '' + (depositdate.getMonth() + 1); 
		   let day3 = '' + depositdate.getDate();
		   let year3 = depositdate.getFullYear(); 
		   if (month3.length < 2) 
			      month3 = '0' + month3; 
		   if (day3.length < 2) 
			   day3 = '0' + day3; 
		   depositdate = [year3, month3, day3].join('-'); 
		td6.innerText = depositdate;	
		
		const tr = document.createElement('tr')
		tr.appendChild(td1);
		tr.appendChild(td2);
		tr.appendChild(td3);
		tr.appendChild(td4);
		tr.appendChild(td5);
		tr.appendChild(td6);
		tbody.appendChild(tr); 
	}
	table.appendChild(tbody);
	return table;
}

</script>

<script type="text/javascript">
   	const calculateForm = document.getElementById('calculateForm');
   	console.log(calculateForm);
    const searchBtn = document.getElementById('searchBtn');
	const submitHandler = function(event){
    	
		event.preventDefault();	
		
		const formData = new FormData(calculateForm);
		
    	const yyyy = document.getElementById('year');
    	const mm = document.getElementById('month');

		const ob = {};
		
		for(const [key,value] of formData.entries()){
			ob[key] = value;
		}
		
		const url ='${cpath }/selectCalcList';
		const opt = {
				method : 'POST',
				body : JSON.stringify(ob),
				headers : {
					'Content-Type' : 'application/json;charset-utf8'
				}
		};
		fetch(url,opt)
		.then(resp => resp.json())
		.then(json => {
			
			const calculatelist = document.getElementById('calculate-list');
			calculatelist.innerHTML = '';
			calculatelist.appendChild(convertJsonToTable(json, '${cpath}'));
		});	
    }
	
	calculateForm.onsubmit = submitHandler;
	
	function search_handler(res){
		for(var i = 0 ; i < res.length ; i++){
			console.log(res.ho_name);
		}
		
	}
</script>
</html>
