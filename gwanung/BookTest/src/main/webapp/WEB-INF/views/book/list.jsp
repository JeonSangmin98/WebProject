<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book store</title>
<link href="/resources/css/bootstrap.min.css?ver=1" rel="stylesheet">
<style type="text/css">
img {
	width: 200px;
	height: 200px;
}

.bookList ul {
	list-style: none;
}

.bookList ul li {
	display: inline-block;
	padding: 10px;
}

#modal {
	display: none;
}

.pageNum {
	float: right;
}
</style>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="container" style="user-select: auto;">
		<div class="page-header" id="banner" style="user-select: auto;">
			<div class="row" style="user-select: auto;">
				<div class="col-lg-8 col-md-7 col-sm-6" style="user-select: auto;">
					<h1 style="user-select: auto;">전체 도서</h1>
					<p class="text-info" style="user-select: auto;">도서 목록</p>
				</div>
				<div class="col-lg-4 col-md-5 col-sm-6" style="user-select: auto;">
					<div class="sponsor" style="user-select: auto;"></div>
				</div>
			</div>
		</div>
	</div>

	<div class="container"
		style="user-select: auto; border: 1px solid #ccc;">
		<div class="container bookList">
			<ul id="imgClick">
				<c:forEach items="${bookList}" var="book">
					<li><a class="move" href="${book.bno}"><img class="image"
							src="${book.image}" data-bookCount="${book.bookCount}"></a></li>
				</c:forEach>
			</ul>
		</div>

		<div style="user-select: auto;" class="pageNum">
			<ul class="pagination" style="user-select: auto;">
				<c:if test="${pageMaker.prev}">
					<li class="page-item previous"><a
						href="${pageMaker.startPage-1}" class="page-link">&laquo;</a></li>
				</c:if>
				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li
						class="page-item pageBno ${pageMaker.cri.pageNum==num?'active':''}"><a
						href="${num}" class="page-link">${num}</a></li>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<li class="page-item next"><a href="${pageMaker.endPage+1}"
						class="page-link">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
		<!--  페이징 처리 -->
		<form action="/book/list" class="actionForm">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		</form>
	</div>

</body>
<script type="text/javascript" src="/resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/bookCount.js?ver=1"></script>
<script type="text/javascript">
	const actionForm = $(".actionForm");

	$(".pageBno a").on("click", function(e) {
		e.preventDefault(); // a태그 역할 봉인
		console.log("click pageBno");
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});

	$(".move").on(
			"click",
			function(e) {
				e.preventDefault();
				actionForm.append("<input type='hidden' name='bno' value='"
						+ $(this).attr("href") + "'>");
				actionForm.attr("action", "/book/get");
				actionForm.submit();
			});
</script>
</html>