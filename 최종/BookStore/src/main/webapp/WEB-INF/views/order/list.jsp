<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../menu.jsp"%>
<!-- 다음주소 -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
/* table{
	border-collapse:collapse;
} */
.memberInfo_table {
	border-top: 2px solid #82C7B3;
}

.address_btn {
	width: 100%;
}

.goods_table {
	width: 100%;
}

.goods_table tr {
	height: 150px;
}

.goods_table_title_td {
	padding-left: 25px;
}

.goods_table tr {
	border-bottom: 2px solid #82C7B3;
}

.point_table {
	border-top: 2px solid #82C7B3;
	padding-top: 15px;
}

.total_info_div {
	padding: 15px;
}

.strong_red {
	color: #FF7493;
}

.total_price_red {
	font-size: 25px;
}

.total_price_label {
	margin-top: 5px;
}

.total_info_btn_div {
	border-top: 1px solid #82C7B3;
	text-align: center;
}

.order_point_input_btn {
	margin-left: 30px;
}

#img {
	width: 100px;
	height: 100px;
}

th, td {
	text-align: center;
	vertical-align: middle;
}

.order_point_input {
	width: 50%;
}

.pinput {
	display: flex;
	justify-content: center;
}
</style>
<main id="main" class="main">
	<div class="pagetitle">
		<h1>주문목록</h1>
	</div>
	<section class="section">
		<div class="col-log-12">
			<div class="row">
				<div class="col-lg-9">
					<div class="card">
						<h5 class="card-title"></h5>
						<!-- 회원 정보 -->
						<div class="member_info_div card-body">
							<table class="memberInfo_table table table-hover">
								<tr>
									<th style="width: 25%;" scope="col">주문자</th>
									<td style="width: *" scope="col">${memberInfo.memberName}
										| ${memberInfo.memberMail}</td>
								</tr>
							</table>
							<div class="row">
								<div class="col-md-6">
									<button class="address_btn address_btn_1 btn btn-primary"
										onclick="showAdress('1')">사용자 정보 주소록</button>
								</div>
								<div class="col-md-6">
									<button class="address_btn address_btn_2 btn btn-secondary"
										onclick="showAdress('2')">직접 입력</button>
								</div>
							</div>
						</div>
						<!-- 배송지 정보 -->
						<div class="card-body addressInfo_div">
							<div class="addressInfo_input_div addressInfo_input_div_1"
								style="display: block">
								<table class="table table-hover col-lg-12">
									<colgroup>
										<col width="25%">
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">이름</th>
											<td>${memberInfo.memberName}</td>
										</tr>
										<tr>
											<th scope="row">주소</th>
											<td>${memberInfo.memberAddr1} ${memberInfo.memberAddr2}<br>${memberInfo.memberAddr3}
												<input class="selectAddress" value="T" type="hidden">
												<input class="addressee_input"
												value="${memberInfo.memberName}" type="hidden"> <input
												class="address1_input" type="hidden"
												value="${memberInfo.memberAddr1}"> <input
												class="address2_input" type="hidden"
												value="${memberInfo.memberAddr2}"> <input
												class="address3_input" type="hidden"
												value="${memberInfo.memberAddr3}">
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="addressInfo_input_div addressInfo_input_div_2"
								style="display: none">
								<table class="col-lg-12">
									<colgroup>
										<col width="25%">
										<col width="*">
									</colgroup>
									<tbody>
										<tr
											style="border-bottom: 1px solid #eee; border-top: 1px solid #eee;">
											<th class="col-md-6" scope="row">이름</th>
											<td class="col-md-6" style="padding: 10px;"><input
												class="addressee_input form-control"></td>
										</tr>
										<tr style="border-bottom: 1px solid #eee;">
											<th class="col-md-6" scope="row">주소</th>
											<td class="col-md-6" style="padding: 10px;"><input
												class="selectAddress" value="F" type="hidden"> <input
												class="address1_input form-control" readonly="readonly"
												style="float: left; width: 60%">
											<button style="float: right;"
													class="btn btn-primary address_search_btn"
													onclick="execution_daum_address()">주소 찾기</button>
												<br> <input class="address2_input form-control"
												readonly="readonly"> <input
												class="address3_input form-control" readonly="readonly">
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- 상품 정보 -->
						<div class="card-body orderGoods_div">
							<!-- 상품 종류 -->
							<div class="goods_kind_div">
								<h4>
									주문상품 <span class="goods_kind_div_kind"></span>종 <span
										class="goods_kind_div_count"></span>권
								</h4>
							</div>
							<!-- 상품 테이블 -->
							<table class="goods_subject_table table table-hover">
								<colgroup>
									<col width="15%">
									<col width="45%">
									<col width="40%">
								</colgroup>
								<tbody>
									<tr class="table-primary">
										<th scope="row">이미지</th>
										<th scope="row">상품 정보</th>
										<th scope="row">판매가</th>
									</tr>
								</tbody>
							</table>
							<table class="goods_table">
								<colgroup>
									<col width="15%">
									<col width="45%">
									<col width="40%">
								</colgroup>
								<tbody>
									<c:forEach items="${orderList}" var="ol">
										<tr>
											<td><img src="${ol.image}" id="img"></td>
											<td class="goods_table_title_td">${ol.title}</td>
											<td class="goods_table_price_td"><fmt:formatNumber
													value="${ol.salePrice}" pattern="#,### 원" /> | 수량
												${ol.bookCount}개 <br>
											<fmt:formatNumber value="${ol.totalPrice}" pattern="#,### 원" />
												<br>[<fmt:formatNumber value="${ol.totalPoint}"
													pattern="#,### 원" />P] <input type="hidden"
												class="individual_bookPrice_input" value="${ol.price}">
												<input type="hidden" class="individual_salePrice_input"
												value="${ol.salePrice}"> <input type="hidden"
												class="individual_bookCount_input" value="${ol.bookCount}">
												<input type="hidden" class="individual_totalPrice_input"
												value="${ol.salePrice * ol.bookCount}"> <input
												type="hidden" class="individual_point_input"
												value="${ol.point}"> <input type="hidden"
												class="individual_totalPoint_input" value="${ol.totalPoint}">
												<input type="hidden" class="individual_bno_input"
												value="${ol.bno}"></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- 포인트 정보 -->
						<div class="card-body point_div">
							<h3>포인트 사용</h3>
							<table class="point_table table table-hover">
								<colgroup>
									<col width="25%">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>포인트 사용</th>
										<td class="pinput">${memberInfo.point} | <input
											class="order_point_input form-control" value="0">원
											<button
												class="order_point_input_btn order_point_input_btn_N btn btn-primary"
												data-state="N">모두사용</button>
											<button
												class="order_point_input_btn order_point_input_btn_Y btn btn-secondary"
												data-state="Y" style="display: none;">사용취소</button>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- 주문 요청 form -->
					<form class="order_form" action="/order/list" method="post">
						<!-- 주문자 회원 번호 -->
						<input name="memberId" value="${memberInfo.memberId}"
							type="hidden">
						<!-- 주소록 & 받는이 -->
						<input name="addressee" type="hidden"> <input
							name="memberAddr1" type="hidden"> <input
							name="memberAddr2" type="hidden"> <input
							name="memberAddr3" type="hidden">
						<!-- 사용 포인트 -->
						<input name="usePoint" type="hidden">
						<!-- 상품 정보 -->
					</form>
				</div>
				<div class="col-lg-3">
					<div class="card">
						<div class="card-body login_success_area">
							<div class="card-title">회원 : ${memberInfo.memberName}</div>
							<div class="card-title">
								포인트 :
								<fmt:formatNumber value="${memberInfo.point}" pattern="#,###" />
							</div>
						</div>
					</div>
					<!-- 주문 종합 정보 -->
					<div class="card">
						<div class="card-body total_info_div">
							<!-- 가격 종합 정보 -->
							<div class="total_info_price_div">
								<div>
									<span class="price_span_label"><b>상품금액 </b></span> <span
										class="totalPrice_span">1000000</span>원
								</div>
								<div>
									<span class="price_span_label"><b>배송비 </b></span> <span
										class="delivery_price_span">0</span>원
								</div>
								<div>
									<span class="price_span_label"><b>할인금액 </b></span> <span
										class="usePoint_span">1000000</span>원
								</div>
								<div class="price_total_div">
									<strong class="price_span_label total_price_label">최종
										결제 금액 </strong> <strong class="strong_red"> <span
										class="total_price_red finalTotalPrice_span">1500000</span>원
									</strong>
								</div>
								<div class="point_div">
									<span class="price_span_label">적립예정 포인트 </span> <span
										class="totalPoint_span">7960원</span>
								</div>
							</div>
							<!-- 버튼 영역 -->
							<div class="total_info_btn_div d-grid gap-2 mt-3">
								<button class="order_btn btn btn-success btn-lg">결제하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</main>
<script>
	$(document).ready(function() {

		/* 주문 조합정보란 최신화 */
		setTotalInfo();
	})

	/* 주소입력란 버튼 동작(숨김, 등장) */
	function showAdress(className) {
		/* 컨텐츠 동작 */
		/* 모두 숨기기 */
		$(".addressInfo_input_div").css('display', 'none');
		/* 컨텐츠 보이기 */
		$(".addressInfo_input_div_" + className).css('display', 'block');

		/* 버튼 색상 변경 */
		/* 모든 색상 동일 */
		$(".address_btn").css('backgroundColor', '#5C636A');
		/* 지정 색상 변경 */
		$(".address_btn_" + className).css('backgroundColor', '#0B5ED7');
		/* selectAddress T/F */
		/* 모든 selectAddress F만들기 */
		$(".addressInfo_input_div").each(function(i, obj) {
			$(obj).find(".selectAddress").val("F");
		});
		/* 선택한 selectAdress T만들기 */
		$(".addressInfo_input_div_" + className).find(".selectAddress")
				.val("T");

	}

	/* 다음 주소 연동 */
	function execution_daum_address() {
		console.log("동작");
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
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
					// 추가해야할 코드
					// 주소변수 문자열과 참고항목 문자열 합치기
					addr += extraAddr;

				} else {
					addr += ' ';
				}

				// 제거해야할 코드
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				$(".address1_input").val(data.zonecode);
				$(".address2_input").val(addr);
				// 커서를 상세주소 필드로 이동한다.
				$(".address3_input").attr("readonly", false);
				$(".address3_input").focus();

			}
		}).open();

	}

	/* 포인트 입력 */
	// 0 이상 & 최대 포인트 수 이하
	$(".order_point_input").on("propertychange change keyup paste input",
			function() {

				const maxPoint = parseInt('${memberInfo.point}');

				let inputValue = parseInt($(this).val());

				if (inputValue < 0) {
					$(this).val(0);
				} else if (inputValue > maxPoint) {
					$(this).val(maxPoint);
				}

				/* 주문 조합정보란 최신화 */
				setTotalInfo();
			});
	/* 포인트 모두사용 취소 버튼
	 * Y : 모두사용 상태 / N : 모두 취소 상태
	 */
	$(".order_point_input_btn").on("click", function() {

		const maxPoint = parseInt('${memberInfo.point}');

		let state = $(this).data("state");

		if (state == 'N') {
			console.log("n동작");
			$(".order_point_input").val(maxPoint);
			$(".order_point_input_btn_Y").css("display", "inline-block");
			$(".order_point_input_btn_N").css("display", "none");
		} else if (state == 'Y') {
			console.log("Y동작");
			$(".order_point_input").val(0);
			$(".order_point_input_btn_Y").css("display", "none");
			$(".order_point_input_btn_N").css("display", "inline-block");
		}

		/* 주문 조합정보란 최신화 */
		setTotalInfo();
	});

	/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수)*/
	function setTotalInfo() {
		let totalPrice = 0;
		let totalCount = 0;
		let totalKind = 0;
		let totalPoint = 0;
		let deliveryPrice = 0;
		let usePoint = 0;
		let finalTotalPrice = 0;

		$(".goods_table_price_td").each(
				function(index, element) {
					// 총 가격
					totalPrice += parseInt($(element).find(
							".individual_totalPrice_input").val());
					// 총 개수
					totalCount += parseInt($(element).find(
							".individual_bookCount_input").val());
					// 총 마일리지
					totalPoint += parseInt($(element).find(
							".individual_totalPoint_input").val());
					//총 종류
					totalKind += 1;
				});

		/* 배송비 결정 */
		if (totalPrice >= 30000) {
			deliveryPrice = 0;
		} else if (totalPrice == 0) {
			deliveryPrice = 0;
		} else {
			deliveryPrice = 3000;
		}

		finalTotalPrice = totalPrice + deliveryPrice;
		console.log(totalPrice);
		console.log(deliveryPrice);
		console.log(finalTotalPrice);
		console.log(totalPrice + deliveryPrice);
		/* 사용 포인트 */
		usePoint = $(".order_point_input").val();

		finalTotalPrice = finalTotalPrice - usePoint;

		/* 값들 삽입 */
		// 총 가격
		$(".totalPrice_span").text(totalPrice.toLocaleString());
		// 총 개수
		$(".goods_kind_div_count").text(totalCount);
		// 총 마일리지
		$(".totalPoint_span").text(totalPoint.toLocaleString());
		// 배송비
		$(".delivery_price_span").text(deliveryPrice.toLocaleString());
		// 최종 가격(총 가격 + 배송비)
		$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
		// 할인가(포인트 사용 시)
		$(".usePoint_span").text(usePoint.toLocaleString());
		// 총 종류
		$(".goods_kind_div_kind").text(totalKind);
	}

	/* 주문 요청 */
	$(".order_btn")
			.on(
					"click",
					function() {
						/* 주소 정보 & 받는 이 */
						$(".addressInfo_input_div")
								.each(
										function(i, obj) {
											if ($(obj).find(".selectAddress")
													.val() === 'T') {
												$("input[name = 'addressee']")
														.val(
																$(obj)
																		.find(
																				".addressee_input")
																		.val());
												$("input[name = 'memberAddr1']")
														.val(
																$(obj)
																		.find(
																				".address1_input")
																		.val());
												$("input[name = 'memberAddr2']")
														.val(
																$(obj)
																		.find(
																				".address2_input")
																		.val());
												$("input[name = 'memberAddr3']")
														.val(
																$(obj)
																		.find(
																				".address3_input")
																		.val());
											}
										});
						/* 사용 포인트 */
						$("input[name='usePoint']").val(
								$(".order_point_input").val());

						/* 상품 정보 */
						let form_contents = '';
						$(".goods_table_price_td")
								.each(
										function(index, element) {

											let bno = $(element).find(
													".individual_bno_input")
													.val();
											let bookCount = $(element)
													.find(
															".individual_bookCount_input")
													.val();

											let bno_input = "<input name='orders[" + index + "].bno' type='hidden' value='"+bno+"'>";
											form_contents += bno_input;

											let bookCount_input = "<input name='orders[" + index + "].bookCount' type='hidden' value='"+bookCount+"'>";
											form_contents += bookCount_input;

										});
						$(".order_form").append(form_contents);

						/* 서버 전송 */
						$(".order_form").submit();
					});
</script>
<%@ include file="../footer.jsp"%>