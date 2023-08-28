<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단유형테스트페이지</title>

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
	background-color: #FFDEE9;
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
		<br>
		<br><br>
		
		<ul class="nav nav-tabs nav-justified">
			<li class="nav-item"><a class="nav-link text-black" href="?action=home">메인</a></li>
			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle active" style="color:#FF7493; font-weight:bold;" href="#">식단/운동 유형검사</a>
				<ul class="dropdown-menu w-100">
					<li><a class="dropdown-item" style="color:#FF7493;" href="?action=menuTest">식단 유형검사</a></li>
					<li><a class="dropdown-item" style="color:#FF7493;" href="?action=sportTest">운동 유형검사</a></li>
				</ul></li>
			<li class="nav-item"><a class="nav-link text-black" href="?action=scheduler">스케쥴러</a></li>
			<li class="nav-item"><a class="nav-link text-black" href="?action=dictionary">칼로리 사전</a></li>
			<li class="nav-item"><a class="nav-link text-black" href="?action=bmi">BMI 계산</a></li>
			<li class="nav-item"><a class="nav-link text-black" href="?action=community">커뮤니티</a></li>
		</ul>
		
		<div class="container w-75 mt-5 mx-quto">
		<div class="container text-center">
		<h2 style="font-weight: bold; color: #3C5087;">나의 식단 유형은?</h2></div>
		<br> <br>
		
		<div style="padding-left: 50px;">
		<div class="form-check mb-4">
			<label>질문1. 목표가 단기다이어트 (2주) 인가요?</label><br><br>
			<input class="form-check-input ms-3" name="Q1" type="radio" value="true" checked> 
			<label class="form-check-label ms-3" for="flexRadioDefault1"> 네! 단기간에 빼고 싶어요.</label><br>
			<input class="form-check-input ms-3" name="Q1" type="radio" value="false"> 
			<label class="form-check-label ms-3" for="flexRadioDefault1"> 아니요.. 한달이상 고려하고있어요.</label><br>
		</div>
		
		<div class="form-check mb-4">
			<label>질문2. 디톡스가 효과와 필요성이 있다고 생각하나요?</label><br><br>
			<input class="form-check-input ms-3" name="Q2" type="radio" value="true" checked> 
			<label class="form-check-label ms-3" for="flexRadioDefault1"> 네!디톡스 해독은 좋다고 생각해요.</label><br>
			<input class="form-check-input ms-3" name="Q2" type="radio" value="false"> 
			<label class="form-check-label ms-3" for="flexRadioDefault1"> 아니요.. 생각해본적없어요.</label><br>
		</div>
		
		<div class="form-check mb-4">
			<label>질문3. 고기보다 탄수화물이 더 중요하다고 생각하나요?</label><br><br>
			<input class="form-check-input ms-3" name="Q3" type="radio" value="true" checked> 
			<label class="form-check-label ms-3" for="flexRadioDefault1"> 한국인은 밥힘</label><br>
			<input class="form-check-input ms-3" name="Q3" type="radio" value="false"> 
			<label class="form-check-label ms-3" for="flexRadioDefault1"> 고기없인 못살아</label><br>
		</div>

		<div class="form-check mb-4">
			<label>질문4. 치킨먹을 때 닭다리를 좋아하나요?</label><br><br>
			<input class="form-check-input ms-3" name="Q4" type="radio" value="true" checked> 
			<label class="form-check-label ms-3" for="flexRadioDefault1"> 부드러운 닭다리가 최고지</label><br>
			<input class="form-check-input ms-3" name="Q4" type="radio" value="false"> 
			<label class="form-check-label ms-3" for="flexRadioDefault1"> 고소한 닭가슴살이 최고지</label><br>
		</div>
		
		<div class="form-check">
			<label>질문5. 한 끼를 먹을 때 배부르게 먹어야 한다고 생각하나요?</label><br><br>
			<input class="form-check-input ms-3" name="Q5" type="radio" value="true" checked> 
			<label class="form-check-label ms-3" for="flexRadioDefault1"> 한끼를 먹더라도 든든히</label><br>
			<input class="form-check-input ms-3" name="Q5" type="radio" value="false"> 
			<label class="form-check-label ms-3" for="flexRadioDefault1"> 적당히 먹어도 괜찮지</label><br>
		</div><br>
		
		<div class="d-flex justify-content-center">
		<input id="submit_button" type="submit" value="결과 보기" class="btn btn-outline-info mb-3"></div>

		<form id="submit" method="post" action="?action=doMenuTest">
			<input id="result" type="hidden" name="menuType" value="" /> 			
		</form>
		</div></div>

		<script src="/Diet/JS/menu_test.js"></script>

	</div>
</body>
</html>