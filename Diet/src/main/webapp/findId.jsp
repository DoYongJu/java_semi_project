<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>

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
				<form id="submit" method="post" action="?action=doFindID">
				<br><br><br><br>
					<h1 style="text-align: center; font-weight: bold;">Find ID</h1><br>

					<div class="form-floating mb-3">
						<input type="text" class="form-control" name="email"
							id="email" placeholder="Id"> <label for="user_name">가입하신 이메일을 입력하세요.</label>
					</div>
				
				<br>
				<p>${userName}</p>
				
				<br>
				<a class="link-offset-2 link-underline link-underline-opacity-0 me-3"
				style="color: #FF7493; font-weight: bold;" href="?action=findPWD">비밀번호 찾기</a>
				<a class="link-offset-2 link-underline link-underline-opacity-0 me-3"
				style="color: #FF7493; font-weight: bold;" href="?action=signUp">회원가입</a>
							
				<div class="d-grid gap-2"> <br>
				<input id="checkValid_button" type="submit" value="찾기" class="btn btn-outline-info btn-lg">
				</div>
				</form>
			</div>
			
			 <div class="col-sm-1" id="divLogo">
			 <a href="?action=index"><img class="ms-3" src="images/logo.png" alt="로고 배너" width="300" height="150" /></a>
			 </div>
		</div>
	</div>


</body>
</html>
