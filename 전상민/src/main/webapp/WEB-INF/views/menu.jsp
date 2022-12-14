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
			<option value="T">??????</option>
			<option value="A">??????</option>
		</select> 
        <input type="text" placeholder="????????????" title="?????? ??????" name="keyword">
        <button class="btn btn-primary" type="submit" title="??????"><i class="bi bi-search"></i></button>
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
            <span class="d-none d-md-block dropdown-toggle ps-2">${member.memberName} ???</span>
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
                <span>????????????</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>
            <li>
              <a class="dropdown-item d-flex align-items-center" href="/member/login">
                <i class="bi bi-box-arrow-in-right"></i>
                <span>?????????</span>
              </a>
            </li>
			</c:if>
			
			<c:if test="${member != null}">
			<li class="dropdown-header">
              <h6>${member.memberName} ???</h6>
              <span>???????????????!</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>
            <li>
              <a class="dropdown-item d-flex align-items-center">
                <i class="bi bi-cash"></i>
                <span>???????????? : ${member.point}</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>
            <li>
              <a class="dropdown-item d-flex align-items-center" href="/member/info">
                <i class="bi bi-person"></i>
                <span>?????? ?????????</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>
            <li>
              <a class="dropdown-item d-flex align-items-center" href="/cart/list/${member.memberId}">
                <i class="bi bi-bag-check"></i>
                <span>????????????</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>
            <li>
              <a class="dropdown-item d-flex align-items-center" href="/order/list">
                <i class="bi bi-box-seam"></i>
                <span>?????? / ??????</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>
			 <li>
              <a class="dropdown-item d-flex align-items-center logoutBtn">
                <i class="bi bi-box-arrow-right"></i>
                <span>????????????</span>
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
	<form action="/book/category" class="categoryForm">
		<input type="hidden" name="category" class="hiddenCategory">
	</form>
  <ul class="sidebar-nav" id="sidebar-nav">
     <li class="nav-item">
      <a class="nav-link collapsed" href="/book/list">
        <i class="bi bi-book"></i>
        <span>?????? ??????</span>
      </a>
    </li><!-- End Dashboard Nav -->
    
    <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#" aria-expanded="false">
          <i class="bi bi-grid"></i><span>????????????</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="tables-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
          <li>
            <a class="history">
              <i class="bi bi-vector-pen"></i><span>??????</span>
            </a>
          </li>
          <li>
            <a class="travel">
              <i class="bi bi-flag"></i><span>??????</span>
            </a>
          </li>
          <li>
            <a class="religion">
              <i class="bi bi-people"></i><span>??????</span>
            </a>
          </li>
          <li>
            <a class="IT">
              <i class="bi bi-laptop"></i><span>IT</span>
            </a>
          </li>
        </ul>
      </li>
    
    <li class="nav-item">
      <a class="nav-link collapsed" href="/board/list">
        <i class="bi bi-layout-text-window-reverse"></i>
        <span>???????????????</span>
      </a>
    </li><!-- End Dashboard Nav -->
    
    <c:if test="${member == null}">
	 	<li class="nav-item">
	      <a class="nav-link collapsed" href="/member/login">
	        <i class="bi bi-box-arrow-in-right"></i>
	        <span>?????????</span>
	      </a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link collapsed" href="/member/join">
	        <i class="bi bi-person-plus"></i>
	        <span>????????????</span>
	      </a>
	    </li>
    </c:if>
    
    <c:if test="${member != null}">
	    <li class="nav-item">
	      <a class="nav-link collapsed" href="/cart/list/${member.memberId}">
	        <i class="bi bi-bag-check"></i>
	        <span>????????????</span>
	      </a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link collapsed" href="/order/list">
	        <i class="bi bi-box-seam"></i>
	        <span>?????? / ??????</span>
	      </a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link collapsed" href="/member/info">
	        <i class="bi bi-person"></i>
	        <span>?????? ?????????</span>
	      </a>
	    </li>
     	<li>
			<a class="nav-link collapsed logoutBtn">
				<i class="bi bi-box-arrow-right"></i>
				<span>????????????</span>
			</a>
        </li>
    </c:if>
  </ul>
</aside>

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
	//?????? ???????????? ??? ????????????
	//??????
	$(".history").on("click", function() {
		/* console.log("click history"); */
		$(".hiddenCategory").val("??????");
		$(".categoryForm").submit();
	});
	//??????
	$(".travel").on("click", function() {
		$(".hiddenCategory").val("??????");
		$(".categoryForm").submit();
	});
	//??????
	$(".religion").on("click", function() {
		$(".hiddenCategory").val("??????");
		$(".categoryForm").submit();
	});
	//IT
	$(".IT").on("click", function() {
		$(".hiddenCategory").val("IT");
		$(".categoryForm").submit();
	});
	var searchForm = $(".searchForm");

	// ?????? ??????
	$(".searchForm button").on('click', function() {
		if (!searchForm.find("option:selected").val()) {
			alert("????????? ????????? ?????????!");
			return false;
		}

		if (!searchForm.find("input[name='keyword']").val()) {
			alert("?????? ????????? ????????? ?????????!");
			return false;
		}
		searchForm.submit();
	});

	// ???????????? ??????	
	$(".logoutBtn").click(function() {
		$.ajax({
			type : "POST",
			url : "/member/logout",
			success : function(result) {
				alert('?????? ?????? ??????!!');
				document.location.reload();
			}
		});// end ajax
	});// end click
</script>