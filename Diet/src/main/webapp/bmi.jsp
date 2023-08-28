<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BMI 계산</title>

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


	<c:if test="${user.userName == null}">
	<div class="d-flex justify-content-end">
			<a href="?action=signUp" class="link-offset-2 link-underline link-underline-opacity-0 me-3" style="color:#FF7493; font-weight:bold;">회원가입</a> 
			<a href="?action=login" class="link-offset-2 link-underline link-underline-opacity-0" style="color:#FF7493; font-weight:bold;">로그인</a>
		</div>
		
		<div class="d-flex justify-content-center">
			<a href="?action=index"><img
				src="images/logo.png" alt="로고 배너" width="300" height="150" /></a>
		</div>
		<br><br><br>
	</c:if>

	<c:if test="${user.userName != null}">
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
			<a href="?action=home"><img
				src="images/logo.png" alt="로고 배너" width="300" height="150" /></a>
		</div>
		<br><br><br>
	</c:if>	
		



		<ul class="nav nav-tabs nav-justified">
			<li class="nav-item"><a class="nav-link text-black"
				href="?action=home">메인</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle text-black" href="#">식단/운동 유형검사</a>
				<ul class="dropdown-menu w-100">
					<li><a class="dropdown-item"
						href="?action=menuTest">식단 유형검사</a></li>
					<li><a class="dropdown-item"
						href="?action=sportTest">운동 유형검사</a></li>
				</ul></li>
			<li class="nav-item"><a class="nav-link text-black"
				href="?action=scheduler">스케쥴러</a></li>
			<li class="nav-item"><a class="nav-link text-black"
				href="?action=dictionary">칼로리 사전</a></li>
			<li class="nav-item"><a class="nav-link active"
				href="?action=bmi"
				style="color: #FF7493; font-weight: bold;">BMI 계산</a></li>
			<li class="nav-item"><a class="nav-link text-black"
				href="?action=community">커뮤니티</a></li>
		</ul>

		<div class="container w-75 mt-5 mx-quto">
		<div class="d-flex justify-content-center">
			<h2 style="font-weight: bold;">나의 BMI 지수 확인</h2>
		</div>
			<br><br>

			<p>성별</p>
			<div class="form-check">
				<input class="form-check-input" type="radio" name="gender"
					id="flexRadioDefault1" checked> <label
					class="form-check-label" for="flexRadioDefault1">여자</label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="radio" name="gender"
					id="flexRadioDefault2"> <label class="form-check-label"
					for="flexRadioDefault2">남자</label>
			</div>
			<br>

			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">태어난 년도</span> <input
					type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
					id="n1" name="n1" class="form-control" placeholder="ex) 1996"
					aria-label="ex) 1996" aria-describedby="basic-addon1"> <span
					class="input-group-text">년</span>
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">키</span> <input
					type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
					id="n2" name="n2" class="form-control" placeholder="ex) 160"
					aria-label="ex) 160" aria-describedby="basic-addon1"> <span
					class="input-group-text">cm</span>
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">몸무게</span> <input
					type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
					id="n3" name="n3" class="form-control" placeholder="ex) 50"
					aria-label="ex) 50" aria-describedby="basic-addon1"> <span
					class="input-group-text">kg</span>
			</div>
			<br><br>

			<div class="d-grid gap-2 col-6 mx-auto">
				<button class="btn btn-outline-info" type="submit" id="button">확인</button>
			</div>
			<br><hr><br>
			<h2 id="result"></h2>

		</div>
	</div>

	<script src="/Diet/JS/bmi.js"></script>
</body>
</html>