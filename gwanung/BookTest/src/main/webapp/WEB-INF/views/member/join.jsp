<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
.idTrue {
	display: none;
}

.idFalse {
	display: none;
}
</style>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="container" style="user-select: auto;">
		<div class="page-header" id="banner" style="user-select: auto;">
			<div class="row" style="user-select: auto;">
				<div class="col-lg-8 col-md-7 col-sm-6" style="user-select: auto;">
					<h1 style="user-select: auto;">회원가입</h1>
					<p class="text-info" style="user-select: auto;">회원가입 테스트</p>
				</div>
				<div class="col-lg-4 col-md-5 col-sm-6" style="user-select: auto;">
					<div class="sponsor" style="user-select: auto;"></div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<form method="post" class="joinForm" action="/member/join">
			<div class="form-group" style="user-select: auto;">
				<label class="form-label mt-4" style="user-select: auto;">아이디</label>
				<input type="text" class="form-control inputId" placeholder="ID"
					style="user-select: auto;" name="memberId" oninput="checkId()">
				<small class="form-text text-success idTrue"
					style="user-select: auto;">사용 가능한 아이디입니다.</small> <small
					class="form-text text-danger idFalse" style="user-select: auto;">아이디가
					이미 존재합니다.</small>
			</div>
			<div class="form-group" style="user-select: auto;">
				<label class="form-label mt-4" style="user-select: auto;">비밀번호</label>
				<input type="password" class="form-control" placeholder="Password"
					style="user-select: auto;" name="memberPw">
			</div>
			<div class="form-group" style="user-select: auto;">
				<label class="form-label mt-4" style="user-select: auto;">이름</label>
				<input type="text" class="form-control" placeholder="이름"
					style="user-select: auto;" name="memberName">
			</div>
			<div class="form-group" style="user-select: auto;">
				<label class="form-label mt-4" style="user-select: auto;">이메일
				</label> <input type="email" class="form-control"
					aria-describedby="emailHelp" placeholder="abc@naver.com"
					style="user-select: auto;" name="memberMail">
			</div>
			<div class="container text-center" style="margin-top: 40px">
				<input type="button" value="가입하기" class="btn btn-info joinBtn"> <input
					type="reset" value="다시 작성" class="btn btn-warning">
			</div>
		</form>
	</div>





</body>
<script type="text/javascript" src="/resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
	//회원가입
	$(".joinBtn").click(function() {
		$(".joinForm").submit();
	});

	//아이디 중복검사  (oninput event는 입력 하면 바로 데이터 확인 해줌)
	function checkId() {
		var memberId = $(".inputId").val(); //input 입력값
		console.log(memberId);
		
		$.ajax({
			type : "post",
			url : "/member/idCheck",
			data : {memberId : memberId},
			success : function(result) {
				console.log("성공 여부 " + result);
				if (result != 'fail') {
					$(".idTrue").css("display", "inline-block");
					$(".idFalse").css("display", "none"); 
				} else {
					$(".idTrue").css("display", "none");
					$(".idFalse").css("display", "inline-block");
				}
			},
			error : function () {
				alert("에러입니다");
			}
		}); //end ajax
	};
</script>
</html>