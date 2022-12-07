<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../menu.jsp"%>
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
<main id="main" class="main">
	<div class="pagetitle">
		<h1>마이페이지</h1>
	</div>

	<div class="card">
		<div class="card-body">
			<h5 class="card-title">
				<strong class="text-muted">${info.memberName}</strong>님 회원 정보
			</h5>
			<form action="/member/modify" method="post"
				class="row g-3 modifyForm">
				<div class="col-md-12">
					<label for="inputName5" class="form-label">이름</label> <input
						type="text" class="form-control inputName updateMember"
						value="${info.memberName}" name="memberName" readonly="readonly">
				</div>
				<div class="col-md-6">
					<label for="inputEmail5" class="form-label">메일</label> <input
						type="email" class="form-control  inputEmail updateMember"
						name="memberMail" value="${info.memberMail}" readonly="readonly">
				</div>
				<div class="col-md-6 updatePassword">
					<label for="inputPassword5" class="form-label">비밀번호</label> <input
						type="password" class="form-control inputPw updateMember"
						name="memberPw"> <span
						class="checkPassword text-warning">비밀번호를 입력해주세요.</span>
				</div>
				<div class="col-12">
					<label for="inputAddress5" class="form-label">주소</label> <input
						type="text" class="form-control inputAddr1 updateMember"
						name="memberAddr1" value="${info.memberAddr1}" readonly="readonly">
					<button type="button" class="btn btn-primary attrBtn"
						onclick="executeDaumAddr()">주소 찾기</button>
				</div>
				<div class="col-12">
					<input type="text" class="form-control inputAddr2 updateMember"
						name="memberAddr2" value="${info.memberAddr2}" readonly="readonly">
				</div>
				<div class="col-12">
					<input type="text" class="form-control inputAddr3 updateMember"
						name="memberAddr3" value="${info.memberAddr3}" readonly="readonly">
				</div>
				<div class="text-center">
					<input type="button" value="정보 수정"
						class="btn btn-warning modifyBtn"> <input type="button"
						value="회원 탈퇴" class="btn btn-danger deleteBtn"> <input
						type="button" value="수정 완료" class="btn btn-info updateBtn">
				</div>
				<input type="hidden" name="memberId" value="${member.memberId}">
			</form>
		</div>
	</div>

	<div class="modal fade" id="verticalycentered" tabindex="-1"
		style="display: none;" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">회원 탈퇴</h5>
				</div>
				<div class="modal-body">
					<p>정말 회원탈퇴를 하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary realDeleteBtn">네</button>
					<button type="button" class="btn btn-secondary closeBtn">아니요</button>
				</div>
			</div>
		</div>
	</div>
	<form action="/member/delete" method="post" class="deleteForm">
		<input type="hidden" name="memberId" value="${member.memberId}">
	</form>
</main>
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
<%@ include file="../footer.jsp"%>