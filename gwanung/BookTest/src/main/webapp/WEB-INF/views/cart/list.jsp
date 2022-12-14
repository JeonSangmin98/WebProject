<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link href="/resources/css/bootstrap.min.css?ver=1" rel="stylesheet">
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
						class="hiddenCartTotalPrice" value="${cart.totalPrice}"> <input
						type="hidden" class="hiddenCartCount" value="${cart.cartCount}">
						<input type="hidden" class="hiddenPrice" value="${cart.price}">
						<input type="hidden" class="hiddenbookCount"
						value="${cart.bookCount}"> <input type="hidden"
						class="hiddenPoint" value="${cart.point}"> <input
						type="hidden" class="hiddenTotalPoint" value="${cart.totalPoint}">
						<!-- 구매 input --> <input type="hidden" class="hiddenBookBno"
						value="${cart.bno}">
					<td style="user-select: auto;"><img src="${cart.image}"></td>
					<td style="user-select: auto;">${cart.title}</td>
					<td style="user-select: auto;">${cart.category}</td>
					<td style="user-select: auto;">${cart.totalPrice}</td>
					<td style="user-select: auto;">
						<div>
							<button class="btn btn-outline-dark minusBtn" type="button">-</button>
							<input type="text" class="input-sm countValue"
								value="${cart.cartCount}" name="cartCount">
							<button class="btn btn-outline-dark plusBtn" type="button">+</button>
						</div>
						<button class="btn btn-dark updateCountBtn"
							data-cartBno="${cart.cartBno}">변경</button>
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
			type="hidden" name="cartCount" class="updateCartCount"> <input
			type="hidden" name="memberId" value="${member.memberId}">
	</form>


	<%--삭제 form --%>
	<form action="/cart/delete" method="post" class="deleteForm">
		<input type="hidden" name="cartBno" class="deleteCartBno"> <input
			type="hidden" name="memberId" value="${member.memberId}">
	</form>

	<!-- 주문 form -->
	<form action="/order/list/${member.memberId}" method="get"
		class="orderForm"></form>

	<div class="container">
		<p>
			총 수량: <span class="totalCount text-warning"></span>개
		</p>
		<p>
			할인 가격: <span class="totalPrice text-warning"></span>원
		</p>
		<p>
			총 적립 포인트 : <span class="totalPoint text-info"></span>원
		</p>
		<p>
			배송비 : <span class="deliveryCost text-info"></span>원
		</p>
		<p>
			총 결제 금액 : <span class="finalTotalPrice text-info"></span>원
		</p>
		<button type="button" class="btn btn-primary orderBtn"
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
		let countValue = $(this).parent("div").find("input").val();
		$(this).parent("div").find("input").val(++countValue);
	});

	//장바구니 수량 조절 -
	$(".minusBtn").on("click", function() {
		let countValue = $(this).parent("div").find("input").val();
		if (countValue > 1) {
			$(this).parent("div").find("input").val(--countValue);
		}
	});

	//장바구니 수량 수정 버튼 -> 최종 DB 전달
	$(".updateCountBtn").on("click", function() {
		let cartBno = $(this).data("cartbno");
		let cartCount = $(this).parent("td").find("input").val();
		//수량 변경 버튼 클릭 시 Controller를 통해 DB에 전달
		$(".updateCartBno").val(cartBno);
		$(".updateCartCount").val(cartCount);
		$(".updateForm").submit();
	})

	//장바구니 총 수량 가격 정보
	function setCartTotal() {

		let totalPrice = 0; // 총 가격
		let totalCount = 0; // 총 개수
		let totalKind = 0; // 상품 총 종류
		let totalPoint = 0; // 총 마일리지
		let deliveryCost = 0; // 배송비
		let finalTotalPrice = 0; // 최종 가격

		$(".cartTotal").each(function(index, element) {

			if ($(element).find(".checkCart").is(":checked") === true) { //체크 여부 확인 | element td객체의 체크박스가 checked 상태면 true 반환
				totalPrice += parseInt($(element).find( // 총 가격   
				".hiddenCartTotalPrice").val());
				totalCount += parseInt($(element).find( // 총 개수
				".hiddenCartCount").val());
				totalKind += 1; // 총 종류 
				totalPoint += parseInt($(element).find( // 총 마일리지
				".hiddenTotalPoint").val());
			}

			if (totalPrice >= 40000) // 총 금액 4만원 이상 배달비 무료
				deliveryCost = 0;
			else if (totalPrice == 0) //상품이 없는 경우
				deliveryCost = 0;
			else
				deliveryCost = 3000;

			finalTotalPrice = totalPrice + deliveryCost; // 최종 가격 = 총 가격 + 배송비

			// 전달받은 값 삽입
			$(".totalPrice").text(totalPrice.toLocaleString()); //통화 형식으로 출력 toLocaleString() 추가
			$(".finalTotalPrice").text(finalTotalPrice.toLocaleString());
			$(".totalPoint").text(totalPoint.toLocaleString());
			$(".totalCount").text(totalCount);
			$(".deliveryCost").text(deliveryCost);
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
		let cartBno = $(this).data("cartbno");
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

	/* 주문 페이지 이동 */
	$(".orderBtn")
			.on(
					"click",
					function() {

						if ($(".totalPrice").text() == undefined
								|| $(".totalPrice").text() == 0) {
							alert("장바구니에 담긴 물품이 없습니다.");
						} else {
							let form_contents = '';
							let orderNumber = 0;

							$(".cartTotal")
									.each(
											function(index, element) {
												if ($(element).find(
														".checkCart").is(
														":checked") === true) {

													let bno = $(element).find(
															".hiddenBookBno")
															.val();
													let bookCount = $(element)
															.find(
																	".hiddenCartCount")
															.val();
													let inputBno = "<input name='orders[" + orderNumber + "].bno' type='hidden' value='" + bno + "'>";
													form_contents += inputBno;

													let inputBookCount = "<input name='orders[" + orderNumber + "].bookCount' type='hidden' value='" + bookCount + "'>";
													form_contents += inputBookCount;

													orderNumber += 1;
												}
											});
							$(".orderForm").html(form_contents);
							$(".orderForm").submit();
						}
					});
</script>

</html>