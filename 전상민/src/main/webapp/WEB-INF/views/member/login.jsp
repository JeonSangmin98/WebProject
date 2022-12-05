<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
</head>
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
                   <h5 class="card-title text-center pb-0 fs-4">로그인 및 회원가입</h5>
                   <p class="text-center small">아이디와 비밀번호를 입력해주세요</p>
                 </div>

                 <form class="row g-3 needs-validation loginForm" action="/member/login" method="post">
                   <div class="col-12">
                     <label for="yourUsername" class="form-label">아이디</label>
                     <div class="input-group has-validation">
                       <input type="text" name="memberId" class="form-control" id="yourUsername" required="required">
                       <div class="invalid-feedback">아이디를 입력해주세요.</div>
                     </div>
                   </div>

                   <div class="col-12">
                     <label for="yourPassword" class="form-label">비밀번호</label>
                     <input type="password" name="memberPw" class="form-control" id="yourPassword" required="required">
                     <div class="invalid-feedback">비밀번호를 입력해주세요!</div>
                   </div>
	         		<c:if test="${result == 0}">
						<div class="alert alert-danger alert-dismissible fade show" role="alert">
	          					 사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.
	           				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	         			</div>
	                </c:if>
                   <div class="col-12"id="loginBtn">
                     <button class="btn btn-primary w-100" type="submit">로그인</button>
                   </div>
                   <div class="col-12">
                     <p class="small mb-0">계정이 없으신가요? <a href="/member/join">새로운 계정 만들기</a></p>
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
 </main>
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
</body>
<script type="text/javascript">
	$(".loginBtn").click(function() {
		$(".loginForm").submit();
	});
</script>
</html>