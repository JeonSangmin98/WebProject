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

.finalIdCheck {
	display: none;
}

.finalPwCheck {
	display: none;
}

.finalPwsCheck {
	display: none;
}

.finalNameCheck {
	display: none;
}

.finalAddrCheck {
	display: none;
}

.finalEmailCheck {
	display: none;
}

.inputPwsTrue {
	display: none;
}

.inputPwsFalse {
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
					이미 존재합니다.</small> <span class="finalIdCheck text-warning">아이디를
					입력해주세요.</span>
			</div>
			<div class="form-group" style="user-select: auto;">
				<label class="form-label mt-4" style="user-select: auto;">비밀번호</label>
				<input type="password" class="form-control inputPw"
					placeholder="Password" style="user-select: auto;" name="memberPw">
				<span class="finalPwCheck text-warning">비밀번호를 입력해주세요.</span>
			</div>
			<div class="form-group" style="user-select: auto;">
				<label class="form-label mt-4" style="user-select: auto;">비밀번호
					확인</label> <input type="password" class="form-control inputPws"
					placeholder="Password confirm" style="user-select: auto;"
					name="memberPws" oninput="checkPw()"> <span
					class="finalPwsCheck text-warning">비밀번호 확인을 입력해주세요.</span> <span
					class="inputPwsTrue text-success">비밀번호가 일치합니다.</span> <span
					class="inputPwsFalse text-danger">비밀번호가 일치하지 않습니다.</span>
			</div>
			<div class="addrWrap" style="user-select: auto;">
				<label class="form-label mt-4" style="user-select: auto;">주소
				</label>
				<div class="addr1">
					<input class="inputAddr1" style="user-select: auto;"
						name="memberAddr1" readonly="readonly">
					<button type="button" onclick="executeDaumAddr()"
						class="btn btn-primary">주소 찾기</button>
				</div>
				<div class="clearfix"></div>
				<div class="addr2">
					<input class="form-control inputAddr2" style="user-select: auto;"
						name="memberAddr2" readonly="readonly">
				</div>
				<input class="form-control inputAddr3" style="user-select: auto;"
					name="memberAddr3" readonly="readonly"> <span
					class="finalAddrCheck text-warning">상세주소를 입력해주세요.</span>
			</div>
			<div class="form-group" style="user-select: auto;">
				<label class="form-label mt-4" style="user-select: auto;">이름</label>
				<input type="text" class="form-control inputName" placeholder="이름"
					style="user-select: auto;" name="memberName"> <span
					class="finalNameCheck text-warning">이름을 입력해주세요.</span>
			</div>
			<div class="form-group" style="user-select: auto;">
				<label class="form-label mt-4" style="user-select: auto;">이메일
				</label> <input type="email" class="form-control inputEmail"
					aria-describedby="emailHelp" placeholder="abc@naver.com"
					style="user-select: auto;" name="memberMail"> <span
					class="finalEmailCheck text-warning">이메일을 입력해주세요.</span>
			</div>
			<div class="container text-center" style="margin-top: 40px">
				<input type="button" value="가입하기" class="btn btn-info joinBtn">
				<input type="reset" value="다시 작성" class="btn btn-warning">
			</div>
		</form>
	</div>





</body>
<script type="text/javascript" src="/resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	//유효성 검사
	let idCheck = false; //아이디
	let idsCheck = false; //아이디 중복 검사
	let pwCheck = false; //비밀번호
	let pwsCheck = false; //비밀번호 확인
	let pwscheckCheck = false; //비밀번호 확인 일치 확인
	let addrCheck = false; //상세주소 검사
	let nameCheck = false; //이름
	let emailCheck = false; //이메일

	
	$(".joinBtn").click(
			function() {
				let id = $(".inputId").val(); //id 입력 값
				let pw = $(".inputPw").val(); //pw 입력 값
				let pws = $(".inputPws").val(); //pw 확인 입력 값
				let name = $(".inputName").val(); // name 입력 값
				let email = $(".inputEmail").val(); //email 입력 값
				let addr = $(".inputAddr3").val(); // addr 입력 값

				//아이디 유효성 검사 (공통된 사항 -> input 태그 값이 빈 값일 경우 값을 입력하라고 알려줌.)
				if (id == "") {
					$(".finalIdCheck").css("display", "block");
					idCheck = false;
				} else {
					$(".finalIdCheck").css("display", "none");
					idCheck = true;
				}
				//비밀번호 유효성 검사
				if (pw == "") {
					$(".finalPwCheck").css("display", "block");
					pwCheck = false;
				} else {
					$(".finalPwCheck").css("display", "none");
					pwCheck = true;
				}
				//비밀번호 확인 유효성 검사
				if (pws == "") {
					$(".finalPwsCheck").css("display", "block");
					pwsCheck = false;
				} else {
					$(".finalPwsCheck").css("display", "none");
					pwsCheck = true;
				}
				//이름 유효성 검사
				if (name == "") {
					$(".finalNameCheck").css("display", "block");
					nameCheck = false;
				} else {
					$(".finalNameCheck").css("display", "none");
					nameCheck = true;
				}
				//이메일 유효성 검사
				if (email == "") {
					$(".finalEmailCheck").css("display", "block");
					emailCheck = false;
				} else {
					$(".finalEmailCheck").css("display", "none");
					emailCheck = true;
				}
				//주소 유효성 검사
				if (addr == "") {
					$(".finalAddrCheck").css("display", "block");
					addrCheck = false;
				} else {
					$(".finalAddrCheck").css("display", "none");
					addrCheck = true;
				}
				//최종 유효성 검사 모든값이 true이면 submit 
				if (idCheck && idsCheck && pwCheck && pwsCheck && pwscheckCheck
						&& addrCheck && emailCheck && nameCheck) {
					$(".joinForm").submit();
				}
				
				return false;
				
			});

	//아이디 중복검사  (oninput event는 입력 하면 바로 데이터 확인 해줌)
	function checkId() {
		let memberId = $(".inputId").val(); //input 입력값
		console.log(memberId);

		$.ajax({
			type : "post",
			url : "/member/idCheck",
			data : {
				memberId : memberId
			},
			success : function(result) {
				/* console.log("성공 여부 " + result); */
				if (result != 'fail') {
					$(".idTrue").css("display", "inline-block");
					$(".idFalse").css("display", "none");
					idsCheck = true; // 아이디 중복 검사는 반대로 값을 넘겨줌 
				} else {
					$(".idTrue").css("display", "none");
					$(".idFalse").css("display", "inline-block");
					idsCheck = false;
				}
			},
			error : function() {
				alert("에러입니다");
			}
		}); //end ajax
	}; //end checkId()

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

	//비밀번호 확인 일치 유효성 검사
	function checkPw() {
		let pw = $(".inputPw").val();
		let pws = $(".inputPws").val();
		$(".finalPwsCheck").css('display', 'none');
		
		
		//비밀번호와 비밀번호 확인 값이 일치 시 inputPwsTrue span 태그 보여주고, 그렇지 않으면 inputPwsFalse span 태그 보여주기
		if(pw == pws){
			$('.inputPwsTrue').css('display','block');
			$('.inputPwsFalse').css('display','none');
			pwscheckCheck = true;
		}else{
			$('.inputPwsTrue').css('display','none');
			$('.inputPwsFalse').css('display','block');
			pwscheckCheck = false;
		}
	}
</script>
</html>