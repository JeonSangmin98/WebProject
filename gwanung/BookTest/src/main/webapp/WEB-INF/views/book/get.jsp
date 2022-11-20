<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 상세정보</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
img {
	width: 400px;
	height: 400px;
	text-align: center;
}
</style>
</head>
<body>

	<jsp:include page="../menu.jsp" />
	<div class="container" style="user-select: auto;">
		<div class="page-header" id="banner" style="user-select: auto;">
			<div class="row" style="user-select: auto;">
				<div class="col-lg-8 col-md-7 col-sm-6" style="user-select: auto;">
					<h1 style="user-select: auto;">도서 상세정보</h1>
					<p class="text-info" style="user-select: auto;">상세정보 테스트</p>
				</div>
				<div class="col-lg-4 col-md-5 col-sm-6" style="user-select: auto;">
					<div class="sponsor" style="user-select: auto;"></div>
				</div>
			</div>
		</div>
	</div>

	<div class="col-lg-4 col-md-4 col-sm-4" style="user-select: auto;">
		<img src="${info.image}" class="img-responsive center-block">
	</div>
	<div class="col-lg-4 col-md-4 col-sm-4" style="user-select: auto;">
		<p class="c_title">책 제목: ${info.title}</p>
		<p class="c_author">저자: ${info.author}</p>
		<p class="c_discount">가격: ${info.discount}</p>
		<p>
			<fmt:formatDate value="${info.pubdate}" pattern="yyyy-MM-dd" />
		</p>
		<p>
			상세정보:<br> ${info.description}
		</p>

		<button type="button" class="btn btn-primary"
			style="user-select: auto;">구매하기</button>
		<button type="button" class="btn btn-info" style="user-select: auto;"
			id="basketBtn">장바구니</button>
		<button type="button" class="btn btn-warning"
			style="user-select: auto;">대여하기</button>
		<button type="button" class="btn btn-secondary"
			style="user-select: auto;" id="backBtn">뒤로가기</button>
		<form action="/book/list" id="operForm" method="get">
			<input type="hidden" name="bno" value="${board.bno}"> <input
				type="hidden" name="pageNum" value="${cri.pageNum}"> <input
				type="hidden" name="amount" value="${cri.amount}">

		</form>

	</div>
	<hr>
	<div>
		<span class="badge bg-secondary" style="user-select: auto;">책
			한줄평</span>
	</div>

</body>
<script type="text/javascript" src="/resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {

		//뒤로가기 
		$("#backBtn").on("click", function() {
			self.location = "/book/list";
		})
	});

	//장바구니 추가
	$("#basketBtn").on("click", function() {

		var image = '${info.image}';
		var title = '${info.title}';
		var discount = '${info.discount}';
		var category = '${info.category}';
		var bno = '${info.bno}';

		var data = {
			bno : bno,
			title : title,
			discount : discount,
			category : category,
			image : image,
		};

		$.ajax({
			url : "/cart/addCart",
			type : "post",
			data : data,
			success : function(result) {
				alert("성공");
				self.location = "/cart/list";
			},
			error : function(error) {
				console.log(error);
			}
		});
	});
</script>
</html>