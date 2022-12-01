<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="/resources/css/bootstrap.min.css?ver=1" rel="stylesheet">
<style type="text/css">
.attrBtn {
	display: none;
}

.updateBtn {
	display: none;
}

.updatePassword {
	display: none;
}

.checkPassword {
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
					<h1 style="user-select: auto;">마이페이지</h1>
					<p class="text-info" style="user-select: auto;">
						<strong class="text-muted">${info.memberName}</strong>님 회원 정보
					</p>
				</div>
				<div class="col-lg-4 col-md-5 col-sm-6" style="user-select: auto;">
					<div class="sponsor" style="user-select: auto;"></div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<form action="/member/modify" method="post" class="modifyForm">
			<div class="form-group" style="user-select: auto;">
				<label class="form-label mt-4" style="user-select: auto;">회원
					이름</label> <input type="text" class="form-control inputName updateMember"
					style="user-select: auto;" name="memberName"
					value="${info.memberName}" readonly="readonly">
			</div>
			<div class="form-group updatePassword" style="user-select: auto;">
				<label class="form-label mt-4" style="user-select: auto;">회원
					비밀번호</label> <input type="password"
					class="form-control inputPw updateMember"
					style="user-select: auto;" name="memberPw"> <span
					class="checkPassword text-warning">비밀번호를 입력해주세요.</span>

			</div>
			<div class="addrWrap" style="user-select: auto;">
				<label class="form-label mt-4" style="user-select: auto;">회원
					주소 </label>
				<div class="addr1">
					<input class="inputAddr1 updateMember" style="user-select: auto;"
						name="memberAddr1" value="${info.memberAddr1}" readonly="readonly">
					<button type="button" class="btn btn-primary attrBtn"
						onclick="executeDaumAddr()">주소 찾기</button>
				</div>
				<div class="clearfix"></div>
				<div class="addr2">
					<input class="form-control inputAddr2 updateMember"
						style="user-select: auto;" name="memberAddr2"
						value="${info.memberAddr2}" readonly="readonly">
				</div>
				<input class="form-control inputAddr3 updateMember"
					style="user-select: auto;" name="memberAddr3"
					value="${info.memberAddr3}" readonly="readonly">
			</div>
			<div class="form-group" style="user-select: auto;">
				<label class="form-label mt-4" style="user-select: auto;">회원
					이메일 </label> <input type="email"
					class="form-control inputEmail updateMember"
					style="user-select: auto;" name="memberMail"
					value="${info.memberMail}">
			</div>
			<div class="container text-center" style="margin-top: 40px">
				<input type="button" value="정보 수정" class="btn btn-warning modifyBtn">
				<input type="button" value="회원 탈퇴" class="btn btn-danger deleteBtn">
				<input type="button" value="수정 완료" class="btn btn-info updateBtn">
			</div>
			<input type="hidden" name="memberId" value="${member.memberId}">
		</form>
	</div>

	<div class="modal" style="user-select: auto;">
		<div class="modal-dialog" role="document" style="user-select: auto;">
			<div class="modal-content" style="user-select: auto;">
				<div class="modal-header" style="user-select: auto;">
					<h5 class="modal-title" style="user-select: auto;">회원 탈퇴</h5>
					<button type="button" class="btn-close" aria-label="Close"
						style="user-select: auto;">
						<span aria-hidden="true" style="user-select: auto;"></span>
					</button>
				</div>
				<div class="modal-body" style="user-select: auto;">
					<p style="user-select: auto;">정말 회원탈퇴를 하시겠습니까?</p>
				</div>
				<div class="modal-footer" style="user-select: auto;">
					<button type="button" class="btn btn-primary realDeleteBtn"
						style="user-select: auto;">네</button>
					<button type="button" class="btn btn-secondary closeBtn"
						style="user-select: auto;">아니요</button>
				</div>
			</div>
		</div>
	</div>

	<form action="/member/delete" method="post" class="deleteForm">
		<input type="hidden" name="memberId" value="${member.memberId}">
	</form>
</body>

<script type="text/javascript" src="/resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	let pwCheck = false;

	$(".modifyBtn").on("click", function() {
		/* console.log("click modify"); */
		$(".updateMember").attr("readonly", false);
		$(".attrBtn").css("display", "inline");
		$(".updateBtn").css("display", "inline");
		$(".deleteBtn").css("display", "none");
		$(".updatePassword").css("display", "inline");
	});

	$(".updateBtn").on("click", function() {
		let pw = $(".inputPw").val(); //pw 입력값

		//비밀번호 유효성검사
		if (pw == "") {
			$(".checkPassword").css("display", "block");
			pwCheck = false;
		} else {
			$(".checkPassword").css("display", "none");
			pwCheck = true;
		}

		if (pwCheck == true) {
			$(".modifyForm").submit();
			alert("수정 되었습니다 다시 로그인 해주세요.");
		}
		return false;
	});

	$(".deleteBtn").on("click", function() {
		/* console.log("click delete"); */
		$(".modal").modal("show");
	});

	$(".realDeleteBtn").on("click", function() {
		$(".deleteForm").submit();
		alert("회원 탈퇴가 완료되었습니다.");
	});

	$(".closeBtn").on("click", function() {
		$(".modal").modal("hide");
	});

	$(".btn-close").on("click", function() {
		$(".modal").modal("hide");
	});

	//다음 주소 api 사용
	function executeDaumAddr() {
		new daum.Postcode({
			oncomplete : function(data) {
				//검색 항목 내용 클릭 시 실행

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}

					//주소 변수 문자열과 참고항목 문자열 합치기
					addr += extraAddr;

				} else {
					addr += ' ';
				}
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				$(".inputAddr1").val(data.zonecode);
				$(".inputAddr2").val(addr);
				// 커서를 상세주소 필드로 이동한다.
				$(".inputAddr3").attr("readonly", false);
				$(".inputAddr3").focus();

			}
		}).open();
	} //end executeDaumAddr()
</script>
</html>