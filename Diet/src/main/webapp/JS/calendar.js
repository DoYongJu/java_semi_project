// 달력 요일
var calendarDays = ["일", "월", "화", "수", "목", "금", "토"];

// 달력 요일 HTML
function calendarWeekHTML(date,options) {
	var html = "<thead><tr>";
	for (var index = 0; index < calendarDays.length; index++) {
		html += "<th";
		if (index == 0) {
			html += " class=\"sunday\"";
		} else if (index == 6) {
			html += " class=\"saturday\"";
		}
		html += ">"+calendarDays[index];
/*		if (options.showFullDayName) {
			html += "";
		}*/
		html += "</th>";
	}
	html += "</tr></thead>";
	return html;
}
// 기본값 처리
function setCalendarOptions(options) {
	// 기본값 처리
/*	if (options.showDay == undefined || options.showDay == null || typeof options.showDay != "boolean") {
		options.showDay = true;
	}*/
/*	if (options.showFullDayName == undefined || options.showFullDayName == null || typeof options.showFullDayName != "boolean") {
		options.showFullDayName = false;
	}*/
/*	if (options.showToday == undefined || options.showToday == null || typeof options.showToday != "boolean") {
		options.showToday = true;
	}*/
}

 // 0 front of number
function leadZero(num, n) {
            var leadZero = "";
            num = num.toString();
            if (num.length < n) { for (var i = 0; i < n - num.length; i++) leadZero += "0"; }
            return leadZero + num;
    }
// 주간 달력 생성 함수
function weekHTML(date, options) {
	// 데이터 검증
	if (date == undefined || date == null || typeof date != "object" || !date instanceof Date) {
		return "";
	}
	
/*	setCalendarOptions(options);*/
	
	var date =new Date();
	// 달력 연도
	var calendarYear = date.getFullYear();
	// 달력 월
	var calendarMonth = leadZero(date.getMonth() + 1, 2);
	// 달력 일
	var calendarToday = leadZero(date.getDate(), 2);
	
	
	
	
	
	var monthLastDate = new Date(calendarYear, calendarMonth, 0);
	// 달력 월의 마지막 일
	var calendarMonthLastDate = monthLastDate.getDate();

	// 달력 이전 월의 마지막 일
	var prevMonthLastDate = new Date(calendarYear, calendarMonth - 1, 0);

	// 달력 다음 월의 시작 일
	var nextMonthStartDate = new Date(calendarYear, calendarMonth, 1);
	
	// 달력 현재 요일
	var calendarMonthTodayDay = date.getDay();
	
	// 주간 배열
	var arWeek = ["", "", "", "", "", "", ""];
	
	var weekYear = calendarYear;
	var weekMonth = calendarMonth;
	var weekDay = calendarToday;
	// 현재 요일부터 주간 배열에 날짜를 추가
	for (var index = calendarMonthTodayDay; index < 7; index++) {
		arWeek[index] = weekYear +"-" + weekMonth + "-" + weekDay;
		weekDay++;
		// 날짜가 현재 월의 마지막 일보다 크면 다음 월의 1일로 변경
		if (weekDay > calendarMonthLastDate) {
			weekYear = nextMonthStartDate.getFullYear();
			weekMonth = nextMonthStartDate.getMonth() + 1;
			weekDay = 1;
		}
	}
	
	weekYear = calendarYear;
	weekMonth = calendarMonth;
	weekDay = calendarToday;
	// 현재 요일부터 꺼꾸로 주간 배열에 날짜를 추가
	for (var index = calendarMonthTodayDay - 1; index >= 0; index--) {
		weekDay--;
		// 날짜가 현재 월의 1일이면 작으면 이전 월의 마지막 일로 변경
		if (weekDay == 0) {
			weekYear = prevMonthLastDate.getFullYear();
			weekMonth = prevMonthLastDate.getMonth() + 1;
			weekDay = prevMonthLastDate.getDate();
			
		}
		arWeek[index] = weekYear +"-" + weekMonth + "-" + weekDay;
	}
		
	// 오늘
	var today = new Date();
	
	var html = "";
	
	html += '<table class="table table-borderless">';
	html += "<tbody>";
	html += "<tr>";
	for (var index = 0; index < 7; index++) {
		var arWeekDate = arWeek[index].split("-");
		var year = arWeekDate[0];
		var month = arWeekDate[1];
		var day = arWeekDate[2];
		html += "<td data-date=\"" + year + "-" + (month < 10 ? "0" : "") + month + "-" + (day < 10 ? "0" : "") + day +  "\">";
		html += '<form action="?action=scheduler" method="post">';
		html += '<button type="submit" name="dateForWeek" value='+year+'-'+month+'-'+day+' <span class=';
		
		if (options.showToday && year == today.getFullYear() && month == today.getMonth() + 1
			&& day == today.getDate()) {
			html += '"btn btn-danger"\"today\"';
		}

		html += '"btn btn-outline-danger">' + day + '</span></button>';
		html += '</form>';
		html += "</td>";
	}
	html += "</tbody>";
	html += "</table>";
	
	return html;
}

