<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스케쥴러</title>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@500&display=swap')
	;

* {
	font-family: 'Noto Serif KR', serif;
	font-size: 17px;
}

.dropdown:hover .dropdown-menu {
	display: block;
	margin-top: 0;
}

.monthTb {
	width: 450px;
	height: 300px;
}

.monthTb tbody tr, .monthTb td {
	border: 1px solid black;
	vertical-align: top;
}

tr, td {
	text-align: center;
	vertical-align: middle;
}
/* calendar-controls */
.calendar>.calendar-header {
	position: relative;
	height: 50px;
	margin-bottom: 10px;
}

.calendar>.calendar-header>.calendar-yearmonth {
	display: inline-block;
	font-size: larger;
	font-weight: bolder;
	color: #FF7493;
	line-height: 50px;
}

.calendar>.calendar-header>.calendar-controls {
	display: inline-block;
	vertical-align: top;
	margin: 11px 0 0 5px;
}

.calendar>.calendar-header>.calendar-controls>button {
	float: left;
	width: 25px;
	height: 28px;
	padding: 1px 4px 0 4px;
	border: 1px solid #cbcbcb;
	background-color: #fff;
	font-size: 12px;
	cursor: pointer;
}

.calendar>.calendar-header>.calendar-controls>button.calendar-today {
	width: 40px;
}

.calendar>.calendar-header>.calendar-controls>button.calendar-today:hover
	{
	background-color: pink;
}

.calendar>.calendar-header>.calendar-controls>button.calendar-prev:hover
	{
	background-color: pink;
}

.calendar>.calendar-header>.calendar-controls>button.calendar-next:hover
	{
	background-color: pink;
}

/* calendar-views */
.calendar>.calendar-header>.calendar-views {
	position: absolute;
	top: 11px;
	right: 0px;
}

.calendar>.calendar-header>.calendar-views>button {
	float: left;
	width: 40px;
	height: 28px;
	padding: 1px 4px 0 4px;
	border: 1px solid #cbcbcb;
	background-color: #f8f8f8;
	font-size: 12px;
	cursor: pointer;
}

.calendar>.calendar-header>.calendar-views>button.active {
	border-color: #7f4ac8 !important;
	background: #9155e5 !important;
	color: #fff;
}

.dateBt {
	border: 0;
	background-color: transparent;
}

.dateBt:hover {
	background-color: skyblue;
}
</style>


<!-- bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	integrity="sha256-2TnSHycBDAm2wpZmgdi0z81kykGPJAkiUY+Wf97RbvY="
	crossorigin="anonymous">

<!-- bootstrap JS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
	integrity="sha256-gOQJIa9+K/XdfAuBkg2ONAdw5EnQbokw/s2b8BqsRFg="
	crossorigin="anonymous"></script>

<script>
	let totalCount = ${totalCount};
	let count = ${count};
	let clickDate = '${date}';
	let goalCountList = JSON.parse('${goalCountList}');
</script>


<!-- JQuery -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="/Diet/JS/calendar.js"></script>
<script src="/Diet/JS/calendar_month.js"></script>
<script src="/Diet/JS/goal.js"></script>
</head>

<body>
	<div class="container-sm m-5 mx-auto">

		<div class="d-flex justify-content-end">
			<a href="?action=myPage"
				class="link-offset-2 link-underline link-underline-opacity-0 me-3"
				style="color: #FF7493; font-weight: bold;">마이페이지</a> <a
				href="?action=doLogout"
				class="link-offset-2 link-underline link-underline-opacity-0"
				style="color: #FF7493; font-weight: bold;">로그아웃</a><br>
		</div>
		<p class="d-flex justify-content-end">${user.userName}님, 환영합니다.</p>

		<div class="d-flex justify-content-center">
			<a href="?action=home"><img src="images/logo.png" alt="로고 배너"
				width="300" height="150" /></a>
		</div>
		<br> <br> <br>

		<ul class="nav nav-tabs nav-justified">
			<li class="nav-item"><a class="nav-link text-black"
				href="?action=home">메인</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle text-black" href="#">식단/운동 유형검사</a>
				<ul class="dropdown-menu w-100">
					<li><a class="dropdown-item" href="?action=menuTest">식단
							유형검사</a></li>
					<li><a class="dropdown-item" href="?action=sportTest">운동
							유형검사</a></li>
				</ul></li>
			<li class="nav-item"><a class="nav-link active"
				style="color: #FF7493; font-weight: bold;" href="?action=scheduler">스케쥴러</a></li>
			<li class="nav-item"><a class="nav-link text-black"
				href="?action=dictionary">칼로리 사전</a></li>
			<li class="nav-item"><a class="nav-link text-black"
				href="?action=bmi">BMI 계산</a></li>
			<li class="nav-item"><a class="nav-link text-black"
				href="?action=community">커뮤니티</a></li>
		</ul>

		<div class="container w-75 mt-5 mx-quto">
			<div class="d-flex justify-content-center">
				<h2 style="font-weight: bold;">${user.userName}님의 스케쥴러</h2>
			</div>
			<br> <br>

			<div class="d-flex justify-content-end">
				<form action="<c:url value="?action=scheduler"/>" method="post">
					<input class="btn btn-secondary btn-sm" type="submit"
						id="scheduleOfWeek" name="type" value="주간스케쥴" /> <input
						class="btn btn-secondary btn-sm" type="submit"
						id="scheduleOfMonth" name="type" value="월간스케쥴" />
				</form>
			</div>


			<c:if test="${type.equals('주간스케쥴')}">
				<div>
					<hr>
					
					<div class="calendar month">
						<div class="calendar-header">
							<span class="calendar-yearmonth"></span>
							<div class="calendar-controls">
								<!-- <button type="button" class="calendar-today">오늘</button> -->
							</div>
						</div>
						<span class="float-end">
						<c:forEach var="m" items="${clickedDate}">
							<c:if test="${num < 0}">
							<label>${m}의 하루 성취률: 0 / ${counts[2]} </label><br>
						</c:if>
							<c:if test="${num > 0}"> <!--과거-->
							<label>${m}의 하루 성취률: ${counts[3]} / ${counts[2]} </label><br>
						</c:if>
							<c:if test="${num == 0}">
							<label>${m}의 하루 성취률: ${counts[0]} / ${counts[2]} </label><br>
						</c:if>

						</c:forEach>
					</span>
					
						<div id="calendar"></div>
					</div>
					<hr>
					<label><br> <c:forEach var="m" items="${clickedDate}">
								${m} 의 todoList </c:forEach> </label> <br>
					<form method="post" action="?action=goalDelete" id="deleteId">
					<input type="hidden" name = "deleteId" value="" id="hiddenOutput">
					</form> <br>
					<form method="post" action="?action=doGoal" id="insertGoal"
						name="insertGoal">
						<input type="hidden" value="" id="hiddenInput">

						<table class="table" data-role="table" id="bills_table"
							data-rows="-1" data-show-pagination="false"
							data-show-search="false" data-show-rows-steps="false"
							data-show-table-info="false" data-pagination-short-mode="false"
							data-pagination-wrapper=".block-pagination-wrapper">
							<thead>
								<tr>
									<th>삭제</th>
									<th>유형</th>
									<th>목표</th>
									<th>기간</th>
									<th>시작일</th>
									<th>마감일</th>
									<th>완료</th>
								</tr>
							</thead>

							<tbody>
								
								<c:forEach var="m" items="${todoListByMenu}">
									<tr>
										<td><input type="checkbox" class="dGoal"
											data-id="${m.id}" id="deleteId" name="deleteId"
											value="${m.id}"></td>
										<td>${m.type}</td>
										<td>${m.goal}</td>
										<td>${m.period}</td>
										<td>${m.inputDate}</td>
										<td>${m.dueDate}</td>
										<td>
										<c:if test="${num == 0 }">
										        <c:if test="${(m.disabled eq 'true')&&( m.checked eq 'true')}">
													<input type="radio" checked disabled>
												</c:if>
												<c:if test="${(m.disabled eq 'true')&&( m.checked eq 'false')}">
													<input type="checkbox" disabled>
												</c:if>
												<c:if test="${(m.disabled eq 'false')&&( m.checked eq 'false')}">
													<input type="checkbox" class="goal" data-id="${m.id}"
														id="uId" name="id" value="${m.id}">
												</c:if>
												<c:if test="${(m.disabled eq 'false')&&( m.checked eq 'true')}"> <!-- 아침 챙겨먹기 -->
													<input type="checkbox" checked disabled>
												</c:if>

										</c:if> 
										<c:if test="${num > 0}"> 
												<!--과거-->
												<c:if test="${m.checked eq 'true'}">
													<input type="checkbox" disabled checked>
												</c:if>
												<c:if test="${m.checked eq 'false'}">
													<input type="checkbox" disabled>
												</c:if>

										</c:if> 
										<c:if test="${num < 0}">
												<input type="checkbox" disabled>
										</c:if>
									</td>

									</tr>
								</c:forEach>
								<c:forEach var="s" items="${todoListBySport}">
									<tr>
										<td><input type="checkbox" data-id="${s.id}" id="Idd"
											name="idd" value="${s.id}"></td>
										<td>${s.type}</td>
										<td>${s.goal}</td>
										<td>${s.period}</td>
										<td>${s.inputDate}</td>
										<td>${s.dueDate}</td>
										<td>
											<c:if test="${num == 0 }">
												<c:if test="${(s.disabled eq 'true')&&( s.checked eq 'true')}">
													<input type="radio" checked disabled>
												</c:if>
												<c:if test="${(s.disabled eq 'true')&&( s.checked eq 'false')}">
													<input type="checkbox" disabled>
												</c:if>
												<c:if test="${(s.disabled eq 'false')&&(s.checked eq 'false')}">
													<input type="checkbox" class="goal" data-id="${s.id}"
														id="uId" name="id" value="${s.id}">
												</c:if>
												<c:if test="${(s.disabled eq 'false')&&(s.checked eq 'true')}"> <!-- 아침 챙겨먹기 -->
													<input type="checkbox" checked disabled>
												</c:if>

											</c:if>
										<c:if test="${num > 0}">
												<!--17일-->
												<c:if test="${s.checked eq 'true'}">
													<input type="checkbox" disabled checked>
												</c:if>
												<c:if test="${s.checked eq 'false'}">
													<input type="checkbox" disabled>
												</c:if>
										</c:if> 
										<c:if test="${num < 0}">
												<input type="checkbox" disabled>
										</c:if>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</form>
					<hr>

				</div>
			</c:if>

			<c:if test="${type.equals('월간스케쥴')}">

				<hr>
				<div>
					<div class="calendar">
						<div class="calendar-header">
							<span class="calendar-yearmonth"></span>
							<div class="calendar-controls">
								<!-- <button type="button" class="calendar-today" id="todayBt">오늘</button> -->
							</div>

							<span class="float-end">월간 성취율: ${MonthProbability}% (${totalCount} / ${scheduleCount}) </span>
						</div>
					</div>

					<div class="row">
						<div class="col-6">
							<form action="<c:url value="?action=sendDate"/>" method="post">
								<div id="calendar_month"></div>
							</form>
						</div>
						<div class="col-6 mt-3">
							<div>
								<p>${date} 완료한 스케쥴 목록</p>
								
								<ul class="list-group">
								<c:forEach var="g" items="${myGoalList}">
								<li class="list-group-item">${g.goal}</li>
								</c:forEach>							
								</ul>
								
							</div>
						</div>
					</div>
					<br>
					<script>
						$("#calendar_month").html(html);
					</script>
				</div>
			</c:if>

			<script>
				var options = {
					showDay : true,
					showFullDayName : true,
					showToday : true
				};

				var date = new Date();
				var html = weekHTML(date, options);
				$(".calendar-yearmonth")
						.html(
								date.getFullYear() + "년 "
										+ (date.getMonth() + 1) + "월");
				$("#calendar").html(html);
			</script>

			<hr>
			<button id="addButton" class="btn btn-outline-info mb-3"
				type="button" data-bs-toggle="collapse" data-bs-target="#addForm"
				aria-expanded="false" aria-control="addForm">스케쥴 등록</button>
			<div class="collapse" id="addForm">
				<div class="card card-body">
					<form id="add_form" method="post" action="?action=addSchedule">
						<label class="form-label">목표 유형</label><br> <input
							class="form-check-input" name="type" type="radio" value="식단"
							checked><label class="form-check-label"
							for="flexRadioDefault1">식단</label><br> <input
							class="form-check-input" name="type" type="radio" value="운동">
						<label class="form-check-label" for="flexRadioDefault1">운동</label><br>
						<br> <label class="form-label">목표</label> <input id="goal"
							type="text" name="goal" class="form-control"
							placeholder="목표를 입력하세요"><br> <label
							class="form-label">주기</label><br> <select
							class="form-select" aria-label="Default select example"
							name="period">
							<option value="1">매일</option>
							<option value="7">일주일에 한 번</option>
							<option value="30">한 달에 한 번</option>
						</select> <br> <label class="form-label">마감일</label> <input
							id="duaDate" type="date" name="dueDate" class="form-control">
					</form>
					<input id="add_bt" type="submit"
						class="btn btn-light mt-3 bg-danger-subtle" value="저장" />

				</div>
			</div>

		</div>
	</div>

	<script src="/Diet/JS/addSchedule.js"></script>

</body>
</html>