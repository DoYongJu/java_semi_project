<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>칼로리 사전</title>


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
				<a href="?action=signUp"
					class="link-offset-2 link-underline link-underline-opacity-0 me-3"
					style="color: #FF7493; font-weight: bold;">회원가입</a> <a
					href="?action=login"
					class="link-offset-2 link-underline link-underline-opacity-0"
					style="color: #FF7493; font-weight: bold;">로그인</a>
			</div>
			
		<div class="d-flex justify-content-center">
			<a href="?action=index"><img src="images/logo.png" alt="로고 배너"
				width="300" height="150" /></a>
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
			<a href="?action=home"><img src="images/logo.png" alt="로고 배너"
				width="300" height="150" /></a>
		</div>
		<br><br><br>
		</c:if>

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
			<li class="nav-item"><a class="nav-link active"
				style="color: #FF7493; font-weight: bold;" href="?action=dictionary">칼로리
					사전</a></li>
			<li class="nav-item"><a class="nav-link text-black"
				href="?action=bmi">BMI 계산</a></li>
			<li class="nav-item"><a class="nav-link text-black"
				href="?action=community">커뮤니티</a></li>
		</ul>

		<br>
		<nav class="navbar navbar-light bg-light">
			<span class="navbar-brand ms-3"
				style="font-size: 20pt; font-weight: bold;">칼로리 검색</span>
		</nav>
		<br>
		<div class="d-flex justify-content-center">
		<div  class="w-50 p-3">
			<form class="row g-3" action="<c:url value="?action=searchDictionary"/>" method="post">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="검색 내용을 입력하세요"
							aria-label="search Content" aria-describedby="button-addon2"
							name="searchContent" value="">
							<input type="hidden" name="search" value="true">
						<button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
					</div>				
			</form>
		</div></div>
		<br><br>
		
<c:if test="${search.equals('true')}">

			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>분류</th>
						<th>이름</th>
						<th>칼로리</th>
						<th>단위</th>
						<th>타입</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="list" items="${searchList}" varStatus="i">
					<tr>
						<td>${i.count}</td>
						<td>${list.type}</td>
						<td>${list.title}</td>
						<td>${list.calory}</td>
						<td>${list.unit}</td>						
						<c:if test="${list.myType.equals('null')}">
						<td></td>
						</c:if>
						<c:if test="${!list.myType.equals('null')}">
						<td>${list.myType}</td>
						</c:if>						
					</tr>
				</c:forEach>
				</tbody>
			</table>
</c:if>

		<br>
		<br>
		<nav class="navbar navbar-light bg-light">
			<span class="navbar-brand ms-3" style="font-size: 20pt; font-weight: bold;">칼로리 사전</span>
		</nav>
		<br>


<div class="d-flex justify-content-center">
		<form action="<c:url value="?action=dictionary"/>" method="post">
			<input class="btn btn-secondary btn me-3" type="submit" id="scheduleOfWeek" name="type" value="음식" /> 
			<input class="btn btn-secondary btn" type="submit" id="scheduleOfMonth" name="type" value="운동" />
		</form>
</div>

		<br><br>
		<div class="container text-center">
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>분류</th>
						<th>이름</th>
						<th>칼로리</th>
						<th>단위</th>
						<th>타입</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="a" items="${allList}" varStatus="i">
					<tr>
						<td>${i.count}</td>
						<td>${a.type}</td>
						<td>${a.title}</td>
						<td>${a.calory}</td>
						<td>${a.unit}</td>
						<c:if test="${a.myType.equals('null')}">
						<td></td>
						</c:if>
						<c:if test="${!a.myType.equals('null')}">
						<td>${a.myType}</td>
						</c:if>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>

	</div>
</body>
</html>