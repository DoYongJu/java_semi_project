<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트 결과</title>

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

#contentDiv {
	background-color: #BEEFFF;
	padding: 20px;
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
			<a href="?action=myPage" class="link-offset-2 link-underline link-underline-opacity-0 me-3" style="color:#FF7493; font-weight:bold;">마이페이지</a> 
			<a href="?action=doLogout" class="link-offset-2 link-underline link-underline-opacity-0" style="color:#FF7493; font-weight:bold;">로그아웃</a><br>			
		</div>
		<p class="d-flex justify-content-end">${user.userName}님, 환영합니다.</p>

		<div class="d-flex justify-content-center">
			<a href="?action=home"><img
				src="images/logo.png" alt="로고 배너" width="300" height="150" /></a>
		</div>
		<br><br><br>
		
		<ul class="nav nav-tabs nav-justified">
			<li class="nav-item"><a class="nav-link active" style="color:#FF7493; font-weight:bold;" href="?action=home">메인</a></li>
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

		<div class="container w-75 mt-5 mx-quto">
		<div class="d-flex justify-content-center">
			<h2 style="font-weight: bold; color: #3C5087;">당신의 운동 유형은 ${sport.nickname} ! </h2><br>
		</div><br>
			<div id="contentDiv">
			<br> ${sport.content} <br>
			<br>
			</div>
			<br> 
			<div class="d-flex justify-content-end">
			<a href="?action=home" class="link-offset-2 link-underline link-underline-opacity-0 me-3"
				style="color: #FF7493; font-weight: bold;">홈으로 가기</a>
			</div>
		</div>	
	</div>
</body>
</html>