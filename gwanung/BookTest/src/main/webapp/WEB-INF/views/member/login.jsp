<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="container" style="user-select: auto;">
		<div class="page-header" id="banner" style="user-select: auto;">
			<div class="row" style="user-select: auto;">
				<div class="col-lg-8 col-md-7 col-sm-6" style="user-select: auto;">
					<h1 style="user-select: auto;">로그인</h1>
					<p class="text-info" style="user-select: auto;">로그인 테스트</p>
				</div>
				<div class="col-lg-4 col-md-5 col-sm-6" style="user-select: auto;">
					<div class="sponsor" style="user-select: auto;"></div>
				</div>
			</div>
		</div>
	</div>
	
	<form action="" method="post" class="loginForm">
		<label class="form-label mt-4" style="user-select: auto;">아이디</label>
		<input type="text" class="form-control inputId" placeholder="ID"
			style="user-select: auto;" name="memberId">
		<div class="form-group" style="user-select: auto;">
			<label class="form-label mt-4" style="user-select: auto;">비밀번호</label>
			<input type="password" class="form-control" placeholder="Password"
				style="user-select: auto;" name="memberPw">
		</div>
			<input type="button" class="btn btn-lg btn-primary loginBtn" value="로그인">
	</form>
</body>
</html>