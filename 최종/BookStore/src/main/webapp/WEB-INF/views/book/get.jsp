<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="/resources/js/review.js"></script>
<%@ include file="../menu.jsp"%>
<style>
.pull-right {
	float: right;
}

.bookBtn {
	padding-bottom: 20px;
	padding-top: 20px;
}

.numBtn {
	display: flex;
	padding: 10px;
}

.plus, .minus {
	margin: auto 0;
}

.inCnt {
	padding: 0px 5px 0px 5px;
}
</style>
<main id="main" class="main">
	<div class="pagetitle">
		<h1>도서 상세정보</h1>
	</div>

	<form action="/book/list" id="operForm" method="get">
		<input type="hidden" name="bno" value="${info.bno}"> <input
			type="hidden" name="pageNum" value="${cri.pageNum}"> <input
			type="hidden" name="amount" value="${cri.amount}">
	</form>

	<section class="section">
		<div class="row align-items-top">
			<div class="card">
				<div class="card-body">
					<div class="row g-0">
						<h1 class="card-title">제목 : ${info.title}</h1>
						<div class="col-md-4">
							<img src="${info.image}" class="img-fluid rounded-start image"
								data-bookCount="${info.bookCount}">
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-text">저자: ${info.author}</h5>
								<h5 class="card-text priceInfo">
									가격 :
									<fmt:formatNumber value="${info.price}" pattern="#,### 원" />
								</h5>
								<h5 class="card-text discountInfo">
									할인가 :
									<fmt:formatNumber
										value="${info.price - (info.price * (info.discount/100))}"
										pattern="#,### 원" />
								</h5>
								<p>
									적립 포인트: <span class="addPoint"></span> 원
								</p>
								<p>
									도서 출판일 :
									<fmt:formatDate value="${info.pubdate}" pattern="yyyy-MM-dd" />
								</p>
								<p class="card-text" style="text-overflow: ellipsis;">
									상세정보:<br> ${info.description}
								</p>
							</div>
						</div>
						<div class="bookBtn" style="padding-left: 10px;">
							<button type="button" class="btn btn-secondary" id="backBtn">뒤로가기</button>
							<button type="button" class="btn btn-info" id="basketBtn">장바구니
								담기</button>
						</div>
						<div class="col-md-4 numBtn">
							<div class="minus">
								<button class="btn btn-primary minusBtn">
									<i class="bi bi-bag-dash"></i>
								</button>
							</div>
							<div class="inCnt">
								<input type="number" class="inputCount form-control" value="1"
									min="1" max="${info.bookCount}"
									data-bookCount="${info.bookCount}">
							</div>
							<div class="plus">
								<button class="btn btn-primary plusBtn">
									<i class="bi bi-bag-plus"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="card">
				<h3 class="card-header">리뷰</h3>
				<c:if test="${member.memberId != null}">
					<div class="d-grid gap-2 mt-3">
						<button id="addReviewBtn" type="button"
							class="btn btn-outline-info">새 리뷰</button>
					</div>
				</c:if>
				<div class="card-body">
					<ul class="list-group list-group-flush review">
					</ul>
				</div>
				<div class="card-review-footer"></div>
			</div>
		</div>
	</section>


	<div class="modal fade" id="review-modal" tabindex="-1"
		style="display: none;" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">리뷰창</h5>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>내용</label> <input class="form-control" name="review"
							value="새로운 리뷰!!" maxlength="30" placeholder="최대 30자 까지 입력해주세요...">
					</div>
					<div class="form-group">
						<label>별점</label> <select class="form-select" id="rating"
							name="rating">
							<option value="1">★☆☆☆☆</option>
							<option value="2">★★☆☆☆</option>
							<option value="3">★★★☆☆</option>
							<option value="4">★★★★☆</option>
							<option value="5" selected>★★★★★</option>
						</select>
					</div>
					<div class="form-group">
						<label>작성자</label> <input class="form-control reviewer"
							name="reviewer" value="reviewer" placeholder="${member.memberId}"
							value="${member.memberId}" readonly="readonly">
					</div>
					<div class="form-group">
						<label>작성일</label> <input class="form-control" name="reviewDate"
							value="2022-11-18" readonly="readonly">
					</div>
				</div>
				<div class="modal-footer">
					<button id="review-modalRegisterBtn" type="button"
						class="btn btn-primary">등록</button>
					<button id="review-modalModBtn" type="button"
						class="btn btn-warning">수정</button>
					<button id="review-modalRemoveBtn" type="button"
						class="btn btn-danger">삭제</button>
					<button id="review-modalCloseBtn" type="button"
						class="btn btn-secondary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</main>
<script type="text/javascript" src="/resources/js/bookCount.js?ver=1"></script>
<script>
	$(function() {
		/* console.log(replyService);
		console.log("JS TEST"); */
		var bnoValue = '${info.bno}';
		var reviewUL = $(".review");

		showList(1);
		function showList(page) {
			reviewService
					.getList(
							{
								bno : bnoValue,
								page : page || 1
							},
							function(reviewCnt, list) {

								if (page == -1) {
									pageNum = Math.ceil(reviewCnt / 10.0);
									showList(pageNum);
									return;
								}// end if

								var str = "";
								if (list == null || list.length == 0) {
									reviewUL.html("");
									return;
								}// end if
								for (var i = 0, len = list.length || 0; i < len; i++) {
									console.log(list[i]);
									str += '<li class="list-group-item" data-reviewNo="' + list[i].reviewNo + '">';
									str += '<div>';
									str += '<div class="card-body">';
									str += '<strong>' + list[i].reviewer
											+ '</strong>';
									str += '<div class="pull-right"><h5>';
									str += '<span class="badge bg-warning">평점 : ';
									if (list[i].rating == 1) {
										str += '★☆☆☆☆ ';
									} else if (list[i].rating == 2) {
										str += '★★☆☆☆ ';
									} else if (list[i].rating == 3) {
										str += '★★★☆☆ ';
									} else if (list[i].rating == 4) {
										str += '★★★★☆ ';
									} else if (list[i].rating == 5) {
										str += '★★★★★ ';
									}
									str += list[i].rating + '</span>';
									str += '</h5></div>';
									str += '<small class="d-flex w-100 justify text-muted">'
											+ reviewService
													.displayTime(list[i].reviewDate)
											+ '</small>';
									str += '</div>';
									str += '<p>' + '<b> » </b> '
											+ list[i].review + '</p>';
									str += '</div>';
									str += '</li>';
								}// end for
								reviewUL.html(str);
								showReviewPage(reviewCnt);
							});
		}// end showList()

		var pageNum = 1;
		var reviewPageFooter = $(".card-review-footer");

		function showReviewPage(reviewCnt) {
			var endNum = Math.ceil(pageNum / 10.0) * 10;
			var startNum = endNum - 9;
			var prev = startNum != 1;
			var next = false;
			if (endNum * 10 >= reviewCnt) {
				endNum = Math.ceil(reviewCnt / 10.0);
			}
			if (endNum * 10 < reviewCnt) {
				next = true;
			}

			var str = '<div class="pull-right"><ul class="pagination">';
			if (prev) {
				str += '<li class="page-item readonly"><a class="page-link" href="'
						+ (startNum - 1) + '">«</a></li>';
			}
			for (var i = startNum; i <= endNum; i++) {
				var active = (pageNum == i) ? 'active' : '';
				str += '<li class="page-item active '+ active +'"><a class="page-link" href="'+i+'">'
						+ i + '</a></li>';
			}
			if (next) {
				str += '<li class="page-item"><a class="page-link" href="'
						+ (endNum + 1) + '">»</a></li>';
			}
			str += '</ul></div>';
			reviewPageFooter.html(str);
		}//showReviewPage()

		var reviewer = '${reply.reviewr}';
		reviewPageFooter.on('click', 'li a', function(e) {
			e.preventDefault();
			console.log("page click");
			if (reviewr === memberId) {
				var targetPageNum = $(this).attr('href');
				console.log('targetPageNum : ' + targetPageNum);
				pageNum = targetPageNum;
				showList(pageNum);
			}
		});//reviewPageFooter.on('click'

		var review_modal = $("#review-modal");

		var modalInputReview = review_modal.find("input[name='review']");
		var modalInputReviewer = review_modal.find("input[name='reviewer']");
		var modalInputReviewDate = review_modal
				.find("input[name='reviewDate']");
		var modalInputRating = review_modal.find("select[name='rating']");

		var reviewModalRegisterBtn = $("#review-modalRegisterBtn");
		var reviewModalModBtn = $("#review-modalModBtn");
		var reviewModalRemoveBtn = $("#review-modalRemoveBtn");

		let memberId = '${member.memberId}';

		$("#review-modalCloseBtn").click(function() {
			review_modal.modal('hide');
		});

		$("#addReviewBtn").click(function() {
			review_modal.find('input').val("");
			modalInputReviewDate.closest('div').hide();
			review_modal.find('button[id != "review-modalCloseBtn"]').hide();
			reviewModalRegisterBtn.show();
			review_modal.modal('show');
		});

		reviewModalRegisterBtn.on('click', function() {
			var review = {
				review : modalInputReview.val(),
				reviewer : modalInputReviewer.val(),
				rating : modalInputRating.val(),
				bno : bnoValue
			};
			reviewService.add(review, function(result) {
				alert(result);
				review_modal.find('input').val("");
				review_modal.modal('hide');
				showList(-1);
			});
		});//reviewModalRegisterBtn.on('click'

		reviewUL.on('click', 'li', function() {
			var reviewNo = $(this).data('reviewno');
			//console.log(reviewNo);
			reviewService.get(reviewNo, function(data) {
				console.log(data);
				modalInputReview.val(data.review);
				modalInputReviewer.val(data.reviewer);
				modalInputRating.val(data.rating);

				let d_reviewer = data.reviewer;
				console.log(d_reviewer);
				modalInputReviewDate.val(
						reviewService.displayTime(data.reviewDate)).attr(
						"readonly", "readonly");
				reviewModalRegisterBtn.hide();
				review_modal.data("reviewNo", data.reviewNo);
				if (d_reviewer == memberId || memberId == 'admin') {
					review_modal.modal("show");
				} else {
					alert('회원님의 리뷰가 아닙니다!!');
				}

				review_modal.find('button[id != "review-modalCloseBtn"]')
						.hide();
				reviewModalModBtn.show();
				reviewModalRemoveBtn.show();
			});
		});//reviewUL.on('click','li'

		reviewModalModBtn.on('click', function() {
			var review = {
				reviewNo : review_modal.data('reviewNo'),
				review : modalInputReview.val(),
				rating : modalInputRating.val(),
				bno : bnoValue
			};
			reviewService.update(review, function(result) {
				alert(result);
				review_modal.modal("hide");
				showList(pageNum);
			});
		});//reviewModalModBtn.on('click'

		reviewModalRemoveBtn.on("click", function() {
			var reviewNo = review_modal.data("reviewNo");
			reviewService.remove(reviewNo, function(result) {
				alert(result);
				review_modal.modal("hide");
				showList(pageNum);
			});
		});//reviewModalRemoveBtn.on("click"
	});
</script>
<script type="text/javascript">
	let countValue = $(".inputCount").val();
	let bookCount = $(".inputCount").data("bookcount");
	/* console.log(bookCount); */
	$(".plusBtn").on("click", function() {
		if (bookCount > countValue)
			$(".inputCount").val(++countValue);
	});

	$(".minusBtn").on("click", function() {
		if (countValue > 1) {
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
		else if (result == '5')
			alert("로그인이 필요합니다.");
		else if (result == '6')
			alert("해당 상품이 품절입니다.");
	}

	$(function() {
		//뒤로가기 
		$("#backBtn").on("click", function() {
			self.location = "/book/list";
		})

		//적립 포인트
		let salePrice = '${info.price - (info.price * (info.discount/100))}';
		let point = salePrice * 0.05;
		point = Math.floor(point);
		$(".addPoint").text(point);

	});

	//장바구니 추가
	$("#basketBtn").on("click", function() {

		const image = '${info.image}';
		const title = '${info.title}';
		const price = '${info.price}';
		const category = '${info.category}';
		const bno = '${info.bno}';
		const cartCount = $(".inputCount").val();
		const totalPrice = price * cartCount;
		const memberId = '${member.memberId}';
		const discount = '${info.discount}';
		const bookCount = '${info.bookCount}';

		const data = {
			bno : bno,
			title : title,
			price : price,
			category : category,
			image : image,
			cartCount : cartCount,
			totalPrice : totalPrice,
			memberId : memberId,
			discount : discount,
			bookCount : bookCount,
		};

		$.ajax({
			url : "/cart/addCart",
			type : "post",
			data : data,
			success : function(result) {
				cartAlert(result);
			},
			error : function(error) {
				console.log(error);
			}
		});
	});
</script>
<%@ include file="../footer.jsp"%>