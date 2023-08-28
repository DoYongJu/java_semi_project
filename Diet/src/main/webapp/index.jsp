<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈화면</title>


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
.dropdown:hover .dropdown-menu {
	display: block;
	margin-top: 0;
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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="/Diet/JS/calendar.js"></script>
<script src="/Diet/JS/calendar_month.js"></script>
</head>

<body>
	<div class="container-sm m-5 mx-auto">

		<div class="d-flex justify-content-end">
			<a href="?action=signUp" class="link-offset-2 link-underline link-underline-opacity-0 me-3" style="color:#FF7493; font-weight:bold;">회원가입</a> 
			<a href="?action=login" class="link-offset-2 link-underline link-underline-opacity-0" style="color:#FF7493; font-weight:bold;">로그인</a>
		</div>

		<div class="d-flex justify-content-center">
			<a href="?action=index"><img
				src="images/logo.png" alt="로고 배너" width="300" height="150" /></a>
		</div>
		<br><br><br>

		<ul class="nav nav-tabs nav-justified">
			<li class="nav-item"><a class="nav-link active" style="color:#FF7493; font-weight:bold;" href="?action=index">메인</a></li>
			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle text-black" href="#">식단/운동 유형검사</a>
				<ul class="dropdown-menu w-100">
					<li><a class="dropdown-item" href="?action=menuTest">식단 유형검사</a></li>
					<li><a class="dropdown-item" href="?action=sportTest">운동 유형검사</a></li>
				</ul></li>
			<li class="nav-item"><a class="nav-link text-black" href="?action=scheduler">스케쥴러</a></li>
			<li class="nav-item"><a class="nav-link text-black" href="?action=dictionary">칼로리 사전</a></li>
			<li class="nav-item"><a class="nav-link text-black" href="?action=bmi">BMI 계산</a></li>
			<li class="nav-item"><a class="nav-link text-black" href="?action=community">커뮤니티</a></li>
		</ul>

		<br> <br>

		<div id="carouselExample" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<c:forEach varStatus="i" var="w" items="${wiseSayingList}">
					<c:if test="${i.index == 0}">
						<div class="carousel-item active" data-bs-interval="6000">
							<img src="${w.img}" class="d-block w-100 mb-30" alt="ss">
							<div class="carousel-caption d-none d-md-block">
								<h1 style="font-size: 3.5em">${w.content}</h1>
								<h2 class="float-end">-${w.writer}</h2>
							</div>
						</div>
					</c:if>
					<c:if test="${i.index != 0}">
						<div class="carousel-item" data-bs-interval="6000">
							<img src="${w.img}" class="d-block w-100 mb-30" alt="ss">
							<div class="carousel-caption d-none d-md-block">
								<h1 style="font-size: 3.5em">${w.content}</h1>
								<h2 class="float-end">-${w.writer}</h2>
							</div>

						</div>
					</c:if>
				</c:forEach>
			
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExample" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExample" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		</div>

		<br><br><br><br>
		<p>
			지금 <a href="?action=signUp">회원가입</a>을 해서 나만의 스케쥴러를 채워보세요!<br><br>
			당신의 건강한 삶을 응원합니다!
		</p>
		<hr>
					
					<div class="calendar month">
						<div class="calendar-header">
							<span class="calendar-yearmonth"></span>
							<span class="float-end">
						<label>'사용자'의 하루 성취률: 0 / 0</label><br>
						</span>
							<div class="calendar-controls">
								<!-- <button type="button" class="calendar-today">오늘</button> -->
							</div>
						</div>
						
					
					
					</div>
					<div id="calendar"></div>
					<br><br>
					<hr>
		<button id="addButton" class="btn btn-outline-info mb-3"
				type="button">스케쥴 등록</button><br><br><br><br>
		
		
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
		<img src="images/schedule.png" class="d-block w-100" alt="scheduleExample">

	</div>
</body>
</html>