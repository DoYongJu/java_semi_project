let goalCountMap = new Map();
	
for(let c of goalCountList){
	goalCountMap.set(Number(c.achieveDate.slice(-2)), c.count);			
}
		

var date = new Date();
let clickedDate = Number(clickDate.slice(-2));

// 달력 연도
var calendarYear = date.getFullYear();

// 달력 월
var calendarMonth = date.getMonth() + 1;

// 달력 일
var calendarToday = date.getDate();


const monthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
// 윤년 계산
if (calendarYear % 400 == 0) {
	monthDays[1] = 29;
} else if (calendarYear % 100 == 0) {
	monthDays[1] = 28;
} else if (calendarYear % 4 == 0) {
	monthDays[1] = 29;
}
var calendarMonthLastDate = monthDays[date.getMonth()];


var monthLastDate = new Date(calendarYear, calendarMonth, 0);
var calendarMonthLastDate = monthLastDate.getDate();

var monthStartDay = new Date(calendarYear, date.getMonth(), 1);
// 달력 월의 시작 요일
var calendarMonthStartDay = monthStartDay.getDay();

var calendarWeekCount = Math.ceil((calendarMonthStartDay + calendarMonthLastDate) / 7);

var html = "";
html += "<table class='monthTb'>";
html += '<thead>';
html += '<tr>';
html += "<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>";
html += "</tr>";
html += "</thead>";
html += '<tbody>';
// 위치
var calendarPos = 0;
// 날짜
var calendarDay = 0;
for (var index1 = 0; index1 < calendarWeekCount; index1++) {
	html += "<tr>";
	for (var index2 = 0; index2 < 7; index2++) {
		html += "<td style=\"padding: 0px 0px; text-align: right;\">";
		if (calendarMonthStartDay <= calendarPos && calendarDay < calendarMonthLastDate) {
			calendarDay++;
			html += '<button class="dateBt" id="dateButton" name="date" value="' + calendarYear + '-' + String(calendarMonth).padStart(2, "0") + '-' + String(calendarDay).padStart(2, "0") + '"><span style=\"display: inline;';
			if (calendarDay == clickedDate) {
				html += " border: 1px solid skyblue; border-radius: 0%; color: white; background-color: skyblue;";
			}
			html += '\">' + calendarDay + '</span></button><h3 style=\"padding: 0px 0px; text-align: center; color: #FF69B4;\">';
			
			if(goalCountMap.get(calendarDay) != undefined){
				html += goalCountMap.get(calendarDay);			
			}else{
				html += 0;
			}
						
			html += '</h3>';			
		}
		html += "</td>";
		calendarPos++;
	}
	html += "</tr>";
}
html += "</tbody>";
html += "</table>";


window.addEventListener('load', function(){	

});


