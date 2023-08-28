<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동 유형검사</title>

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

.form-check {
	background-color: #BEEFFF;
	padding: 25px;
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
		<p class="d-flex justify-content-end">${user.userName}님,환영합니다.</p>

		<div class="d-flex justify-content-center">
			<a href="?action=home"><img
				src="images/logo.png" alt="로고 배너" width="300" height="150" /></a>
		</div>
		<br> <br><br>

		<ul class="nav nav-tabs nav-justified">
			<li class="nav-item"><a class="nav-link text-black"
				href="?action=home">메인</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle active"
				style="color: #FF7493; font-weight: bold;" href="#">식단/운동 유형검사</a>
				<ul class="dropdown-menu w-100">
					<li><a class="dropdown-item" style="color: #FF7493;"
						href="?action=menuTest">식단 유형검사</a></li>
					<li><a class="dropdown-item" style="color: #FF7493;"
						href="?action=sportTest">운동 유형검사</a></li>
				</ul></li>
			<li class="nav-item"><a class="nav-link text-black"
				href="?action=scheduler">스케쥴러</a></li>
			<li class="nav-item"><a class="nav-link text-black"
				href="?action=dictionary">칼로리 사전</a></li>
			<li class="nav-item"><a class="nav-link text-black"
				href="?action=bmi">BMI 계산</a></li>
			<li class="nav-item"><a class="nav-link text-black"
				href="?action=community">커뮤니티</a></li>
		</ul>

		<div class="container w-75 mt-5 mx-quto">

		<div class="container text-center">
		<h2 style="font-weight: bold; color: #3C5087;">나의 운동 유형은?</h2></div>
		<br> <br>
		
		<div style="padding-left: 50px;">
		<div class="form-check mb-4">
			<label>질문1. 밖에 있을 때 에너지를 얻는 편인가요, 잃는 편인가요?</label><br> <br>
			<input class="form-check-input ms-3" name="Question1" type="radio" value="yes" checked> 
			<label class="form-check-label ms-3" for="flexRadioDefault1">밖에서 에너지가 쭉쭉 생겨요!!</label><br>
			<input class="form-check-input ms-3" name="Question1" type="radio" value="no">
			<label class="form-check-label ms-3" for="flexRadioDefault1">밖에 있으면 에너지가 점점 사라져요..</label>
		</div>

		<div class="form-check mb-4">
			<label>질문2. 평소 단체 활동을 즐기시나요?</label><br> <br>
			<input class="form-check-input ms-3" name="Question2" type="radio" value="yes" checked> 
			<label class="form-check-label ms-3" for="flexRadioDefault1">네! 사람들과 있는게 좋아요.</label><br>
			<input class="form-check-input ms-3" name="Question2" type="radio" value="no">
			<label class="form-check-label ms-3" for="flexRadioDefault1">아니요.. 혼자 있어야 편해요.</label>
		</div>

		<div class="form-check mb-4">
			<label>질문3. 운동 후 숨이 차는 기분을 즐겨본 경험이 있나요?</label><br><br>
			<input class="form-check-input ms-3" name="Question3" type="radio" value="yes" checked> 
			<label class="form-check-label ms-3" for="flexRadioDefault1">네! 즐겨본 경험이 있어요.</label><br>
			<input class="form-check-input ms-3" name="Question3" type="radio" value="no">
			<label class="form-check-label ms-3" for="flexRadioDefault1">아니요.. 즐겨본 경험이 없어요.</label>
		</div>
		<br> 
		
		<div class="d-flex justify-content-center">
		<input type="submit" id="submit_bt" value="결과 보기" class="btn btn-outline-info mb-3"/></div>


		<form action="<c:url value="?action=doSportTest"/>"
			method="post" id="sportTest_form">
			<input type="hidden" name="sportType" value="" id="result" />
		</form>
</div></div>

		<script src="/Diet/JS/sportTest.js"></script>
	</div>
</body>
</html>