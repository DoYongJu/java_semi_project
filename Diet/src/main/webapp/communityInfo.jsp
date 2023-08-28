<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 게시물 보기</title>

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
		<br> <br>
		<br>

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
			<span class="navbar-brand ms-3"
				style="font-size: 20pt; font-weight: bold;">게시물 보기</span>
			<form action="<c:url value="?action=community"/>" method="post">
				<input class="btn btn-secondary btn-sm me-3" type="submit" id="scheduleOfWeek" name="type" value="전체보기" /> 
				<input class="btn btn-secondary btn-sm me-3" type="submit" id="scheduleOfMonth" name="type" value="자유게시판" />
				<input class="btn btn-secondary btn-sm me-3" type="submit" id="scheduleOfMonth" name="type" value="전문가꿀팁" />
			</form>
		</nav>
		<br>
		<br><br>

		<div class="container-sm mb-5">
			<h3 style="text-align: center;">${post[4]}</h3>
			<p style="text-align: right;">작성자: ${post[6]}</p>
			<p style="text-align: right;">작성일: <fmt:formatDate value="${post[3]}" pattern="yyyy-MM-dd" /></p>
			<hr><br>
			<div class="d-flex justify-content-center">
				<img src="${post[2]}" class="mb-5">				
			</div>
				<div class="d-flex justify-content-center">					
					<p>${post[1]}</p>
				</div>
			<hr>
			
			<c:if test="${post[5] == user.id}">
			<div class="d-flex justify-content-end">
			<a class="btn btn-light bg-danger-subtle" role="button" href="?action=updatePost&listId=${post[0]}">글 수정</a>
			<a data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-light bg-danger-subtle ms-3" role="button" href="#">글 삭제</a></div>
			</c:if><br>
			
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">정말로 삭제하시겠습니까?</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        삭제된 게시물은 복구할 수 없습니다.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <a class="btn btn-light bg-danger-subtle ms-3" role="button" href="?action=deletePost&listId=${post[0]}">삭제</a>
      </div>
    </div>
  </div>
</div>
			
			<div class="container">
			<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tr>
					<td align="left" bgcolor="beige" style="font-weight: bold;">댓글</td><td></td>	
				</tr>
				<c:forEach var="comment" items="${comments}" varStatus="status">
				<tr>
					<td class="col-3" align="left">${comment[2]} (${comment[3]}회원) /${comment[4]}</td>
					<td align="left">${comment[5]}
					
					<c:if test="${comment[1] == user.id}">
					<div class="d-flex justify-content-end">
			<a class="btn btn-light bg-danger-subtle btn-sm" role="button" href="?action=deleteComment&listId=${comment[6]}&commentId=${comment[0]}">댓글 삭제</a>
			</div></c:if>				
								
					</td>						
				</tr>
				</c:forEach>
				</table>
				</div>
		<div class="form-group">
		<form method="post" action="?action=comment&listId=${post[0]}">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tr>
					<td style="border-bottom:none;" valign="middle">${user.userName} (${user.type}회원)</td>
					<td><input type="text" style="height:100px;" class="form-control" placeholder="상대방을 존중하는 댓글을 남깁시다." name = "commentText"></td>
					<td valign="middle"><input type="submit" class="btn-primary pull" value="댓글 작성"></td>
				</tr>
			</table>
		</form>
		</div>
		</div>
			
		</div>
	</div>
	
</body>
</html>