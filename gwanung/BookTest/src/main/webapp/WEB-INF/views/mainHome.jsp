<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<link href="/resources/css/bootstrap.min.css?ver=1" rel="stylesheet">
<!-- <style type="text/css">
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
</style> -->
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

ul, li {
	list-style: none;
}

a {
	text-decoration: none;
	color: inherit;
}

.list_wrap {
	width: 50%;
	min-width: 1000px;
	max-width: 1200px;
	margin: 0 auto;
	padding: 100px;
}

.list_wrap .item {
	display: inline-block;
	width: 30%;
	margin-top: 40px;
	margin-left: 5%;
	box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2);
}

.list_wrap .item .image {
	width: 100%;
	height: 300px;
	background-color: #ddd;
	background-repeat: no-repeat;
	background-position: 50% 50%;
	background-size: cover;
}

.list_wrap ul {
	font-size: 0;
}

.list_wrap .item:nth-child(-n+2) {
	margin-top: 0;
}

.list_wrap .item:nth-child(3n-2) {
	margin-left: 0;
}

.list_wrap .item .cont {
	padding: 20px;
}

.list_wrap .item strong {
	display: block;
	margin: 15px 0 10px 0;
	letter-spacing: -1px;
	font-size: 16px;
}

.list_wrap .item p {
	display: inline-block;
	margin-top: 10px;
	padding: 5px 10px;
	background: #eee;
	font-size: 13px;
	letter-spacing: -1px;
}
</style>
</head>
<body>
	<jsp:include page="menu.jsp" />

	<div style="text-align: center;">
		<h1>BookStore</h1>
		<p class="text-primary">할인 높은 순</p>
	</div>

	<%-- 	<div class="container"
		style="user-select: auto; border: 1px solid #ccc;">
		<div class="container bookList">
			<ul id="imgClick">
				<c:forEach items="${discount}" var="book">
					<li><a class="move" href="${book.bno}"><img
							src="${book.image}"></a></li>
				</c:forEach>
			</ul>
		</div>
	</div> --%>

	<div class="list_wrap">
		<ul>
			<c:forEach items="${discount}" var="book">
				<li class="item"><a class="move" href="${book.bno}"><img
						class="image" src="${book.image}"
						data-bookcount="${book.bookCount}"></a>
					<div class="cont">
						<strong>${book.title}</strong>
						<p class="text-muted">${book.discount}%할인</p>
					</div></li>
			</c:forEach>
		</ul>
	</div>

	<div style="text-align: center;">
		<p class="text-primary">인기 도서</p>
	</div>

	<div class="list_wrap">
		<ul>
			<c:forEach items="${popular}" var="book">
				<li class="item"><a class="move" href="${book.bno}"><img
						class="image" src="${book.image}"
						data-bookCount="${book.bookCount}"></a>
					<div class="cont">
						<strong>${book.title}</strong>
						<p class="text-muted">${book.discount}%할인</p>
					</div></li>
			</c:forEach>
		</ul>
	</div>



	<a href="https://www.flaticon.com/kr/free-icons/" title="매진 아이콘">매진
		아이콘 제작자: Freepik - Flaticon</a>
	<form action="/mainHome" class="actionForm"></form>

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

/* 	$(".image").each(function(index, element) {
		if ($(element).data("bookcount") == 0) {
			$(element).attr("src", "/resources/img/soldout.png");
		}
	}); */
</script>
</html>