<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<!-- <link rel="stylesheet" href="/resources/css/bootstrap.css"> -->
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
<style>
</style>
</head>
<body>
<header id="header" class="header fixed-top d-flex align-items-center header-scrolled">
    <div class="d-flex align-items-center justify-content-between">
      <a href="/mainHome" class="logo d-flex align-items-center">
        <img src="/resources/assets/img/logo.png" alt="">
        <span class="d-none d-lg-block">Book Store</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <div class="search-bar">
      <form class="search-form d-flex align-items-center" action="/book/searchList">
      	<select class="form-select" name="type">
						<option value="" selected>----</option>
						<option value="T">제목</option>
						<option value="A">저자</option>
		</select> 
        <input type="text" placeholder="도서검색" title="도서 검색">
        <button class="btn btn-primary" type="submit" title="검색"><i class="bi bi-search"></i></button>
      </form>
    </div><!-- End Search Bar -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item d-block d-lg-none">
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li><!-- End Search Icon-->
		
        <li class="nav-item dropdown pe-3">
          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
          	<c:if test="${member != null}">
            <img src="/resources/assets/img/profile-img.jpg" alt="Profile" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2">${member.memberName} 님</span>
            </c:if>
            <c:if test="${member == null}">
            	<i class="bi bi-person"></i>
            </c:if>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
			<c:if test="${member == null}">
			<li class="dropdown-header">
              <h6>Guest</h6>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>
            <li>
              <a class="dropdown-item d-flex align-items-center" href="/member/join">
                <i class="bi bi-person-plus"></i>
                <span>회원가입</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>
            <li>
              <a class="dropdown-item d-flex align-items-center" href="/member/login">
                <i class="bi bi-box-arrow-in-right"></i>
                <span>로그인</span>
              </a>
            </li>
			</c:if>
			
			<c:if test="${member != null}">
			<li class="dropdown-header">
              <h6>${member.memberName} 님</h6>
              <span>반갑습니다!</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>
            <li>
              <a class="dropdown-item d-flex align-items-center" href="/member/info">
                <i class="bi bi-person"></i>
                <span>마이 페이지</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>
            <li>
              <a class="dropdown-item d-flex align-items-center" href="/cart/list/${member.memberId}">
                <i class="bi bi-bag-check"></i>
                <span>장바구니</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>
			 <li>
              <a class="dropdown-item d-flex align-items-center logoutBtn">
                <i class="bi bi-box-arrow-right"></i>
                <span>로그아웃</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>
			</c:if>
          </ul><!-- End Profile Dropdown Items -->
        </li>
      </ul>
    </nav><!-- End Icons Navigation -->
</header>
 
  
<aside id="sidebar" class="sidebar">
  <ul class="sidebar-nav" id="sidebar-nav">
  
    <li class="nav-item">
      <a class="nav-link collapsed" href="/book/list">
        <i class="bi bi-grid"></i>
        <span>도서 리스트</span>
      </a>
    </li><!-- End Dashboard Nav -->
    
    <li class="nav-item">
      <a class="nav-link collapsed" href="/board/list">
        <i class="bi bi-layout-text-window-reverse"></i>
        <span>자유게시판</span>
      </a>
    </li><!-- End Dashboard Nav -->
    
  <!--   <li class="nav-item">
      <a class="nav-link collapsed" href="#">
        <i class="bi bi-layout-text-window-reverse"></i>
        <span>주문</span>
      </a>
    </li>End Dashboard Nav -->
  </ul>
</aside>
 
  
<%-- <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="/mainHome">Book Store</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarColor01">
      <ul class="navbar-nav me-auto">
      <c:if test="${member == null}">
        <li class="nav-item">
          <a class="nav-link active" href="/member/join">회원가입</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/member/login">로그인</a>
        </li>
      </c:if>
      
      <c:if test="${member != null}">
        <li class="nav-item">
          <a class="nav-link" href="/member/info"><b class="text-muted">${member.memberName}</b>회원님</a>
        </li>
        <li class="nav-item">
          <a class="nav-link logoutBtn">로그아웃</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/member/info">마이페이지</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/cart/list/${member.memberId}">장바구니</a>
        </li>
      </c:if>
      
      	<li class="nav-item">
          <a class="nav-link" href="/book/list">도서리스트</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">대여</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">주문/배송</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/board/list">자유게시판</a>
        </li>
      </ul>
      
      <form class="d-flex searchForm" action="/book/searchList">
      	<select class="form-control search-select text-secondary" name="type">
						<option value="">--</option>
						<option value="T">제목</option>
						<option value="A">저자</option>
					</select> 
        <input class="form-control me-sm-2" type="text" placeholder="도서검색">
        <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav> --%>

	<%-- <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<div class="container-fluid">
			<a class="navbar-brand" href="/mainHome">Book Store</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarColor01"
				aria-controls="navbarColor01" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarColor01">
				<ul class="navbar-nav me-auto">
					<c:if test="${member == null}">
						<li class="nav-item"><a class="nav-link" href="/member/join">회원가입</a></li>
						<li class="nav-item"><a class="nav-link" href="/member/login">로그인</a></li>
					</c:if>

					<c:if test="${member != null}">
						<li class="nav-item"><a class="nav-link" href="/member/info">
							<strong class="text-muted">${member.memberName}</strong> 회원님</a></li>
						<li class="nav-item"><a class="nav-link logoutBtn">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link" href="/member/info">마이페이지</a></li>
						<li class="nav-item"><a class="nav-link" href="/cart/list/${member.memberId}">장바구니</a></li>
					</c:if>
					<li class="nav-item"><a class="nav-link" href="/book/list">도서 리스트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">도서 대여</a></li>
					<li class="nav-item"><a class="nav-link" href="#">주문 / 배송</a></li>
					<li class="nav-item"><a class="nav-link" href="/board/list">자유 게시판</a></li>
				</ul>
				<form class="d-flex searchForm" action="/book/searchList">
					<select class="form-control search-select text-secondary" name="type">
						<option value="">--</option>
						<option value="T">제목</option>
						<option value="A">저자</option>
					</select> 
					<input class="form-control me-sm-2" type="text" placeholder="도서 검색" name="keyword">
					<button class="btn btn-secondary my-2 my-sm-0" type="submit">검색</button>
				</form>
			</div>
		</div>
	</nav> --%>
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
<script>
	var searchForm = $(".searchForm");

	// 검색 기능
	$(".searchForm button").on('click', function() {
		if (!searchForm.find("option:selected").val()) {
			alert("종류를 선택해 주세요!");
			return false;
		}

		if (!searchForm.find("input[name='keyword']").val()) {
			alert("검색 내용을 입력해 주세요!");
			return false;
		}
		searchForm.submit();
	});

	// 로그아웃 버튼	
	$(".logoutBtn").click(function() {
		$.ajax({
			type : "POST",
			url : "/member/logout",
			success : function(result) {
				alert('로그 아웃 완료!!');
				document.location.reload();
			}
		});// end ajax
	});// end click
</script>