<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<head>
 <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<!-- Favicons -->
  <link href="/resources/assets/img/favicon.png" rel="icon">
  <link href="/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="/resources/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="/resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="/resources/assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/resources/assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: NiceAdmin - v2.4.1
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
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
<body>
  <main>
    <div class="container">
      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-6 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="d-flex justify-content-center py-4">
                <a href="/mainHome" class="logo d-flex align-items-center w-auto">
                  <img src="/resources/assets/img/logo.png" alt="">
                  <span class="d-none d-lg-block">Book Store</span>
                </a>
              </div><!-- End Logo -->

              <div class="card mb-3">
                <div class="card-body">
                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">회원가입</h5>
                    <p class="text-center small">회원가입을 위한 정보를 입력해주세요</p>
                  </div>

                  <form class="row g-3 needs-validation joinForm" method="post" action="/member/join">
                    <div class="col-12">
                      <label for="yourName" class="form-label">아이디</label>
                      <input type="text" class="form-control inputId" placeholder="ID" name="memberId" oninput="checkId()">
					  <small class="form-text text-success idTrue">사용 가능한 아이디입니다.</small> 
					  <small class="form-text text-danger idFalse">아이디가 이미 존재합니다.</small> 
					  <span class="finalIdCheck text-warning">아이디를 입력해주세요.</span>
                    </div>
					
					<div class="col-6">
                      <label for="yourPassword" class="form-label">비밀번호</label>
                      <input type="password" class="form-control inputPw" placeholder="Password" name="memberPw">
					  <span class="finalPwCheck text-warning">비밀번호를 입력해주세요.</span>
                    </div>
                    
                    <div class="col-6">
                      <label for="yourPassword" class="form-label">비밀번호 확인</label>
                      <input type="password" class="form-control inputPws" placeholder="Password confirm" name="memberPws" oninput="checkPw()"> 
					  <span class="finalPwsCheck text-warning">비밀번호 확인을 입력해주세요.</span> 
					  <span class="inputPwsTrue text-success">비밀번호가 일치합니다.</span> 
					  <span class="inputPwsFalse text-danger">비밀번호가 일치하지 않습니다.</span>
                    </div>
                    
                    <div class="col-6">
	                    <label for="yourEmail" class="form-label">주소</label>
						<input class="form-control inputAddr1" name="memberAddr1" readonly="readonly">
						<button type="button" onclick="executeDaumAddr()" class="btn btn-primary">주소 찾기</button>
					</div>
					<div class="col-12">
						<input class="form-control inputAddr2" name="memberAddr2" readonly="readonly">
					</div>
					<div class="col-12">
						<input class="form-control inputAddr3" name="memberAddr3" readonly="readonly"> 
						<span class="finalAddrCheck text-warning">상세주소를 입력해주세요.</span>
					</div>
                    <div class="col-12">
                    	<label for="yourUsername" class="form-label">이름</label>
                    	<input type="text" class="form-control inputName" placeholder="이름" name="memberName"> 
						<span class="finalNameCheck text-warning">이름을 입력해주세요.</span>
                    </div>
                    <div class="col-12">
                    	<label for="yourUsername" class="form-label">메일</label>
                    	<input type="email" class="form-control inputEmail" aria-describedby="emailHelp" placeholder="abc@naver.com" name="memberMail"> 
						<span class="finalEmailCheck text-warning">이메일을 입력해주세요.</span>
                    </div>

                    <div class="col-12">
                      <!-- <button class="btn btn-primary w-100 joinBtn" type="submit">회원가입</button> -->
                      <input type="button" value="회원가입" class="btn btn-primary w-100 joinBtn">
                    </div>
                    <div class="col-12">
                      <p class="small mb-0">계정을 이미 가지고 계십니까? <a href="/member/login">로그인</a></p>
                    </div>
                  </form>
                </div>
              </div>

              <div class="credits">
                <!-- All the links in the footer should remain intact. -->
                <!-- You can delete the links only if you purchased the pro version. -->
                <!-- Licensing information: https://bootstrapmade.com/license/ -->
                <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
                Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
              </div>

            </div>
          </div>
        </div>
      </section>
    </div>
  </main><!-- End #main -->

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
<script type="text/javascript" src="/resources/js/jquery-3.6.1.min.js"></script>
<!-- <script type="text/javascript" src="/resources/js/bootstrap.min.js"></script> -->
<!-- Vendor JS Files -->
<script src="/resources/assets/vendor/apexcharts/apexcharts.min.js"></script>
<script src="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/assets/vendor/chart.js/chart.min.js"></script>
<script src="/resources/assets/vendor/echarts/echarts.min.js"></script>
<script src="/resources/assets/vendor/quill/quill.min.js"></script>
<script src="/resources/assets/vendor/simple-datatables/simple-datatables.js"></script>
<script src="/resources/assets/vendor/tinymce/tinymce.min.js"></script>
<script src="/resources/assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="/resources/assets/js/main.js"></script>
<script type="text/javascript" src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
				console.log("test");
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
</body>
</html>