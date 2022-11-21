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

		<button type="button" class="btn btn-secondary"
			style="user-select: auto;" id="backBtn">뒤로가기</button>
		<button type="button" class="btn btn-info" style="user-select: auto;"
			id="basketBtn">장바구니 담기</button>
		<input type="text" class="inputCount" value="1"> <span>
			<button class="minus_btn">-</button>
			<button class="plus_btn">+</button>
		</span>
		<form action="/book/list" id="operForm" method="get">
			<input type="hidden" name="bno" value="${info.bno}"> <input
				type="hidden" name="pageNum" value="${cri.pageNum}"> <input
				type="hidden" name="amount" value="${cri.amount}">
		</form>

		<form action=""></form>

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
	let countValue = $(".inputCount").val();
	$(".plus_btn").on("click", function() {
		$(".inputCount").val(++countValue);
	});
	$(".minus_btn").on("click", function() {
		if (quantity > 1) {
			$(".inputCount").val(--countValue);
		}
	});

	function cartAlert(result) {
		if (result == '0')
			alert("장바구니 추가 불가");
		else if (result == '1')
			alert("장바구니 추가 완료");
		else if (result == '2')
			alert("장바구니에 이미 추가가 되어있습니다.");
	}

	$(function() {

		//뒤로가기 
		$("#backBtn").on("click", function() {
			self.location = "/book/list";
		})
	});

	//장바구니 추가
	$("#basketBtn").on("click", function() {

		const image = '${info.image}';
		const title = '${info.title}';
		const discount = '${info.discount}';
		const category = '${info.category}';
		const bno = '${info.bno}';
		const count = $(".inputCount").val();
		const totalPrice = discount * count;

		const data = {
			bno : bno,
			title : title,
			discount : discount,
			category : category,
			image : image,
			count : count,
			totalPrice : totalPrice
		};

		$.ajax({
			url : "/cart/addCart",
			type : "post",
			data : data,
			success : function(result) {
				cartAlert(result);
				self.location = "/cart/list";
			},
			error : function(error) {
				console.log(error);
			}
		});
	});
</script>
</html>