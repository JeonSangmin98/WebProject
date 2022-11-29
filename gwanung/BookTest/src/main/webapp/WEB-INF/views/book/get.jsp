<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

.bookImg {
	padding: 10px;
	padding-left: 30px;
	padding-right: 30px;
	float: left;
}

.info-title {
	padding: 10px;
}

.bookInfo {
	padding: 30px;
}

.infoDiv {
	padding-bottom: 10px;
}

.pull-right {
	float: right;
}

.panel-body {
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 100px;
	padding-right: 100px;
}

.card {
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 100px;
	padding-right: 100px;
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

	<div class="infoDiv">
		<div class="card border-light bookInfo">
			<h3 class="card-header c_title">책 제목: ${info.title}</h3>
			<div class="col-lg-4 bookImg">
				<img src="${info.image}"
					class="d-block user-select-none img-responsive center-block">
			</div>
			<h5 class="card-title c_author">저자: ${info.author}</h5>
			<h5 class="card-title c_discount">가격: ${info.price}</h5>
			<p>
				<fmt:formatDate value="${info.pubdate}" pattern="yyyy-MM-dd" />
			</p>
			<p class="card-text">
				상세정보:<br> ${info.description}
			</p>
			<div class="bookBtn">
				<button type="button" class="btn btn-secondary"
					style="user-select: auto;" id="backBtn">뒤로가기</button>
				<button type="button" class="btn btn-info"
					style="user-select: auto;" id="basketBtn">장바구니</button>
				<input type="text" class="inputCount" value="1"> <span>
					<button class="minus_btn">-</button>
					<button class="plus_btn">+</button>
				</span>
			</div>
		</div>
	</div>

	<div class="card mb-3">
		<h3 class="card-header">리뷰</h3>
		<c:if test="${member.memberId != null}">
			<button id="addReviewBtn" type="button" class="btn btn-outline-info">새
				리뷰</button>
		</c:if>
		<div class="card-body">
			<ul class="list-group list-group-flush review">
			</ul>
		</div>
		<div class="card-review-footer"></div>
	</div>
	<div>
		<span class="badge bg-secondary" style="user-select: auto;">책
			한줄평</span>
	</div>
	<!-- 리뷰 창 -->
	<div class="modal" id="review-modal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">
						리뷰창<span></span>
					</h5>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>내용</label><input class="form-control" name="review"
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
						<label>작성자</label><input class="form-control reviewer"
							name="reviewer" value="reviewer" placeholder="${member.memberId}"
							value="${member.memberId}" disabled>
					</div>
					<div class="form-group">
						<label>작성일</label><input class="form-control" name="reviewDate"
							value="2022-11-18" disabled>
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
</body>
<script type="text/javascript" src="/resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/review.js"></script>
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
		else if (result == '5')
			alert("로그인이 필요합니다.");
	}

	$(function() {

		//뒤로가기 
		$("#backBtn").on("click", function() {
			self.location = "/book/list";
		})

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
									str += '<div class="pull-right">';
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
									str += '</div>';
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
				str += '<li class="page-item disabled"><a class="page-link" href="'
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
			bookCount : bookCount
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
<!-- <script>
	$(function() {
		/* console.log(replyService);
		console.log("JS TEST"); */
		/* 	var bnoValue = '${info.bno}';
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
										str += '<div class="pull-right">';
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
										str += '</div>';
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
					str += '<li class="page-item disabled"><a class="page-link" href="'
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
			});//reviewModalRemoveBtn.on("click" */
	});
</script> -->
</html>