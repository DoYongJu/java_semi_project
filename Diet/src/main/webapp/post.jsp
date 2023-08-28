<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 글 작성</title>

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
		<br> <br><br>

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
			<li class="nav-item"><a class="nav-link active"
				href="?action=community" style="color: #FF7493; font-weight: bold;">커뮤니티</a></li>
		</ul>
		
		<br>
		<nav class="navbar navbar-light bg-light">
			<span class="navbar-brand ms-3" style="font-size: 20pt; font-weight: bold;">글 쓰기</span>
			<form action="<c:url value="?action=community"/>" method="post">
				<input class="btn btn-secondary btn-sm me-3" type="submit" id="scheduleOfWeek" name="type" value="전체보기" /> 
				<input class="btn btn-secondary btn-sm me-3" type="submit" id="scheduleOfMonth" name="type" value="자유게시판" />
				<input class="btn btn-secondary btn-sm me-3" type="submit" id="scheduleOfMonth" name="type" value="전문가꿀팁" />
			</form>
		</nav>		
		
		<br><br>
		<div class="container-sm mb-5">
			<form method="post" action="?action=addPost" enctype="multipart/form-data">
				<input type="hidden" name="update" value="${c.id}">
				<input type="hidden" name="image" value="${c.image}">
				<label class="form-label">제목</label> 
				<input type="text" name="title" class="form-control" value="${c.title}"><br> 
				<label class="form-label">이미지</label>
				<input type="file" name="file" class="form-control"><br>
				<label class="form-label">글 내용</label>
				<textarea cols="10" rows="20" name="content" class="form-control">${c.content}</textarea>
				<div class="d-grid gap-2 mt-3">
				<button type="submit" class="btn btn-light bg-danger-subtle mt-3 mb-3">저장</button>
				</div>
			</form>
		</div>
	</div>
	
	<script src="/Diet/JS/addPost.js"></script>
</body>
</html>