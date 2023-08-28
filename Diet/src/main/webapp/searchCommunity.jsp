<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 조회 후 페이지</title>

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
		<br><br><br>

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
			<span class="navbar-brand ms-3" style="font-size: 20pt; font-weight: bold;">커뮤니티</span>
		<form action="<c:url value="?action=dictionary"/>" method="post">
			<input class="btn btn-secondary btn-sm me-3" type="submit" id="scheduleOfWeek" name="type" value="전체 보기" /> 
			<input class="btn btn-secondary btn-sm me-3" type="submit" id="scheduleOfMonth" name="type" value="자유 게시판" />
			<input class="btn btn-secondary btn-sm me-3" type="submit" id="scheduleOfMonth" name="type" value="전문가 꿀팁" />
		</form>
		</nav>		
		<br>
		
		
		<div class="container text-center">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>작성일</th>
					<th>타입</th>
				</tr>
			</thead>
			
			<tbody>			
			<c:forEach var="list" items="${searchedlists}" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${list[6]}</td>
					<td class="col-7"><a href="?action=communityInfo&listId=${list[0]}" class="text-decoration-none" style="color: black;">${list[5]}</a></td>
					<td>${list[3]}</td>
					<c:if test="${list[7].equals('전문')}">
					<td style="color: #FF7493;">${list[7]}</td>
					</c:if>
					<c:if test="${list[7].equals('일반')}">
					<td style="color: grey;">${list[7]}</td>
					</c:if>
				</tr>
			</c:forEach>
			</tbody>		
		</table>
		</div>
		
		
		
		<br><br>		
		<div class="d-flex justify-content-center">
		<form class="row g-3">
			<div class="col-auto">
				<select class="form-select form-select"
					aria-label="Large select example" name="searchType">
					<option selected>검색 유형</option>
					<option value="">작성자</option>
					<option value="">제목</option>
					<option value="">작성일</option>
				</select>
			</div>
			<div class="col-auto">
				<div class="input-group">
					<input type="text" class="form-control"
						placeholder="검색 내용을 입력하세요" aria-label="search Content"
						aria-describedby="button-addon2" name="searchContent" value="">
					<button class="btn btn-outline-secondary" type="button"
						id="button-addon2">검색</button>
				</div>
			</div>
				<div class="col-auto">
					<a class="btn btn-light bg-danger-subtle ms-5" role="button" href="?action=post">글 작성</a>
				</div>
							
		</form>
		</div>
		


	</div>
</body>
</html>