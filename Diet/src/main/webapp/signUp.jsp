<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>회원가입창</title>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@500&display=swap')
	;

* {
	font-family: 'Noto Serif KR', serif;
	font-size: 17px;
}

#divLogin {
position: absolute;
margin: -350px 0px 0px -450px;
top: 50%;
left: 50%;
}

#divLogo {
margin: 180px 0px 0px 0px;
top: 50%;
left: 50%;
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
	<div class="container-sm m-5">

		<div class="row" id="divLogin">

			<div class="col-sm-10">
					<h1 style="text-align: center; font-weight: bold;">SIGN UP</h1><br>

					<div class="form-floating mb-3">
						<input type="text" class="form-control" name="userName"
							id="user_name" placeholder="Id"> <label for="user_name">User
							ID</label>
					</div>

					<div class="form-floating mb-3">
						<input type="password" class="form-control" name="password"
							id="pwd" placeholder="Password"><label
							for="password">Password</label>
					</div>

					<div class="input-group mb-3">
						<input type="password" class="form-control" name="password"
							id="password_re" placeholder="Confirm Password"
							aria-label="Confirm Password"
							aria-describedby="checkPassword_Button">
						<button class="btn btn-outline-secondary" type="button"
							id="checkPassword_Button">비밀번호 확인</button>
					</div>

					<div class="form-floating mb-3">
						<input type="email" class="form-control" name="email" id="email_info"
							placeholder="Email"><label for="email">E-mail
							Address</label>
					</div>
					<p>Type</p>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" name = "radio" type="radio" id="inlineCheckbox1" value="일반"  checked>
					  <label class="form-check-label" for="inlineCheckbox1">일반 회원</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" name = "radio" type="radio" id="inlineCheckbox2" value="전문">
					  <label class="form-check-label" for="inlineCheckbox2">전문 회원</label>
					</div>



				<div class="d-grid gap-2"> <br>
				<input id="checkValid_button" type="submit" value="가입" class="btn btn-outline-info btn-lg">
				</div>

			<form id="submit" method="post" action="?action=doSignUp">
				<input type="hidden" name="userName" id="userName"value="" /> 
				<input type="hidden" name="password" id="password"value="" /> 
				<input type="hidden" name="email" id="email"value="" /> 
				<input type="hidden" name="type" id="type" value="" /> 			
			</form>
		
			</div>
			
			 <div class="col-sm-1" id="divLogo">
			 <a href="?action=index"><img class="ms-3" src="images/logo.png" alt="로고 배너" width="300" height="150" /></a>
			 </div>
		</div>
	</div>

	<script src="/Diet/JS/sign_In.js"></script>

</body>
</html>
