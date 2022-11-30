<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<style>
#banner{
	text-align : center;
}
.page-body{
	padding: 0px 30%;
	
}
.form-group{
	padding-top : 20px;
}
.loginBtn{
  	width: 100%;
}
#banner{
	padding: 30px;
}
#loginBtn{
	padding: 60px 0px 0px;
}
</style>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="bs-docs-section">
		<div class="row">
			<div class="col-lg-12">
				<div class="page-header" id="banner">
					<h1 id="containers">로그인</h1>
					<p class="text-info">로그인 테스트</p>
				</div>
			</div>
		</div>
		<div class="page-body">
			<form action="/member/login" method="post" class="loginForm">
				<div class="form-group">
					<label class="col-form-label col-form-label-lg mt-4" for="inputLarge">아이디</label>
					<input type="text" class="form-control inputId" placeholder="ID" name="memberId">
				</div>
				<div class="form-group">
					<label class="col-form-label col-form-label-lg mt-4" for="inputLarge">비밀번호</label>
					<input type="password" class="form-control" placeholder="Password" name="memberPw">
				</div>
				<c:if test="${result==0}">
					<div>
						<p class="text-danger">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</p>
					</div>
				</c:if>
				<div class="form-group" id="loginBtn">
					<input type="button" class="btn btn-lg btn-primary loginBtn" value="로그인">
				</div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript" src="/resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(".loginBtn").click(function() {
		$(".loginForm").submit();
	});
</script>
</html>