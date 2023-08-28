<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@500&display=swap')
	;

* {
	font-family: 'Noto Serif KR', serif;
	font-size: 17px;
}

#loginDiv {
	width: 1000px;
	margin-left: 120px;
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
		<div class="d-flex justify-content-center">				
			<a href="?action=index"><img src="images/logo.png" alt="로고 배너"
				width="300" height="150" class="mt-4"/></a>
		</div>

<br><br>
		<div id="loginDiv">
			<form action="<c:url value="?action=doLogin"/>" method="post"
				id="login_form">
				<h1 style="text-align: left; font-weight: bold;">LOG IN</h1>
				<br>

				<div class="form-floating mb-3">
					<input type="text" class="form-control" name="username" id="id"
						value="" placeholder="Id"> <label for="id">User ID
					</label>
				</div>

				<div class="form-floating mb-3">
					<input type="password" class="form-control" name="password" id="pw"
						value="" placeholder="Password"> <label for="pw">Password
					</label>
				</div>
			</form>

			<p>${msg}</p>

			<br>
			<div class="d-grid gap-2">
				<input id="login_bt" type="submit" value="login"
					class="btn btn-outline-info btn-lg">
			</div>
			<br> <a href="?action=findID"
				class="link-offset-2 link-underline link-underline-opacity-0 me-3"
				style="color: #FF7493; font-weight: bold;">아이디 찾기</a> <a
				href="?action=findPWD"
				class="link-offset-2 link-underline link-underline-opacity-0 me-3"
				style="color: #FF7493; font-weight: bold;">비밀번호 찾기</a> <a
				href="?action=signUp"
				class="link-offset-2 link-underline link-underline-opacity-0 me-3"
				style="color: #FF7493; font-weight: bold;">회원가입</a>
		</div>

		<c:set var="msg" scope="session" value="" />


	</div>

	<script src="/Diet/JS/login.js"></script>
</body>
</html>