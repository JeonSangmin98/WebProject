<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
img {
	width: 100px;
	height: 100px;
}

th, td {
	text-align: center;
	vertical-align: middle;
}
</style>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="container" style="user-select: auto;">
		<div class="page-header" id="banner" style="user-select: auto;">
			<div class="row" style="user-select: auto;">
				<div class="col-lg-8 col-md-7 col-sm-6" style="user-select: auto;">
					<h1 style="user-select: auto;">장바구니</h1>
					<p class="text-info" style="user-select: auto;">장바구니 테스트</p>
				</div>
				<div class="col-lg-4 col-md-5 col-sm-6" style="user-select: auto;">
					<div class="sponsor" style="user-select: auto;"></div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<input type="checkbox" class="form-check-input checkAll"
			checked="checked"><label class="text-primary"><strong>전체
				선택</strong></label>
	</div>

	<table class="table table-hover table-info" style="user-select: auto;">
		<thead style="user-select: auto;">
			<tr style="user-select: auto;">
				<th scope="col" style="user-select: auto;"></th>
				<th scope="col" style="user-select: auto;">사진</th>
				<th scope="col" style="user-select: auto;">도서명</th>
				<th scope="col" style="user-select: auto;">카테고리</th>
				<th scope="col" style="user-select: auto;">가격</th>
				<th scope="col" style="user-select: auto;">수량</th>
				<th scope="col" style="user-select: auto;"></th>
			</tr>
		</thead>
		<tbody style="user-select: auto;">
			<c:forEach items="${cartList}" var="cart">
				<tr class="table-light" style="user-select: auto;">
					<td style="user-select: auto;" class="cartTotal"><input
						type="checkbox" class="form-check-input checkCart"
						checked="checked"><input type="hidden"
						class="hiddenCartDiscount" value="${cart.discount}"> <input
						type="hidden" class="hiddenCartCount" value="${cart.count}"></td>
					<td style="user-select: auto;"><img src="${cart.image}"></td>
					<td style="user-select: auto;">${cart.title}</td>
					<td style="user-select: auto;">${cart.category}</td>
					<td style="user-select: auto;">${cart.discount}</td>
					<td style="user-select: auto;">
						<div>
							<button class="btn btn-outline-dark minusBtn" type="button">-</button>
							<input type="text" class="input-sm countValue" value="1">
							<button class="btn btn-outline-dark plusBtn" type="button">+</button>
							<button class="btn btn-dark updateCountBtn" data-cartBno="${cart.cartBno}">변경</button>
						</div>
					</td>
					<td style="user-select: auto;">
						<button class="btn btn-danger deleteBtn"
							data-cartBno="${cart.cartBno}">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<%--수량 수정 form --%>
	<form action="/cart/update" method="post" class="updateForm">
		<input type="hidden" name="cartBno" class="updateCartBno"> <input
			type="hidden" name="count" class="updateCartCount">
	</form>


	<%--삭제 form --%>
	<form action="/cart/delete" method="post" class="deleteForm">
		<input type="hidden" name="cartBno" class="deleteCartBno">
	</form>


	<div class="container">
		<p>
			총 가격: <span class="totalPrice text-warning"></span>원
		</p>
		<p>
			총 수량: <span class="totalCount text-muted"></span>개
		</p>
		<button type="button" class="btn btn-primary"
			style="user-select: auto;">구매하기</button>
		<button type="button" class="btn btn-warning"
			style="user-select: auto;">대여하기</button>
	</div>

</body>
<script type="text/javascript" src="/resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">


	//장바구니 수량 조절 +
	$(".plusBtn").on("click", function() {
		var countValue = $(this).parent("div").find("input").val(); 
		$(this).parent("div").find("input").val(++countValue);
	});

	//장바구니 수량 조절 -
	$(".minusBtn").on("click", function() {
		var countValue = $(this).parent("div").find("input").val();
		if(countValue > 1){
			$(this).parent("div").find("input").val(--countValue);
		}
	});
	
	//장바구니 수량 수정 버튼 -> 최종 DB 전달
	$(".updateCountBtn").on("click", function () {
		var cartBno = $(this).data("cartbno");
		var count = $(this).parent("td").find("input").val();
		//수량 변경 버튼 클릭 시 Controller를 통해 DB에 전달
		$(".updateCartBno").val(cartBno); 
		$(".updateCartCount").val(count);
		$(".updateForm").submit(); 
	})
	
	
	

	//장바구니 총 수량 가격 정보
	function setCartTotal() {

		var totalPrice = 0; //총 가격
		var totalCount = 0; // 총 개수

		$(".cartTotal").each(function(index, element) {

			if ($(element).find(".checkCart").is(":checked") === true) { //체크 여부 확인 | element td객체의 체크박스가 checked 상태면 true 반환
				totalPrice += parseInt($(element).find( // 총 가격  | 
				".hiddenCartDiscount").val());
				totalCount += parseInt($(element).find( // 총 개수
				".hiddenCartCount").val());
			}
			// 전달받은 값 삽입
			$(".totalPrice").text(totalPrice.toLocaleString()); //통화 형식으로 출력 toLocaleString() 추가
			$(".totalCount").text(totalCount);
		});
	}

	$(document).ready(function() {

		setCartTotal();
	});

	//체크박스 체크 여부 정보 변경
	$(".checkCart").on("change", function() {
		setCartTotal($(".cartTotal"));
	});

	//삭제 버튼 클릭 시 장바구니 품목 삭제
	//마지막 장바구니 값만 삭제되는 오류 해결 -> 동적 데이터값은 id 가아닌 class로 받아와야함... 동적 checkbox 구현 중 생각남 
	$(".deleteBtn").on("click", function(e) {
		e.preventDefault();
		/* console.log("click delete"); */
		var cartBno = $(this).data("cartbno");
		console.log(cartBno);
		$(".deleteCartBno").val(cartBno);
		$(".deleteForm").submit();
	});

	//전체 체크 클릭 시 체크 일괄 on off
	$(".checkAll").on("click", function() {
		if ($(".checkAll").prop("checked")) {
			$(".checkCart").prop("checked", true);
		} else {
			$(".checkCart").prop("checked", false);
		}

		setCartTotal($(".cartTotal"));
	});
</script>

</html>