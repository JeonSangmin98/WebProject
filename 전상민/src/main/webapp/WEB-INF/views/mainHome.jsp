<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="./menu.jsp" />
<main id="main" class="main">
    <div class="pagetitle">
      <h1>Book Store</h1>
    </div><!-- End Page Title -->

	<section class="section">
		<div class="row align-items-top">
	    	<div class="col-lg-12">
				<div class="card">
			  		<div class="card-body">
			    		<h5 class="card-title">이달의 상품</h5>
					</div>
				</div><!-- End Default Card -->
			</div>
		</div>
	</section>
</main>
<!-- <div class="card">
	<div class="card-body">
		<h1 class="card-title">Book Store</h1>
		<p class="text-primary">이 달의 상품</p>
	</div>
</div> -->

	<!-- <div style="text-align: center;">
		<h1>BookStore</h1>
		<p class="text-primary">이 달의 상품</p>
	</div>
	
	<div style="border: 1px solid black;">
		<p style="text-align: center;">test</p>
	</div> -->
</body>
</html>