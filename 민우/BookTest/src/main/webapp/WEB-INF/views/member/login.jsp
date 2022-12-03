<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

	<form action="/member/login" method="post" class="loginForm">
		<label class="form-label mt-4" style="user-select: auto;">아이디</label>
		<input type="text" class="form-control inputId" placeholder="ID"
			style="user-select: auto;" name="memberId">
		<div class="form-group" style="user-select: auto;">
			<label class="form-label mt-4" style="user-select: auto;">비밀번호</label>
			<input type="password" class="form-control" placeholder="Password"
				style="user-select: auto;" name="memberPw">
		</div>
		<c:if test="${result==0}">
			<div><p class="text-danger">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</p></div>
		</c:if>
		<input type="button" class="btn btn-lg btn-primary loginBtn"
			value="로그인">
	</form>
</body>
<script type="text/javascript" src="/resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(".loginBtn").click(function() {
		$(".loginForm").submit();
	});
</script>

</html>