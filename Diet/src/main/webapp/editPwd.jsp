<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>


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

#navList:hover {
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
			<li class="nav-item"><a class="nav-link text-black"
				href="?action=scheduler">스케쥴러</a></li>
			<li class="nav-item"><a class="nav-link text-black"
				href="?action=dictionary">칼로리 사전</a></li>
			<li class="nav-item"><a class="nav-link text-black"
				href="?action=bmi">BMI 계산</a></li>
			<li class="nav-item"><a class="nav-link text-black"
				href="?action=community">커뮤니티</a></li>
		</ul>

		<div class="container text-center">
			<div class="row">
				<div class="col-sm-3">
					<ul class="nav flex-column bg-danger-subtle h-100">
						<li class="nav-item"><a href="?action=myPage"><img
								src="images/profile.png" alt="프로필 사진" width="130" height="130"
								class="mt-5 mb-5"></a></li>
						<li class="nav-item" id="navList"><a
							class="nav-link active mt-3 text-info-emphasis"
							aria-current="page" href="?action=MenuTestResult">나의 식단 유형</a></li>
						<li class="nav-item" id="navList"><a
							class="nav-link mt-3 text-info-emphasis"
							href="?action=SportTestResult">나의 운동 유형</a></li>
						<li class="nav-item" id="navList"><a
							class="nav-link mt-3 text-info-emphasis" aria-disabled="true"
							href="?action=report">스케쥴 성취 보고서</a></li>
						<li class="nav-item" id="navList"><a
							class="nav-link mt-3 text-info-emphasis" href="?action=scheduler">목표
								작성</a></li>
						<li class="nav-item" id="navList"><a
							class="nav-link mt-3 text-info-emphasis" aria-disabled="true"
							href="?action=community">커뮤니티</a></li>
					</ul>

				</div>

				<div class="col-sm-8" style="height: 800px;">
					<br> <br>

					<h2 style="font-weight: bold; margin-left: 50px;">MY ACCOUNT</h2>
					<div style="padding-top: 50px; padding-left: 50px;">
						<h3 style="margin-left: 4px;">비밀번호 변경</h3> <br><br>
						<form id="submit" action="<c:url value="?action=doEdit"/>"
							method="post" id="login_form">
							<div class="form-floating mb-3">
								<input type="email" id="password" type="password"
									name="password" class="form-control" placeholder="Email"><label
									for="email">새 비밀번호 입력:</label>
							</div>
							<div class="form-floating mb-3">
								<input type="email" id="password_re" type="password"
									class="form-control" placeholder="Email"><label
									for="email">비밀번호 재입력:</label>
							</div>

						</form>
						<input type="submit" id="edit_pwd_bt" name="password" value="저장"
							class="btn btn-light bg-danger-subtle">

					</div>

					<br> <br>

				</div>

				<div style="height: 180px;"></div>

				<div class="d-flex justify-content-end">
					<input type="submit" name="resign" value="회원 탈퇴"
						class="btn btn-light bg-danger-subtle">
				</div>
				<script src="/Diet/JS/edit_info.js"></script>

			</div>
		</div>
	</div>
</body>
</html>